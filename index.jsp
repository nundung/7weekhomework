<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>7weekHomework</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
    <main>
        <h1 id="title">logIn</h1>
        <!-- action="이동하고싶은 파일명" -->
        <form action="action/logInAction.jsp" onsubmit="return exceptionCheckEvent()">
            <!-- input 태그는 다음페이지에 전달 되는 값이 된다. -->
            <table>
                <tr>
                    <td><input type="text" name="id" class="input" name="id"></td>
                </tr>
                <tr>
                    <td><input  type="text" name="pw"class="input" name="pw"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="login" id="loginButton"></td>
                </tr>
            </table>
        </form>
        <section id="menuSection">
            <span class="menu" onclick="findIdEvent()">아이디 찾기</span>
            <span class="menu" onclick="findPwEvent()">비밀번호 찾기</span>
            <span class="menu" onclick="signUpEvent()">회원가입</span>
        </section>
    </main>

    <script>
        var input = document.getElementsByClassName("input");
        function exceptionCheckEvent() {
            for (var i=0; i<input.length; i++) {
                var value = input[i].value;
                if(value.trim() == "") {
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
        function signUpEvent() {
            location.href = "page/signUp.jsp"
        }
    </script>
</body>
</html>