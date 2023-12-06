<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>7weekHomework</title>
    <link rel="stylesheet" type="text/css" href="6weekIndex.css">
</head>
<body>
    <img src="image/home.png" id="homeButton" onclick="homeEvent()">
    <h1 id="title">logIn</h1>

    <!-- action="이동하고싶은 파일명" -->
    <form action="action/logInAction.jsp" onsubmit="return exceptionCheckEvent()">
		<!-- input 태그는 다음페이지에 전달 되는 값이 된다. -->
        <table id="loginTable">
            <tr>
                <td><input type="text" name="idValue" class="textBox" id="0"></td>
            </tr>
            <tr>
                <td><input  type="text" name="pwValue"class="textBox" id="1"></td>
            </tr>
            <tr>
                <td><input type="submit" value="login" id="loginButton"></td>
            </tr>
        </table>
	</form>

    <div id="menuBox">
        <span class="menu" onclick="findIdEvent()">아이디 찾기</span>
        <span class="menu" onclick="findPwEvent()">비밀번호 찾기</span>
        <span class="menu" onclick="signupEvent()">회원가입</span>
    </div>

    <script>
        function homeEvent() {
            location.href = "page/post.jsp"
        }
        function nullCheckEvent() {
            for (var i=0; i< 2; i++) {
                var value = document.getElementById(i).value
                if(value == "null" || value == "") {
                    alert("아이디, 비밀번호를 입력해주세요.");
                    return false;
                } 
                
            }
        }
        function loginEvent() {
            location.href = "page/post.jsp"
        }
        function findIdEvent() {
            location.href = "page/findId.jsp"
        }
        function findPwEvent() {
            location.href = "page/findPw.jsp"
        }
        function signupEvent() {
            location.href = "page/signup.jsp"
        }
    </script>
</body>
</html>