<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String phonenumber = request.getParameter("phonenumber");

    Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT * FROM account WHERE name = ? AND phonenumber = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, name);
    query.setString(2, phonenumber);

    //return값을 저장해줌
    ResultSet result = query.executeQuery();

    String id = null;
    while (result.next()) {
    id = result.getString(3);
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var id = "<%=id%>";
        if (id == "null" ) {
            alert("해당번호로 가입된 아이디가 없습니다.");
            location.href = "../index.jsp";
        }
        else {
            alert("회원님의 아이디는 " + id + " 입니다.");
            location.href = "../index.jsp";
        }
    </script>
</body>