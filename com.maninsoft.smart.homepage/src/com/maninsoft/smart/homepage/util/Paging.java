package com.maninsoft.smart.homepage.util;

public class Paging {

    private static Paging instance = new Paging();

    public static Paging getInstance () {
        return instance;
    }

    private Paging() {
    }

    /**
     * 게시판류에서 사용되는 페이징
     * 디자인 별도
     * @param rootDir String
     * @param totalCount int
     * @param pageSize int
     * @param page int
     * @param fnc String
     * @return String
     */
	public String postPageIndex(String rootDir, int totalCount, int pageSize, int page,  String fnc) {

		int blockCount = 10;									//블락의 단위(다음/이전 큰페이지)
		int pageCount = (totalCount - 1) / pageSize + 1;		//전체 페이지의수
		String strPaging = "<table border='0' cellpadding='0' cellspacing='0'><tr>";

		int blockpage = ((page-1)/blockCount)*blockCount+1;

	    //처음
	    if (page == 1) {
	    	strPaging += "<td><img src='" + rootDir + "/btn_prev02.gif' align='middle' class='pd_2' alt='처음' title='처음'> ";
	    } else {
	    	strPaging += "<td><a href='javascript:" + fnc + "(1)'><img src='" + rootDir + "/btn_prev02.gif' align='middle' class='pd_2' alt='처음' title='처음'></a> ";
	    }

	    //이전 blockCount개
	    if (page == 1 || (blockpage - blockCount) < 1) {
	    	strPaging += "<td><img src='" + rootDir + "/btn_prev01.gif' align='middle' class='pd_2' alt='이전' title='이전'></td> ";
	    } else {
	    	int blockLinkPage = blockpage - 1;// - blockCount;
	    	strPaging += "<td><a href='javascript:" + fnc + "(" + blockLinkPage + ")'><img src='" + rootDir + "/btn_prev01.gif' align='middle' class='pd_2' alt='이전' title='이전'></a></td> ";
	    }
	
	    strPaging += "<td width='10'></td>";

	    //각 페이지
		int i = 1;
		int forpage = blockpage;
		if (forpage > 0) {
			while (!(i > blockCount || forpage > pageCount)) {
				if (forpage == page) {
					strPaging += "<td width='10' align='center' class='text_66_b'>" + forpage + "</td>";
				} else {
					strPaging += "<td width='10' align='center' class='text_66'><a href='javascript:" + fnc + "(" + forpage + ")'>" + forpage + "</a></td>";
				}
				forpage = forpage + 1;
				i = i + 1;
			}
		}

		//다음 blockCount개
		strPaging = strPaging + "<td width='10'></td>";
		if ((blockpage + blockCount) > pageCount) {
			strPaging += " <td><img src='" + rootDir + "/btn_next01.gif' align='middle' class='pd_2' alt='다음' title='다음'></td> ";
		} else {
			int blockLinkPage = blockpage + blockCount;
			strPaging += " <td><a href='javascript:" + fnc + "(" + blockLinkPage + ")'><img src='" + rootDir + "/btn_next01.gif' align='middle' class='pd_2' alt='다음' title='다음'></a></td> ";
		}

		//마지막
		if (page == pageCount) {
			strPaging += "<td><img src='" + rootDir + "/btn_next02.gif' align='middle' class='pd_2' alt='마지막' title='마지막'></td>";
		} else {
			strPaging += "<td><a href='javascript:" + fnc + "(" + pageCount + ")'><img src='" + rootDir + "/btn_next02.gif' align='middle' class='pd_2' alt='마지막' title='마지막'></a></td>";
		}

		strPaging += "</tr></table>";
		return strPaging;
	}

}
