package com.maninsoft.smart.homepage.request;

import org.apache.commons.xfileupload.*;
import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

public class Request {
	public static String TEMPORARY_REPOSITORY = null;
	private boolean _debug = false;

	private Hashtable _params = new Hashtable();
	private Hashtable _files = new Hashtable();
	private HttpServletRequest _request = null;
	private boolean _isMultipart = false;
	private List _formdata = null;

	private String _cachedContextURL = null;
	private String _cachedBaseURL = null;

	public Request(HttpServletRequest request) throws Exception {
		if(TEMPORARY_REPOSITORY == null){
			TEMPORARY_REPOSITORY = "/tmp/";
		}
		_request = request;
	}

	public String getContextURL() {
		if(_cachedContextURL == null) {
			_cachedContextURL = Servlet.getContextURL(_request);
		}
		return _cachedContextURL;
	}

	public String getBaseURL() {
		if(_cachedBaseURL == null) {
			_cachedBaseURL = Servlet.getBaseURL(_request);
		}
		return _cachedBaseURL;
	}

	public boolean isAuthorized(String role) {
		if (_request.isUserInRole(role)) {
			return true;
		}
		return false;
	}
	
	public String getContextPath() {
		return _request.getContextPath();
	}

	public Enumeration getParameterNames() {
		return _params.keys();
	}

	public String getParameter(String name) {
		try{
			if (_isMultipart) {
				Vector<String> values = (Vector<String>)_params.get(name);
				if (values == null || values.size() == 0){
					return null;
				}
				String value = values.elementAt(values.size() - 1);
				if (value.equals("")) { return null; }
				return value;
			} else {
				return _request.getParameter(name);
			}
		} catch (Exception ex) {
			return null;
		}
	}

	public String getString(String name) {
		return getParameter(name);
	}

	public int getInt(String name) {
		String value = getString(name);
		if(value != null) {
			return Integer.parseInt(value);
		}
		return -1;
	}

	public double getDouble(String name) {
		String value = getString(name);
		if(value != null) {
			return Double.parseDouble(value);
		}
		return -1;
	}

	public boolean getBoolean(String name) {
		String value = getString(name);
		if(value != null) {
			if (value.equalsIgnoreCase("on") || value.equalsIgnoreCase("true") || value.equalsIgnoreCase("1")) {
				return true;
			}
		}
		return false;
	}

	public String[] getParameterValues(String name) {
		try {
			if (_isMultipart) {
				Vector values = (Vector) _params.get(name);
					if (values == null || values.size() == 0) {
						return null;
					}
					String[] value_arry = new String[values.size()];
					values.copyInto(value_arry);
					return value_arry;
			} else {
				return _request.getParameterValues(name);
			}
		} catch (Exception e) {
			return null;
		}
	}

	public int[] getInts(String name) {
		String[] values = getParameterValues(name);
		if(values == null || values.length < 1)
			return null;

		int[] int_values = new int[values.length];
		for (int i = 0; i < values.length; i++) {
			try {
				int_values[i] = Integer.parseInt(values[i]);
			} catch (NumberFormatException ex) {
				// ignore;
			}
		}
		return int_values;
	}

	public long[] getLongValues(String name) {
		String[] values = getParameterValues(name);
		if (values == null || values.length < 1)
			return null;

		long[] int_values = new long[values.length];
		for (int i = 0; i < values.length; i++) {
			try {
				int_values[i] = Long.parseLong(values[i]);
			} catch (NumberFormatException ex) {
				// ignore;
			}
		}
		return int_values;
	}

	public boolean hasFile() {
		return (_files.isEmpty() ? false : true);
	}

	public Enumeration getFileParameterNames() {
		return _files.keys();
	}

	public Vector<FileParameter> getFiles(String name) {
		return (Vector<FileParameter>)_files.get(name);
	}

	protected void parseQueryString(String queryString) {
		String[] params = queryString.split("&");
		for (int i = 0; i < params.length; i++) {
			if (params[i] != null) {
				String[] param = params[i].split("=");
				if (param[0] != null) {
					Vector existingValues = (Vector)_params.get(param[0]);
					if (existingValues == null) {
						existingValues = new Vector();
						_params.put(param[0], existingValues);
					}
					existingValues.addElement(param[1]);
				}
			}
		}
	}

	protected void parse() throws Exception {
		_isMultipart = FileUpload.isMultipartContent(_request);
		if (_debug) {
			System.out.println(_isMultipart ? "TYPE: MULTIPART/FORM-DATA" : "TYPE: ONLY TEXT/FORM-DATA");
		}

		if(_isMultipart) {
			// URL QueryString Data Parse..
			String URLQueryString = _request.getQueryString();
			if (_request.getQueryString() != null) {
				if (!_request.getQueryString().equals("")) {
					parseQueryString(URLQueryString);
				}
			}

			// POST Data Parse..
			// Create a new file upload handler
			FileUpload uploader = new FileUpload();

			// Set upload parameters
			uploader.setSizeThreshold(1000);
			uploader.setSizeMax(2048*1024*1024); // 2GB까지 허용
			uploader.setRepositoryPath(TEMPORARY_REPOSITORY);

			// Parse the request
			_formdata = uploader.parseRequest( _request );
			Iterator iter = _formdata.iterator();
			while (iter.hasNext()) {
				Object obj = iter.next();
				if (_debug) {
					System.out.println( "Iteration next().");
				}

				if (_debug) {
					System.out.println( "obj instanceof Parameter ? " + (obj instanceof Parameter));
				}

				if (obj instanceof FileParameter) {
					// File Parameter
					FileParameter param = (FileParameter)obj;
					if (_debug) {
						System.out.println( "fieldname: " + param.getName() + ", fieldvalue: " + param.getValue() + ", filename: " +  param.getFileName() + ", path: " + param.getStoreLocation().getPath() + ", size: " + param.getSize());
					}

					Vector<FileParameter> existingValues = (Vector<FileParameter>)_files.get(param.getName());
					if (existingValues == null) {
						existingValues = new Vector<FileParameter>();
						_files.put(param.getName(), existingValues);
					}
					existingValues.addElement(param);
				} else {
					// Text Parameter
					Parameter param = (Parameter)obj;
					if (_debug) {
						System.out.println( "fieldname: " + param.getName()+ ", fieldvalue: " + param.getValue());
					}

					Vector<String> existingValues = ( Vector<String> )_params.get(param.getName());
					if (existingValues == null) {
						existingValues = new Vector<String>();
						_params.put(param.getName(), existingValues);
					}
					existingValues.addElement(param.getValue());
				}
			}
		}
	}
}

