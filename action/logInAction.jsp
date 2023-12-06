<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    //전페이지에서 온 데이터에 대해서 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    String id = null;
    String pw = null;

    Connection connect = null;
    String sql = null;
    PreparedStatement query = null;

    try {
        //값을 받아서 변수에 저장해 준다.
        id = request.getParameter("id");
        pw = request.getParameter("pw");

        // Connector 파일 찾기
        Class.forName("com.mysql.jdbc.Driver");
        //데이터베이스 연결
        connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");


    }
    //SQL(쿼리문) 만들기
	//SQL문은 다른 프로그래밍 언어 기준에는 단순히 문자열임 따라서 String을 사용
	//미리 만들어놓은 test테이블에 입력받은 값을 넣도록 한다.
    sql = "SELECT * FROM account WHERE id=? AND pw=?";
    query = connect.prepareStatement(sql);
    query.setString(1, id);

	//return값을 저장해줌
    ResultSet result = query.executeQuery();

    int accountIdx = 0;
    String name = "null";
    String pw = "null";
    String email = "null";
    String phonenumber = "null";
    String birth = "null";
    String check = "null";

    while(result.next()){
    accountIdx = result.getInt(1);
    name = result.getString(2);
    pw = result.getString(4);
    email = result.getString(5);
    phonenumber = result.getString(6);
    birth = result.getString(8);
    }

    if (pw.equals(pwValue)) {
        session.setAttribute("id", idValue);
        session.setAttribute("accountIdx", accountIdx);
        session.setAttribute("name", name);
        session.setAttribute("pw", pw);
        session.setAttribute("email", email);
        session.setAttribute("phonenumber", phonenumber);
        session.setAttribute("birth", birth);
        check = "ok";
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var check = "<%=check%>";
        if (check === "null") {
            alert("비밀번호가 일치하지 않습니다.");
            location.href = "../index.jsp";
        }
        else{
            location.href = "../page/post.jsp";
        }
    </script>
</body>
</html>