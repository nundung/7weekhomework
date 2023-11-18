<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");
    String idValue = request.getParameter("id_Value");

    Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT * FROM account Where id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);

    //return값을 저장해줌
    ResultSet result = query.executeQuery();

    //데이터 정제
    String pw = null;
    while(result.next()){
    pw = result.getString(4);
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var pw = "<%=pw%>";
        if(pw == "null") {
            alert("해당아이디와 일치하는 정보가 없습니다.");
            location.href = "../index.jsp";
        }
        else {
            alert("회원님의 비밀번호는 " + pw + " 입니다.");
            location.href = "../index.jsp";
        }
    </script>
</body>