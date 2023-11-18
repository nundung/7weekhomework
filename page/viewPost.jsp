<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("UTF-8");

    
    Object idSession = session.getAttribute("id");
    String idValue = (String)idSession;
    
    Integer accountIdx = (Integer)session.getAttribute("accountIdx");

    if (accountIdx == null) {
        accountIdx = 0;
    }

    //post페이지에서 현재 페이지로 보낸 값
    String postIdx = request.getParameter("postIdx");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");

    String sql = "SELECT post.*, comment.* FROM post LEFT JOIN comment ON post.idx = comment.post_idx WHERE post.idx = ?";
	PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, postIdx);

    ResultSet result = query.executeQuery();

    int authorIdx = 0;
    String postTitle = null;
    String postCreatedDate =null;
    String postContent = null;
    String authorId = null;
    String commentContent = null;
    int commentAuthorIdx = 0;
    String commentAuthorId = null;
    int commentIdx = 0;

    ArrayList<String> commentContentList = new ArrayList<>();
    ArrayList<String> commentAuthorList = new ArrayList<>();   
    ArrayList<Integer> commentAuthorIdxList = new ArrayList<>();  
    ArrayList<Integer> commentIdxList = new ArrayList<>(); 

	while (result.next()) {
        authorIdx = result.getInt(2);
		postTitle = result.getString(3);
        postCreatedDate = result.getString(4);
        postContent = result.getString(6);
        commentIdx = result.getInt("comment.Idx");
        commentContent = result.getString("comment.content");
        commentAuthorIdx = result.getInt("comment.account_idx");

        commentIdxList.add(commentIdx);
        commentContentList.add("\"" + commentContent + "\"");
        commentAuthorIdxList.add(commentAuthorIdx);

        String contentAuthorSql = "SELECT id FROM account WHERE idx = ?";
        PreparedStatement authorQuery = connect.prepareStatement(contentAuthorSql);
        authorQuery.setInt(1, commentAuthorIdx);

        ResultSet authorResult = authorQuery.executeQuery();

        while (authorResult.next()) {
            //account테이블의 idx컬럼의 데이터 중에 대입된 값과 일치하는 데이터의 id를 저장
            commentAuthorId = authorResult.getString("id");
            commentAuthorList.add("\"" + commentAuthorId + "\"");
        }
    }
    
        //account테이블에서 authorIdx에 해당하는 데이터의 id를 가져오기
        String idSql = "SELECT id FROM account WHERE Idx = ?";
        PreparedStatement idQuery = connect.prepareStatement(idSql);

        //?에 authorIdx값을 대입
        idQuery.setInt(1, authorIdx);

        ResultSet idResult = idQuery.executeQuery();
    
        while (idResult.next()) {
        //account테이블의 idx컬럼의 데이터 중에 대입된 값과 일치하는 데이터의 id를 저장
        authorId = idResult.getString("id");
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
    <title>viewPost</title>
    <link rel="stylesheet" type="text/css" href="../viewPostIndex.css">
</head>
<body id="body">
    <div id="header">
        <div id="headerLeft">
        <img src="../image/home.png" id="homeButton" onclick="homeEvent()">
        </div>
        <div id="headerCenter"></div>
        <img src="../image/profile.png" id="profile" onclick="mypageEvent()">
    </div>  
    <form action="../action/editPostAction.jsp?postIdx=">
        <div id="userId"></div>
        <div id="title"></div>
        <div id="content"></div>
    </form>
    <div id="commentBox">
        <form action="../action/uploadCommentAction.jsp" id="form">
        <input type="text" name = "comment_Value" id="makeComment">
        <input type="hidden" name = "postIdx_Value" id="postIdx">  
        <button onclick = "return nullCheckEvent()">댓글달기</button>
        </form>
    </div>

    <script>
        var commentAuthorIdxList = <%=commentAuthorIdxList%>;
        var commentAuthorList = <%=commentAuthorList%>;
        var commentIdxList = <%=commentIdxList%>;
        var accountIdx = "<%=accountIdx%>"
        var postIdx = "<%=postIdx%>";
        var postTitle = "<%=postTitle%>";
        var postCreatedDate = "<%=postCreatedDate%>";
        var postContent = "<%=postContent%>";
        var authorId = "<%=authorId%>";
        console.log(authorId);
        var manager = "<%=manager%>";
        var idValue = "<%=idValue%>";
        var buttonBox = document.getElementById("headerCenter");

        var postIdxId = document.getElementById("postIdx");
        postIdxId.value = postIdx;
        function nullCheckEvent() {
            if (accountIdx == "0" || accountIdx ==0) {
                alert("로그인 후 이용가능하십니다.")
                return false;
            }
            
            var comment = document.getElementById("makeComment");
            var commentValue = comment.value;
            console.log("commentValue:", commentValue); 
            if(commentValue.trim() == "") {
                alert("내용을 입력해주세요.")
                return false;
            }
                form.submit();
        }

        if (manager == "ok") {
            var fixButton = document.createElement("button");
            var deleteButton = document.createElement("button");
            deleteButton.innerText = "삭제";
            fixButton.innerText = "수정";
            deleteButton.className = "headerButton";
            fixButton.className = "headerButton";
            buttonBox.appendChild(fixButton);
            buttonBox.appendChild(deleteButton);
            deleteButton.addEventListener("click", function() {
                location.href = "../action/deletePostAction.jsp?postIdx=" + postIdx;
            });
            fixButton.addEventListener("click", function() {
                location.href = "editPost.jsp?postIdx=" + postIdx;
            });
        }
        

        var commentAuthorList = <%=commentAuthorList%>;
        var commentContentList = <%=commentContentList%>;
        var commentBox = document.getElementById("commentBox");
        for(var i=0; i<commentContentList.length; i++) {
            var comment = document.createElement("div");
            var commentContent = document.createElement("div");
            commentContent.innerHTML = commentContentList[i];
            comment.id = "comment";
            var commentAuthor = document.createElement("div")
            var commentAuthorValue = commentAuthorList[i];
            commentAuthor.innerHTML = commentAuthorValue;
            commentAuthor.id = "commentAuthor";
            comment.appendChild(commentAuthor);
            comment.appendChild(commentContent);

            if(idValue == commentAuthorValue) {
                var fixButton = document.createElement("button");
                var deleteButton = document.createElement("button");
                deleteButton.innerText = "삭제";
                fixButton.innerText = "수정";
                comment.appendChild(fixButton);
                comment.appendChild(deleteButton);
                (function(index) {
                    deleteButton.addEventListener("click", function() {
                    var commentIdx = commentIdxList[index];
                    
                    location.href = "../action/deleteCommentAction.jsp?commentIdx=" + commentIdx + "&postIdx=" + postIdx;
                    });
                })(i);
            }


            
            commentBox.appendChild(comment);
            
        }
        console.log(manager);

        var userId = document.getElementById("userId");
        var userIdText = document.createElement("h3");
        userIdText.innerHTML = authorId;
        userId.appendChild(userIdText);

        var title = document.getElementById("title");
        var titleText = document.createElement("h2");
        titleText.innerHTML = postTitle;
        title.appendChild(titleText);


        var content = document.getElementById("content");
        var contentText = document.createElement("p");
        contentText.innerHTML = postContent;

        content.appendChild(contentText);


        function homeEvent() {
            location.href = "post.jsp";
        }
        function mypageEvent() {
            if(idValue == "null") {
                alert("로그인 후 이용가능합니다.")
            }
            else {
                location.href = "mypage.jsp";
            }
        }

    </script>
</body>