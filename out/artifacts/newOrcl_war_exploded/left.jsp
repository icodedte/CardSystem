<%@ page import="src.dao.UserDaoImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>left</title>
    <link type="text/css" href="CSS/style1.css" rel="stylesheet">
    <link href="CSS/table.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        <!--
        body {
            background-color: #cde6c7;
        }

        ul {
            margin-top: 30px;
            list-style: none;
        }

        #slideMenu #menu li {
            text-align: center;
        }

        #date {
            border: thin solid black;
            margin: 0px;
            padding: 0px;
            text-align: center;
        }

        -->
    </style>

    <script>
        function show() {
            var date = new Date(); //日期对象
            var now = "";
            now = date.getFullYear() + "年"; //读英文就行了
            now = now + (date.getMonth() + 1) + "月"; //取月的时候取的是当前月-1如果想取当前月+1就可以了
            now = now + date.getDate() + "日";
//now = now + date.getHours()+"时"; 
//now = now + date.getMinutes()+"分"; 
//now = now + date.getSeconds()+"秒"; 
            document.getElementById("date").innerHTML = now; //div的html是now这个字符串
            setTimeout("show()", 1000); //设置过1000毫秒
        }
    </script>

</head>
<body onload=show()>
<%
    String un = request.getParameter("username");
    UserDaoImpl dao = new UserDaoImpl();
    String job = dao.FindWork(un);
    String mymessage = "mymessage.jsp?username=" + un;
    String repassword = "repassword.jsp?username=" + un;
    String spendcheck = "spendcheck.jsp?username=" + un;
%>
<div id="date" onmouseover="this.style.backgroundColor='#ffff66';"
     onmouseout="this.style.backgroundColor='#d4e3e5';"></div>
<div id="slideMenu">
    <ul id="menu">


        <li id="li0"><a href=<%=mymessage%> target="mainFrame">个人信息</a></li>
        <br/>
        <br/>


        <li id="li1"><a href=<%=repassword%> target="mainFrame">修改密码</a></li>
        <br/>
        <br/>

        <%
            if (job.equals("shop")) {
        %>

        <li id="li2"><a href="shoper.jsp" target="mainFrame">售货员</a></li>
        <br/>
        <br/>
        <%
            }
        %>

        <%
            if (job.equals("card")) {
        %>
        <li id="li3"><a href="cardmanager.jsp" target="mainFrame">卡管理员</a></li>
        <br/>
        <br/>
        <%
            }
        %>

        <%
            if (job.equals("library")) {
        %>

        <li id="li4"><a href="librarymanager.jsp" target="mainFrame">图书管理员</a></li>
        <br/>
        <br/>
        <%
            }
        %>

        <li id="li5"><a href=<%=spendcheck%> target="mainFrame">消费查询</a></li>
        <br/>
        <br/>


    </ul>
</div>
</body>
</html>