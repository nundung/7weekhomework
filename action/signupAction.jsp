<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>


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

    String sql = "INSERT INTO account (name, id, pw, email, phonenumber, birth) VALUES (?, ?, ?, ?, ?, ?)";
	PreparedStatement query = connect.prepareStatement(sql);
	query.setString(1, nameValue);
	query.setString(2, idValue);
    query.setString(3, pwValue);
    query.setString(4, emailValue);
	query.setString(5, phonenumberValue);
    if (birthValue == "") {
        query.setNull(6, java.sql.Types.DATE);
    }
	else {
        query.setString(6, birthValue);
    }

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var birth = "<%=birthValue%>";
        console.log(birth)
            alert("회원가입에 성공하였습니다.")
            location.href="../index.jsp";
    </script>
</body>