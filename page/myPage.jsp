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
    <h1 id="title">마이페이지</h1>
        <table id="table">
            <tr>
                <td>이름</td>
                <td class="textBox" id="0"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td class="textBox" id="1"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td class="textBox"  id="2"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td class="textBox" id="3"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td class="textBox" id="4"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td class="textBox" id="5"></td>
            </tr>
        </table>
    <button onclick="editInfoEvent()">정보수정</button>
    </form>
    <button onclick="signoutEvent()">회원탈퇴</button>
    <script>
        function homeEvent() {
            location.href = "post.jsp"
        }
        function editInfoEvent() {
            location.href = "editInfo.jsp";
        }
        function signoutEvent() {
            alert("회원을 탈퇴하시겠습니까?")
            location.href = "../action/signoutAction.jsp";
        }
        var name = "<%=name%>";
        var id = "<%=id%>";
        var pw = "<%=pw%>";
        var email = "<%=email%>";
        var phonenumber = "<%=phonenumber%>";
        var birth = "<%=birth%>";
        document.getElementById(0).innerText = name;
        document.getElementById(1).innerText = id;
        document.getElementById(2).innerText = pw;
        document.getElementById(3).innerText = email;
        document.getElementById(4).innerText = phonenumber;

        if(birth == "null") {
            document.getElementById(5).innerText = " ";
        }
        else {
            document.getElementById(5).innerText = birth;
        }
        var createdDate = "<%=createdDate%>";
        console.log("계정생성일 : " + createdDate);
        </script>
        
        
</body>