<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>


<%
    request.setCharacterEncoding("UTF-8");

    Connection connect = null;
    PreparedStatement query = null;

    try{
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");

        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

        String sql = "INSERT INTO account (id, pw, name, email, phonenumber) VALUES (?, ?, ?, ?, ?)";
        query = connect.prepareStatement(sql);
        query.setString(1, id);
        query.setString(2, pw);
        query.setString(3, name);
        query.setString(4, email);
        query.setString(5, phonenumber);

        query.executeUpdate();
    }
    catch (SQLException e) {
        out.println("<div>예상치 못한 오류가 발생했습니다.</div>");
        return;
    }
    finally {
        if (connect != null) connect.close();
        if (query != null) query.close();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
            alert("회원가입에 성공하였습니다.")
            location.href="../index.jsp";
    </script>
</body>