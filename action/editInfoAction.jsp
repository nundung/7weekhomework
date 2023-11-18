<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<% 
    request.setCharacterEncoding("UTF-8");

    String nameValue = request.getParameter("name_Value");
    String idValue = request.getParameter("id_Value");
    String pwValue = request.getParameter("pw_Value");
    String pwCheck = request.getParameter("pw_Check");
    String emailValue = request.getParameter("email_Value");
    String phonenumberValue = request.getParameter("phonenumber_Value");
    String birthValue = request.getParameter("birth_Value");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "UPDATE account SET name=?,pw=?,email=?,phonenumber=?, birth=? WHERE id=?";
	PreparedStatement query = connect.prepareStatement(sql);
	query.setString(1, nameValue);
    query.setString(2, pwValue);
    query.setString(3, emailValue);
	query.setString(4, phonenumberValue);
    if (birthValue == "") {
        query.setNull(5, java.sql.Types.DATE);
    }
	else {
        query.setString(5, birthValue);
    }
	query.setString(6, idValue);

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("정보가 수정되었습니다.")
        location.href = "../page/mypage.jsp"
    </script>
</body>