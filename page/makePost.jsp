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
<body id="body">
    <div id="header">
        <div id="headerLeft">
            <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
        </div>
        <div id="headerCenter">
            <h1 id="title">글쓰기</h1>
            <button class="headerButton" onclick="return uploadPostEvent()">등록</button>
        </div>
        <img src="../image/profile.png" id="profile" onclick="mypageEvent()">
    </div>
    <form action = "../action/uploadPostAction.jsp" id="form">
        <input type="text" name="title_Value" class="textBox" id = "makePostTitle">
        <input type="text" name="content_Value" class="textBox" id = "makePostContent">
    </form>
    <script>
        function uploadPostEvent() {
            // 폼 요소를 JavaScript로 가져오기
            var form = document.getElementById("form");
            var postTitle = document.getElementById("makePostTitle");
            var postTitleText = postTitle.value;

            var postContent = document.getElementById("makePostContent");
            var postContentText = postContent.value;
            // 폼을 제출
            if(postTitleText.trim == "" || postContentText.trim() == "") {
                alert("내용을 입력해주세요.")
                return false;
            }
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