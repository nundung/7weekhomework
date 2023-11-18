<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<%
    //세션값 받기

    //세션에서 받은 값만 Value를 붙이자.
    Object idSession = session.getAttribute("id");
    String idValue = (String)idSession;

    //세션값 null일 경우 백엔드 예외처리
    if(idValue == null || idValue == "") {
        idValue = "0";
    } 

    //커넥터 파일 찾기
    Class.forName("com.mysql.jdbc.Driver");
    //커넥터 파일로 DB연결
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/7weekhomework","stageus","1234");
    
    //쿼리문 만들기
    //post 테이블의 모든 데이터 가져오기
    String postSql = "SELECT * FROM post";
	PreparedStatement postQuery = connect.prepareStatement(postSql);
    ResultSet postResult = postQuery.executeQuery();

    // 2차원 리스트 초기화
    ArrayList<ArrayList<String>> postList = new ArrayList<>();

	while (postResult.next()) {

        //post테이블의 1번째 칼럼(postIdx)의 내용을 postIdx에 저장
        int postIdx = postResult.getInt(1);

        //post테이블의 2번째 칼럼(accountIdx)의 내용을 authorIdx에 저장
		String authorIdx = postResult.getString(2);

        //post테이블의 3번째 칼럼(title)의 내용을 title에 저장
		String title = postResult.getString(3);

        //account테이블에서 Idx값이 ?인 데이터 가져오기
        String idSql = "SELECT id FROM account WHERE Idx = ?";
        PreparedStatement idQuery = connect.prepareStatement(idSql);

        //?에 authorIdx값을 대입
        idQuery.setString(1, authorIdx);
        ResultSet idResult = idQuery.executeQuery();


        while (idResult.next()) {

            //account테이블의 idx컬럼의 데이터 중에 대입된 값과 일치하는 데이터의 id를 저장
            String authorId = idResult.getString("id");

            //2차원 리스트에 추가
            ArrayList<String> postItem = new ArrayList<>();
            postItem.add("\"" + postIdx + "\"");
            postItem.add("\"" + authorIdx + "\"");
            postItem.add("\"" + title + "\"");
            postItem.add("\"" + authorId + "\"");

            postList.add(postItem);
        }
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" type="text/css" href="../6weekIndex.css">
</head>
<body id="body">
    <div id="header">
        <div id="headerLeft">
        </div>
        <div id="headerCenter">
            <h1 id="title" onclick>게시판</h1>
            <button class="headerButton" onclick="makePostEvent()">글쓰기</button>
        </div>
        <img src="../image/profile.png" id="profile" onclick="mypageEvent()">
    </div>
    <div id="postBox"></div>

    <script>
        var idValue = "<%=idValue%>";
        console.log(idValue);
        var headerLeft = document.getElementById("headerLeft");
        var button = document.createElement("button");
        button.className = "headerButton";
        button.id = "login/out";

        if(idValue == "0" || idValue == 0) {
            button.innerText = "로그인";
            button.addEventListener("click", function() {
                location.href = "../index.jsp";
            });
            headerLeft.appendChild(button);
        }
        else {
            button.innerText = "로그아웃";
            button.addEventListener("click", function() {
                location.href = "../action/logoutAction.jsp";
            });
            headerLeft.appendChild(button);
        }

        function makePostEvent() {
            if(idValue == 0) {
                alert("로그인 후 작성가능합니다.");
                location.href ="../index.jsp";
            }
            else {
                location.href = "uploadPost.jsp";
            }
        }
        function mypageEvent() {
            if(idValue == 0) {
                alert("로그인 후 이용가능합니다.")
                location.href="../index.jsp";
            }
            else {
                location.href = "mypage.jsp";
            }
        }

        var postList = <%=postList%>;
        console.log(postList);
        var postBox = document.getElementById("postBox");


        for (var i = 0; i < postList.length; i++) {
            var postNumber = postList[i];
            var post = document.createElement("div");
            post.id = "post";

            var postTitle = document.createElement("div");
            postTitle.id = "postTitle";
            var postTitleText = postNumber[2];
            postTitle.innerHTML = postTitleText;

            (function(clickedPostIndex) {
                postTitle.addEventListener("click", function() {
                    var postIdxIndex = postList[clickedPostIndex];
                    var postIdx = postIdxIndex[0];
                    //postIdxIndex가 변수값이고 postIdx가 변수값인 페이지로 이동
                    location.href = "viewPost.jsp?postIdx=" + postIdx;
                });
            })(i);

            var authorId = document.createElement("div")
            authorId.id = "authorId"
            var authorIdValue = postNumber[3];
            authorId.innerHTML = authorIdValue;

            post.append(postTitle);
            post.appendChild(authorId);
            postBox.appendChild(post);
            console.log(authorIdValue)

            if (idValue == authorIdValue) {
                var buttonBox = document.createElement("div");
                var fixButton = document.createElement("button");
                var deleteButton = document.createElement("button");
                buttonBox.id = "buttonBox";
                fixButton.className = "etcButton";
                deleteButton.className = "etcButton";
                deleteButton.innerText = "삭제";
                fixButton.innerText = "수정";
                buttonBox.appendChild(fixButton);
                buttonBox.appendChild(deleteButton);
                post.appendChild(buttonBox);

                var postIdx = postNumber[0];


                (function(index) {
                    deleteButton.addEventListener("click", function() {
                        var postIdxIndex = postList[index];
                        var postIdx = postIdxIndex[0];
                        //postIdxIndex가 변수값이고 postIdx가 변수값인 페이지로 이동
                        location.href = "../action/deletePostAction.jsp?postIdx=" + postIdx;
                    });
                })(i);


                (function(index) {
                    fixButton.addEventListener("click",
                        function() {
                            var postIdxIndex = postList[index];
                            var postIdx = postIdxIndex[0];
                            //postIdxIndex가 변수값이고 postIdx가 변수값인 페이지로 이동
                            location.href = "editPost.jsp?postIdx=" + postIdx;
                        }
                    );
                })(i);
            }
        }
    </script>
</body>
