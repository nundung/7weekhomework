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
                <td><input type="text" name="id" class="input" id="id"></td>
            </tr>
            <tr>
                <td><input  type="text" name="pw"class="input" id="pw"></td>
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
        var input = document.getElementsByClassName("input");
        function exceptionCheckEvent() {
            for (var i=0; i<input.length; i++) {
                var value = input[i].value;
                if(value.trim() == "") {
                    alert("아이디, 비밀번호를 입력해주세요.");
                    return false;
                } 
            }

            //아이디 정규식
            var id = document.getElementById("id").value;
            var idReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,18}$/;
            //id 문자열이 idReg로 정의된 정규 표현식과 일치하는지 체크
            if(!idReg.test(id)) {
                alert("아이디는 영문, 숫자의 조합으로 6~18자로 입력해주세요.");
                return false;
            }

            //비밀번호 정규식
            var pw = document.getElementById("pw").value;
            var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
            if(!pwReg.test(pw)) {
                alert("비밀번호는 영문, 숫자, 특수문자의 조합으로 8~20자로 입력해주세요.");
                return false;
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