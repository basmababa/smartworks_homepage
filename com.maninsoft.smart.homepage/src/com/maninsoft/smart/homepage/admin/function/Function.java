package com.maninsoft.smart.homepage.admin.function;

public class Function {

	private static Function instance = new Function();

	public static Function getInstance(){
		return instance;
	}

	private Function() {
	}

	/**
	 * 일반형 Title 리턴
	 * @param title String
	 * @return String
	 */
	public String getTitle(String rootDir, String title) {
		String strTitle = "";
		strTitle =		"  <table cellSpacing='0' cellPadding='0' width='94%' border='0' align='center'>";
		strTitle +=		"    <tr>";
		strTitle +=		"      <td>";
		strTitle +=		"      <TABLE cellSpacing='0' cellPadding='0' width='180' bgColor='#d9d9d9' border='0'>";
		strTitle +=		"        <TR>";
		strTitle +=		"          <TD vAlign='top' width='1%' height='20'><IMG src='" + rootDir + "/admin/common/images/top_left.gif' width='4' height='4'></TD>";
		strTitle +=     "          <TD class='taptitle' vAlign='bottom' align='middle'>" + title + "</TD>";
		strTitle +=     "          <TD vAlign='top' align='right' width='1%'><IMG src='" + rootDir + "/admin/common/images/top_right.gif' width='4' height='4'></TD>";
		strTitle +=     "        </TR>";
		strTitle +=     "      </TABLE>";
		strTitle +=     "    </td>";
		strTitle +=     "  </tr>";
		strTitle +=     "  <tr>";
		strTitle +=     "    <td height='5' bgColor='#d9d9d9'></td>";
		strTitle +=		"  </tr>";
		strTitle +=     "</table>";
		return strTitle;
	}

	/**
	 * 두칸형
	 * @param rootDir String
	 * @param title String
	 * @param width String
	 * @return String
	 */
	public String getTitle2(String rootDir, String title, String width) {
		String strTitle = "";
		strTitle =      "  <table cellSpacing='0' cellPadding='0' width='" + width + "' border='0'>";
		strTitle +=     "    <tr>";
		strTitle +=     "      <td>";
		strTitle +=     "      <TABLE cellSpacing='0' cellPadding='0' width='180' bgColor='#d9d9d9' border='0'>";
		strTitle +=     "        <TR>";
		strTitle +=     "          <TD vAlign='top' width='1%' height='20'><IMG src='" + rootDir + "/admin/common/images/top_left.gif' width='4' height='4'></TD>";
		strTitle +=     "          <TD class='taptitle' vAlign='bottom' align='middle'>" + title + "</TD>";
		strTitle +=     "          <TD vAlign='top' align='right' width='1%'><IMG src='" + rootDir + "/admin/common/images/top_right.gif' width='4' height='4'></TD>";
		strTitle +=     "        </TR>";
		strTitle +=     "      </TABLE>";
		strTitle +=     "    </td>";
		strTitle +=     "  </tr>";
		strTitle +=     "  <tr>";
		strTitle +=     "    <td height='5' bgColor='#d9d9d9'></td>";
		strTitle +=     "  </tr>";
		strTitle +=     "</table>";
		return strTitle;
	}

	/**
	 * 점선 그리기
	 * @param rootDir String
	 * @return String
	 */
	public String getDotLine(String rootDir) {
		String strDotLine = "";
		strDotLine = 	"<table width='94%' border='0' align='center' cellpadding='0' cellspacing='0'>";
		strDotLine +=   "  <tr>";
		strDotLine += 	"    <td background='" + rootDir + "/admin/common/images/line.gif' height='1'></td>";
		strDotLine += 	"  </tr>";
		strDotLine += 	"</table>";
		return strDotLine;
	}

	/**
	 * 1x1 공백을위한 이미지스트링 리턴
	 * @param rootDir String
	 * @param height int
	 * @return String
	 */
	public String getBlank(String rootDir, int height) {
		String strBlank = "";
		strBlank = "<IMG height='" + height + "' src='" + rootDir + "/admin/common/images/1x1.gif' align='middle'>";
		return strBlank;
	}

	/**
	 * 버튼 Area 상단
	 * @param rootDir String
	 * @param color String
	 * @return String
	 */
	public String getBoxTop(String rootDir, String color ) {
		String strBoxTop = "";
		strBoxTop = 	"<table width='94%' border='0' cellpadding='0' cellspacing='0' bgcolor='" + color + "' align='center'>";
		strBoxTop +=	"  <tr>";
		strBoxTop += 	"    <td width='50%' valign='top'><IMG src='" + rootDir + "/admin/common/images/top_left.gif' width='4' height='4'></td>";
		strBoxTop += 	"    <td width='50%' align='right' valign='top'><IMG src='" + rootDir + "/admin/common/images/top_right.gif' width='4' height='4'></td>";
		strBoxTop += 	"  </tr>";
		strBoxTop += 	"  <tr>";
		strBoxTop += 	"    <td colspan='2' align='center'>";
		return strBoxTop;
	}

	/**
	 * boxBottom string
	 * @param rootDir String
	 * @return String
	 */
	public String getBoxBottom(String rootDir) {
		String strBoxBottom = "";
		strBoxBottom =	"    </td>";
		strBoxBottom +=	"  </tr>";
		strBoxBottom += "  <tr>";
		strBoxBottom += "    <td width='50%' valign='bottom'><IMG src='" + rootDir + "/admin/common/images/bottom_left.gif' width='4' height='4'></td>";
		strBoxBottom += "    <td width='50%' align='right' valign='bottom'><IMG src='" + rootDir + "/admin/common/images/bottom_right.gif' width='4' height='4'></td>";
		strBoxBottom += "  </tr>";
		strBoxBottom += "</table>";
		return strBoxBottom;
	}

	/**
	 * Admin Paging
	 * @param rootDir String
	 * @param totalCount int
	 * @param pageSize int
	 * @param page int
	 * @param fnc String
	 * @return String
	 */
	public String postPageIndex(String rootDir, int totalCount, int pageSize, int page,  String fnc) {

		int blockCount = 10;                               //블락의 단위(다음/이전 큰페이지)
	    int pageCount = (totalCount - 1) / pageSize + 1;       //전체 페이지의수
	    String strPaging = "";

	    int blockpage = (( page - 1) / blockCount) * blockCount + 1;

	    //처음
	    if (page == 1) {
	    	strPaging = "<input type='button' class='btn_page' name='' value='<<' />";
	    } else {
	    	strPaging = "<input type='button' class='btn_page' name='' value='<<' onClick='javascript:" + fnc + "(1)' />";
	    }

	    //이전 blockCount개
	    if (page == 1 || (blockpage - blockCount) < 1) {
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='<' />";
	    } else {
	    	int blockLinkPage = blockpage - 1;// - blockCount;
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='<' onClick='javascript:" + fnc + "(" + blockLinkPage + ")' />";
	    }

	    strPaging = strPaging + "&nbsp;&nbsp;";

	    //각 페이지
	    int i = 1;
	    int forpage = blockpage;
	    if (forpage > 0) {
	    	while (!(i > blockCount || forpage > pageCount)) {
	    		if (forpage == page) {
	    			strPaging = strPaging + "<span class='paging'><b>[" + forpage + "]</b></span>";
	    		} else {
	    			strPaging = strPaging + "<a href='javascript:" + fnc + "(" + forpage + ")' class='paging'>[" + forpage + "]</a>";
	    		}
	    		forpage = forpage + 1;
	    		i = i + 1;
	    	}
	    }

	    //다음 blockCount개
	    strPaging = strPaging + "&nbsp;&nbsp;";
	    if ((blockpage + blockCount) > pageCount) {
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='>' />";
	    } else {
	    	int blockLinkPage = blockpage + blockCount;
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='>' onClick='javascript:" + fnc + "(" + blockLinkPage + ")' />";
	    }

	    //마지막
	    if (page == pageCount) {
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='>>' />";
	    } else {
	    	strPaging = strPaging + "<input type='button' class='btn_page' name='' value='>>' onClick='javascript:" + fnc + "(" + pageCount + ")' />";
	    }
	    return strPaging;
	}

	/**
	 * GroupWare용 TitleBox
	 * @param rootDir String
	 * @param title String
	 * @return String
	 */
	public String getTitleBox(String rootDir, String title ) {
		String strTitleBox = "";
		strTitleBox =  "<div id='conTitle'>";
		strTitleBox += "  <table border='0' cellpadding='0' cellspacing='0' width='100%'>";
		strTitleBox += "    <tr>";
		strTitleBox += "      <td width='' class='conTitle_line3'>";
		strTitleBox += "        <img src='" + rootDir + "/icon_title_arrow.gif' align='absmiddle' alt='' />&nbsp;&nbsp;" + title;
		strTitleBox += "      </td>";
		strTitleBox += "      <td class='conTitle_line1'>&nbsp;</td>";
		strTitleBox += "    </tr>";
		strTitleBox += "  </table>";
		strTitleBox += "</div>";
		return strTitleBox;
	}

	/**
	 * GroupWare용 TipBox
	 * @param rootDir String
	 * @param tip String
	 * @return String
	 */
	public String getTipBoxTop(String rootDir) {
		String strTipBox = "";
		strTipBox =  "<div id='conTip'>";
		strTipBox += "  <table border='0' cellpadding='8' cellspacing='0'>";
		strTipBox += "    <tr>";
		strTipBox += "      <td valign='top' width='40px'>";
		strTipBox += "        <img src='" + rootDir + "/icon_tip.gif' alt='' />";
		strTipBox += "      </td>";
		strTipBox += "      <td class='text_tip'>";
		return strTipBox;
	}

	/**
	 * GroupWare용 TipBox
	 * @param rootDir String
	 * @param tip String
	 * @return String
	 */
	public String getTipBoxBottom() {
		String strTipBox = "";
		strTipBox += "      </td>";
		strTipBox += "    </tr>";
		strTipBox += "  </table>";
		strTipBox += "</div>";
		return strTipBox;
	}

	/**
	 * GroupWare용 SimpleBox 상단
	 * @return String
	 */
	public String getSimpleBoxTop(int padding, String align) {
		String strSimpleBox = "";
		strSimpleBox =  "<div class='simpleBox'>";
		strSimpleBox += "  <table border='0' cellpadding='" + padding + "' cellspacing='0' width='100%'>";
		strSimpleBox += "    <tr>";
		strSimpleBox += "      <td align='" + align + "'>";
		return strSimpleBox;
	}

	/**
	 * GroupWare용 SimpleBox 하단
	 * @return String
	 */
	public String getSimpleBoxBottom() {
		String strSimpleBox = "";
		strSimpleBox += "      </td>";
		strSimpleBox += "    </tr>";
		strSimpleBox += "  </table>";
		strSimpleBox += "</div>";
		return strSimpleBox;
	}

}