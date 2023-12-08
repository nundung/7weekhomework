<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    Integer accountIdx = (Integer)session.getAttribute("accountIdx");

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "INSERT INTO post (account_idx, title, content) VALUES (?, ?, ?)";
	PreparedStatement postQuery = connect.prepareStatement(sql);
	postQuery.setInt(1, accountIdx);
    postQuery.setString(2, title);
    postQuery.setString(3, content);

    postQuery.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("글이 업로드 되었습니다.")
        location.href = "../page/post.jsp"
    </script>
</body>