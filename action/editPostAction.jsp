<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    String postTitle = request.getParameter("postTitle_Value");
    String postContent = request.getParameter("postContent_Value");
    String postIdxValue = request.getParameter("postIdx_Value");

    int postIdx = 0;
    postIdx = Integer.parseInt(postIdxValue);

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "UPDATE post SET title = ?, content = ? WHERE idx = ?";
	PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, postTitle);
    query.setString(2, postContent);
    query.setInt(3, postIdx);

    query.executeUpdate();

    %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var title = "<%=postTitle%>";
        var content = "<%=postContent%>";
        var idx = "<%=postIdx%>";
        console.log(title);
        console.log(content);
        console.log(idx);
        alert("게시글 수정이 완료되었습니다.")
        location.href="../page/post.jsp";
    </script>
</body>