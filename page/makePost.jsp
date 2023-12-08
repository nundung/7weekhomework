<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%
    Object idSession = session.getAttribute("id");
    String idValue = (String)idSession;

    // 세션값이 null이거나 빈 문자열인 경우 로그인 페이지로 리다이렉트
    if(idValue == null || idValue.isEmpty()) {
        response.sendRedirect("../index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body>
    <div id="header">
        <div id="headerLeft">
            <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
        </div>
        <div id="headerCenter">
            <h1 id="title">글쓰기</h1>
            <button class="headerButton" onclick="return makePostEvent()">등록</button>
        </div>
        <img src="../image/profile.png" id="profile" onclick="mypageEvent()">
    </div>
    <form action = "../action/makePostAction.jsp" id="form">
        <input type="text" name="title" class="textBox" id = "postTitle">
        <input type="text" name="content" class="textBox" id = "postContent">
    </form>
    <script>
        function makePostEvent() {
            // 폼 요소를 JavaScript로 가져오기
            var form = document.getElementById("form");
            var postTitle = document.getElementById("postTitle").value;
            var postContent = document.getElementById("postContent").value;
            
            if(postTitle.trim() == "" || postContent.trim() == "") {
                alert("내용을 입력해주세요.")
                return false;
            }
            // 폼을 제출
            else {form.submit();
            }
        }
        function homeEvent() {
            location.href = "post.jsp"
        }
        function mypageEvent() {
            location.href = "mypage.jsp"
        }
    </script>
</body>