<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>


<%
    String commentIdx = request.getParameter("commentIdx");
    String postIdxValue = request.getParameter("postIdx");

    Integer postIdx = Integer.parseInt(postIdxValue);

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "DELETE FROM comment WHERE idx=?";
	PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, commentIdx);

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var postIdx = "<%=postIdx%>";
        alert("삭제완료");
        location.href = "../page/viewPost.jsp?postIdx=" + postIdx;
    </script>
</body>
</html>