<%--
  Created by IntelliJ IDEA.
  User: 22787
  Date: 2017/12/2
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="CSS/table.css" rel="stylesheet" type="text/css">
    <script>
        $(function () {
            $("#btn1").click(function () {

                $.ajax({
                    type: "post",
                    url: "money",
                    dataType: "text",
                    data: $("#usemoney").serialize(),
                    statusCode: {
                        200: function (data) {

                            alert(data);
                            window.location.href = "usermoney.jsp";

                        },
                    }
                });
            });

        });
    </script>
</head>
<body>

<form name="usemoney" id="usemoney">
    账号<input name="username" id="username" type="text"><br> 密码<input name="usemoney1"
                                                                     id="usemoney1" type="text"><br>

    <button id="btn1">提交</button>

</form>
</body>
</html>
