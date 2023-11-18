<%@ page language="java" contentType="text/html" pageEncoding="UFT-8" $>

<%@
    //데이터베이스 탐색 라이브러리
    page import="java.sql.DriverManager"

    //데이터베이스 연결 라이브러리
    page import="java.sql.Connection"

    //SQL 전송가능한 상태로 바꿔주는 라이브러리
    page import="java.sql.PreparedStatement"

    //데이터 받아오기 라이브러리(SELECT를 할 때만 필요한 라이브러리)
    page import="java.sql.ResultSet" 

    //리스트 라이브러리
    page import="java.util.ArrayList"
%>

<%
    //전페이지에서 온 데이터에 대해서 인코딩 설정
	request.setCharacterEncoding("UTF-8");
    
	//값을 받아서 변수에 저장해 준다.
	//변수의 자료형을 String으로 지정
	String idValue = request.getParameter("id_value");
	String pwValue = request.getParameter("pw_value");

	//데이터베이스 연결 코드
		// Connector 파일 찾는 부분
		Class.forName("com.mysql.jdbc.Driver");
		//데이터베이스 연결
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekHomework","stageus","1234");

	String sql = "SELECT * FROM test";
        PreparedStatement query = connect.prepareStatement(sql);

        ResultSet result = query.executeQuery();

	ArrayList<String> account_idxList = new ArrayList<String>();
	ArrayList<String> titleList = new ArrayList<String>();
	while (result.next()) {
		String account_idx = result.getString(2);
		String title = result.getString(3);
		account_idxList.add("\""+account_idx+"\"");
		titleList.add("\""+title+"\"");
    }
%>
