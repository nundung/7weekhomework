<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

<%
    //전페이지에서 온 데이터에 대해서 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    Connection connect = null;
    PreparedStatement query = null;
    ResultSet result = null;
    boolean logInCheck = false;

    try {
        //값을 받아서 변수에 저장해 준다.
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        if(id == null || pw == null) {
            out.println("<div>올바르지 않은 접근입니다.</div>");
            return;
        }

        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

        String sql = "SELECT * FROM account WHERE id=? AND pw=?";
        query = connect.prepareStatement(sql);
        query.setString(1, id);
        query.setString(2, pw);
        
        //return값을 저장해줌
        result = query.executeQuery();

        if(result.next()){
            Integer accountIdx = result.getInt(1);
            String name = result.getString(4);
            String email = result.getString(5);
            String phonenumber = result.getString(6);
            String birth = result.getString(7);
            
            session.setAttribute("accountIdx", accountIdx);
            session.setAttribute("name", name);
            session.setAttribute("id", id);
            session.setAttribute("pw", pw);
            session.setAttribute("email", email);
            session.setAttribute("phonenumber", phonenumber);
            session.setAttribute("birth", birth);

            logInCheck = true;
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
        var logInCheck = "<%=logInCheck%>";
        if (logInCheck === "true") {
            location.href = "../page/post.jsp";
        }
        else{
            alert("일치하는 계정정보가 존재하지 않습니다.");
            location.href = "../index.jsp";
        }
    </script>
</body>
</html>