<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body id="body">
    <h1 id="title">아이디 찾기</h1>
    <!-- onsubmit은 form이 제출될 때 실행되는 이벤트 -->
    <form action="../action/findIdAction.jsp" onsubmit=" return nullCheckEvent()">
        <table id="table">
            <tr>
                <td>이름</td>
                <td><input type="text" name="name" class="input"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="text" name="phonenumber" class="input" id="phonenumber"></td>
            </tr>
        </table>
        <input type="submit" value="아이디 찾기">
    </form>
    <script>
        function nullCheckEvent() {
            var phonenumberValue = document.getElementById("phonenumber").value
            if(phonenumberValue.trim() === "") {
                alert("값을 입력해주세요.");
                return false;
            }
        return true;
        }
    </script>
</body>