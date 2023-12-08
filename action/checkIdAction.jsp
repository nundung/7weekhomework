<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("UTF-8");
    
    Connection connect = null;
    PreparedStatement query = null;
    ResultSet result = null;

    boolean idCheck = false;

    try {
        String id = request.getParameter("id");

        if(id == null) {
            out.println("<div>올바르지 않은 접근입니다.</div>");
            return;
        }

        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

        String sql = "SELECT * FROM account WHERE id=?";
        query = connect.prepareStatement(sql);
        query.setString(1, id);

        result = query.executeQuery();

        if(result.next()) {
            idCheck = false;
        }
        else {
            idCheck = true;
        }
    }
    catch (SQLException e) {
        out.println("<div>예상치 못한 오류가 발생했습니다.</div>");
        return;
    }
    finally {
        if (connect != null) connect.close();
        if (query != null) query.close();
        if (result != null) result.close();
    }

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        var idCheck = "<%=idCheck%>";
        if (idCheck === "true") {
            alert("사용 가능한 아이디입니다.");
            window.opener.checkId = true;
        } 
        else {
            alert("이미 존재하는 아이디입니다.");
            window.opener.checkId = false;
        }
        window.close()
    </script>
</body>