<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="body">
    <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
    <h1 id="title">회원가입</h1>
    <form id="signupForm" action="../action/signupAction.jsp" onsubmit="return nullCheckEvent()">
        <table id="table">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name_Value" class="textBox" id="0"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text"  name="id_Value" id="1"class="textBox"></td>
                <td><input type="button" id="idCheck_button" value="ID 중복 검사" onclick="idCheckEvent()"></td>
            </tr>
            <tr>
                <td><div id="result"></div></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="pw_Value" class="textBox" id="2"></td>
            </tr>
            <tr>
                <td>비밀번호확인</td>
                <td><input type="text" name="pw_Check" class="textBox" id="3"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="email_Value" class="textBox" id="4"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phonenumber_Value" class="textBox" id="5"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" name="birth_Value" class="textBox"></td>
            </tr>
        </table>
        <input type="submit" value="회원가입">
    </form>
    <script>
        function idCheckEvent() {
            var idValue = document.getElementById("1").value;
            if(idValue.trim() == ""){
                alert("아이디값을 입력해주세요.");
                return;
            }
            if(idValue.length < 5 || idValue.length > 12){
                alert("아이디는 5자 이상 12자 이하로 입력해주세요.")
                return;
            }
            let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=600, height=400, top=0,left=0";
            var ret = window.open("../action/checkIdAction.jsp?idValue="+ idValue, "아이디중복체크", options)
        }
        function homeEvent() {
            location.href = "post.jsp"
        }
        function nullCheckEvent() {
            const phoneNumberCheck = /^01([0|1|6|7|8|9])-?([0-9{3,4})-?([0-9]{4})$/;
            var phoneNumberValue = document.getElementById("5").value;
            if (!phoneNumberCheck.test(phoneNumberValue)) {
                alert("유효한 전화번호를 입력해주세요.");
                return false;
            }

            for (var i=0; i< 6; i++) {
                var value = document.getElementById(i).value
                if(value == "null" || value == "") {
                    alert("필수항목을 입력해주세요.");
                    return false;
                } 
                
            }
        }
    </script>
</body>
