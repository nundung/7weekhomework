<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
	request.setCharacterEncoding("UTF-8");
    
	String idValue = request.getParameter("idValue");
    if(idValue == "" || idValue == " ") {
        idValue = null;
    }

	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT * FROM account WHERE id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);

    int idCheck = 0;
    ResultSet result = query.executeQuery();
    if(result.next()) {
        idCheck = 0;
    }
    else {
        idCheck = 1;
    }

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
        var idValue = "<%=idValue%>";
        var idCheck = "<%=idCheck%>";
        console.log(idValue);
        console.log(idCheck);
        // 예: idCheck가 0인 경우 중복된 아이디, 1인 경우 사용 가능한 아이디로 처리
        if (idCheck == 0) {
            alert("중복된 아이디입니다.");
        } else if (idCheck == 1) {
            alert("사용 가능한 아이디입니다.");
        }
        if (idValue == null) {
            alert("값을 입력해주세요.")
        }
    </script>

</body>