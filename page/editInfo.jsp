<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    Object idSession = session.getAttribute("id");
    String idValue = (String)idSession;

    //Object pwSession = session.getAttribute("pw");
    //String pwValue = (String)pwSession;

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT * FROM account WHERE id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);

    ResultSet result = query.executeQuery();

    String name = null;
    String id = null;
    String pw = null;
    String email = null;
    String phonenumber = null;
    String createdDate = null;
    String birth = null;

while (result.next()) {
    name = result.getString(2);
    id = result.getString(3);
    pw = result.getString(4);
    email = result.getString(5);
    phonenumber = result.getString(6);
    createdDate = result.getString(7);
    birth = result.getString(8);
}
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body id="body">
    <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
    <h1 id="title">정보수정</h1>
    <form action = "../action/editInfoAction.jsp" onsubmit = "return nullCheckEvent()">
        <table id="table">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name_Value" class="textBox" id="0"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id_Value" class="textBox" id="1"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="pw_Value" class="textBox" id="2"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="email_Value"class="textBox" id="3"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phonenumber_Value" class="textBox" id="4"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" name="birth" class="textBox" ></td>
            </tr>
        </table>
        <button>확인</button>
    </form>
    
    <script>
        function homeEvent() {
            location.href = "post.jsp"
        }
        function nullCheckEvent() {
            for (var i=0; i< 5; i++) {
                var value = document.getElementById(i).value;
                if(value === null || value.trim() == "") {
                    alert("필수항목을 입력해주세요.");
                    return false;
                } 
            }
        }
        var name = "<%=name%>";
        var id = "<%=id%>";
        var pw = "<%=pw%>";
        var email = "<%=email%>";
        var phonenumber = "<%=phonenumber%>";
        var birth = "<%=birth%>";
        document.getElementById(0).value = name;
        document.getElementById(1).value = id;
        document.getElementById(2).value = pw;
        document.getElementById(3).value = email;
        document.getElementById(4).value = phonenumber;

        var createdDate = "<%=createdDate%>";
        console.log("계정생성일 : " + createdDate);
    </script>
</body>