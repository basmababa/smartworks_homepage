package com.maninsoft.smart.homepage.util;

public class ConvertText {

    private static ConvertText instance = new ConvertText();

    public static ConvertText getInstance() {
        return instance;
    }

    private ConvertText() {
    }
    
    /**
     * 문자열을 length 단위로 자르기
     * @param str
     * @param len
     * @param tail
     * @return
     */
    public String strLengthSlice(String str, int len, String tail) {
        if (str == null)
        	return null;

        if (str.length() < len)
            return str;

        String tmpTail = tail;
        if (tail == null)
            tmpTail = "";

        int tailLen = tmpTail.length();
        if (tailLen > len)
            return "";

        return str.substring(0, len) + tmpTail;
    }
    
    /**
     * 문자열을 byte 단위로 자르기
     * @param str String
     * @param len int
     * @param tail String
     * @return String
     */
	public String strSlice(String str, int len, String tail) {
        if (str == null)
        	return null;

        int srcLen = realLength(str);
        if (srcLen < len)
            return str;

        String tmpTail = tail;
        if (tail == null)
            tmpTail = "";

        int tailLen = realLength(tmpTail);
        if (tailLen > len)
            return "";

        char a;
        int i = 0;
        int realLen = 0;
        for (i = 0; i < len - tailLen && realLen < len - tailLen; i++) {
            a = str.charAt(i);
            if ((a & 0xFF00) == 0)
                realLen += 1;
            else
                realLen += 2;
        }

        while (realLength(str.substring(0, i)) > len - tailLen) {
            i--;
        }

        return str.substring(0, i) + tmpTail;
    }

    public static int realLength(String s) {
        return s.getBytes().length;
    }

    /**
     * DB에 DATA를 Insert할때(Statement 사용시)
     * @param checkValue String
     * @return String
     */
    public String convertDBText(String checkValue) {

        String replaceString = "";
        replaceString = checkValue.replaceAll("'" , "''");

        return replaceString;
    }

    /**
     * String 형식으로 보여줄때
     * @param checkValue String
     * @return String
     */
    public String convertStringText(String checkValue) {

        String replaceString = "";
        replaceString = checkValue.replaceAll("&" , "&amp;");
        replaceString = replaceString.replaceAll("<" , "&lt;");
        replaceString = replaceString.replaceAll(">" , "&gt;");
        replaceString = replaceString.replaceAll("\n" , "<br>");
        replaceString = replaceString.replaceAll(" " , "&nbsp;");

        return replaceString;
    }

    /**
     * HTML 형식으로 보여줄때
     * @param checkValue String
     * @return String
     */
    public String convertTagText(String checkValue) {

        String replaceString = "";
        replaceString = checkValue.replaceAll("&amp;" , "&");
        replaceString = replaceString.replaceAll("&quot;" , "'");

        return replaceString;
    }

    /**
     * EDIT에서 보여줄때
     * @param checkValue String
     * @return String
     */
    public String convertEditText(String checkValue) {

        String replaceString = "";
        replaceString = checkValue.replaceAll("\"" , "&quot;");
        replaceString = replaceString.replaceAll("'" , "&#39;");

        return replaceString;
    }

    /**
     * HTML 코드 제거
     * @param checkValue String
     * @return String
     */
    public String convertRemoveHtml(String checkValue) {

        String replaceString = "";
        String regex1 = "\\<.*?\\>";
        String regex2 = "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>";

        replaceString = checkValue.replaceAll(regex1, "");
        replaceString = replaceString.replaceAll(regex2 , "");

        return replaceString;
    }


}