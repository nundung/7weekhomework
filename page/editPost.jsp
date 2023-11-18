<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    int accountIdx = (Integer)session.getAttribute("accountIdx");

    //post페이지에서 현재 페이지로 보낸 값
    String postIdx = request.getParameter("postIdx");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT * FROM post WHERE idx=?";
	PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, postIdx);

    ResultSet result = query.executeQuery();

    int authorIdx = 0;
    String postTitle = null;
    String postCreatedDate =null;
    String postContent = null;

	while (result.next()) {
        authorIdx = result.getInt(2);
		postTitle = result.getString(3);
        postCreatedDate = result.getString(4);
        postContent = result.getString(6);
    }
    
    String manager = null;
    if(accountIdx == authorIdx) {
        manager = "ok";
    }
    else {
        manager = "not ok";
    }
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>editPost</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body id="body">

    <div id="header">
        <div id="headerLeft">
            <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
        </div>
        <div id="headerCenter">
        <h1 id="title">수정하기</h1>
        <button class="headerButton" onclick="return editPostEvent()">수정완료</button>
        </div>
        <img src="../image/profile.png" id="profile" onclick="mypageEvent()">
    </div>

    <form action = "../action/editPostAction.jsp" id="form">
        <input type="text" name="postTitle_Value" class="textBox" id = "makePostTitle">
        <input type="text" name="postContent_Value" class="textBox" id = "makePostContent">
    </form>
    <script>
        var postIdx = "<%=postIdx%>"
        console.log(postIdx);
        var authorIdx = "<%=authorIdx%>"
        var postTitle = "<%=postTitle%>"
		var postCreatedDate = "<%=postCreatedDate%>"
        var postContent = "<%=postContent%>"
        console.log(postTitle)

        var title = document.getElementById("makePostTitle");
        var content = document.getElementById("makePostContent");
        title.value = postTitle;
        content.value = postContent;

        var form = document.getElementById("form");
        var idx = document.createElement("input");
        idx.type = "hidden";
        idx.name = "postIdx_Value";
        idx.value = postIdx;
        form.appendChild(idx);

        function editPostEvent() { 
            var titleValue = title.value;
            var contentValue = content.value;
            if(titleValue.trim() == "" || contentValue.trim() == "") {
                alert("값을 입력해주세요.")
                return false;
            }
            form.submit();
        }


    
    </script>
</body>