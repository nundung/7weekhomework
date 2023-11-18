<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body id="body">
    <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
    <h1 id="title">비밀번호 찾기</h1>
    <!-- onsubmit은 form이 제출될 때 실행되는 이벤트 -->
    <form action="../action/findPwAction.jsp" onsubmit= "return nullCheckEvent()">
        <table id="table">
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id_Value" class="textBox" id="id_Id"></td>
            </tr>
        </table>
        <input type="submit" value="비밀번호 찾기">
    </form>
    <script>
        function homeEvent() {
            location.href = "post.jsp"
        }
        function nullCheckEvent() {
            var idValue = document.getElementById("id_Id").value
            if(idValue == null || idValue == "") {
                alert("값을 입력해주세요.");
                return false;
            }
        return true;
        }
    </script>
</body>