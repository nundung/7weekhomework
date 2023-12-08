<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
    <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
    <h1 id="title">회원가입</h1>
    <form id="signupForm" action="../action/signUpAction.jsp" onsubmit="return nullCheckEvent()">
        <table id="table">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" class="input"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text"  name="id" class="input" id="id" onchange="resetCheckIdEvent()"></td>
                <td><input type="button" id="idCheckButton" value="ID 중복 검사" onclick="checkIdEvent()"></td>
            </tr>
            <tr>
                <td><div id="result"></div></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="pw" class="input" id="pw"></td>
            </tr>
            <tr>
                <td>비밀번호확인</td>
                <td><input type="text" name="pwCheck" class="input" id="pwCheck"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="email" class="input"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phonenumber" class="input"></td>
            </tr>
        </table>
        <input type="submit" value="회원가입">
    </form>
    <script>
        var checkId = false;
        function checkIdEvent() {
            var idValue = document.getElementById("id").value;
            if(idValue.trim() == ""){
                alert("아이디값을 입력해주세요.");
                return;
            }
            let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=600, height=400, top=0,left=0";
            var pop = window.open("../action/checkIdAction.jsp?id="+ idValue, "아이디중복체크", options)
        
            pop.onunload = function() {
                if(checkId == true) {
                    var idCheckButton = document.getElementById("idCheckButton")
                    idCheckButton.disabled = true;
                    idCheckButton.style.backgroundColor = "gray";
                }
            }
        }   
        function resetCheckIdEvent() {
            var checkedId = false;
            idCheckButton.disabled = false;
            idCheckButton.style.backgroundColor = "";
        }

        function nullCheckEvent() {
            var input = document.getElementsByClassName("input");
            var pw = document.getElementById("pw").value;
            var pwCheck = document.getElementById("pwCheck").value;
            for (var i=0; i< input.length; i++) {
                var value = input[i].value;
                if(value == "") {
                    alert("필수항목을 입력해주세요.");
                    return false;
                }
            } 
            if(checkId === false) {
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            if(pw !== pwCheck) {
                alert("비밀번호 확인값이 일치하지 않습니다.");
                return false;
            }
        }
    </script>
</body>
