<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    Integer accountIdx = (Integer)session.getAttribute("accountIdx");

    Object idSession = session.getAttribute("id");
    String idValue = (String)idSession;

    String commentValue = request.getParameter("comment_Value");
    String postIdxValue = request.getParameter("postIdx_Value");

    int postIdx = Integer.parseInt(postIdxValue);

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "INSERT INTO comment (post_idx, account_idx, content) VALUES (?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setInt(1, postIdx);
	query.setInt(2, accountIdx);
    query.setString(3, commentValue);
    //commentvalue 널값 예외처리 해라
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
        location.href = "../page/viewPost.jsp?postIdx=" + postIdx;
    </script>
</body>
</html>