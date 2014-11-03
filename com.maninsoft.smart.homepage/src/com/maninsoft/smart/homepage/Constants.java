package com.maninsoft.smart.homepage;

import java.util.*;

public class Constants {
	public final static String CONFIGURATION_PROPERTIES = "com.maninsoft.smart.homepage.config";

    public static final String SMTP_HOST = getProperty(CONFIGURATION_PROPERTIES, "SMTP_HOST");
    public static final String SMTP_ID = getProperty(CONFIGURATION_PROPERTIES, "SMTP_ID");
    public static final String SMTP_PW = getProperty(CONFIGURATION_PROPERTIES, "SMTP_PW");

    // 파일서버 디렉토리(경로) 정보
    public static final String HOME_ROOT = getProperty(CONFIGURATION_PROPERTIES, "HOME_ROOT");
    public static final String HOME_URL = getProperty(CONFIGURATION_PROPERTIES, "HOME_URL");

    public static final String DATA_ROOT = getProperty(CONFIGURATION_PROPERTIES, "DATA_ROOT");
    public static final String DATA_URL =getProperty(CONFIGURATION_PROPERTIES, "DATA_URL");

    public static final String RESOURCE_ROOT = getProperty(CONFIGURATION_PROPERTIES, "RESOURCE_ROOT");
    public static final String RESOURCE_URL = getProperty(CONFIGURATION_PROPERTIES, "RESOURCE_URL");

    // SMS 설정 정보
    public static final String SOCKET_HOST = getProperty(CONFIGURATION_PROPERTIES, "SOCKET_HOST");
    public static final String SOCKET_PORT = getProperty(CONFIGURATION_PROPERTIES, "SOCKET_PORT");
    public static final String ICODE_ID = getProperty(CONFIGURATION_PROPERTIES, "ICODE_ID");
    public static final String ICODE_PW = getProperty(CONFIGURATION_PROPERTIES, "ICODE_PW");
    public static final String SENDER_NUMBER = getProperty(CONFIGURATION_PROPERTIES, "SENDER_NUMBER");

    public static String getProperty(String property, String name) {
        try {
            ResourceBundle bundle = ResourceBundle.getBundle(property);
            return bundle.getString(name);
        } catch (Exception ex) {
            return null;
        }
    }


}
