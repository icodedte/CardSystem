<%@ page import="src.dao.UserDaoImpl" %>
<%@ page import="src.vo.xiqu" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CardManager</title>

    <link href="CSS/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="hovertable">
    <tr>
        <th>账号</th>
        <th>密码</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    <%
        String un = request.getParameter("username");
        UserDaoImpl dao = new UserDaoImpl();
        List<xiqu> list = dao.queryAll();
        Iterator<xiqu> it = list.iterator();
        while (it.hasNext()) {
            xiqu xiqu = it.next();
    %>
    <tr onmouseover="this.style.backgroundColor='#ffff66';"
        onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td><%=xiqu.getUsername()%>
        </td>
        <td><%=xiqu.getPassword()%>
        </td>
        <td><%=xiqu.getName()%>
        </td>
        <td><input type="button" value="删除"></td>

    </tr>

    <%
        }
    %>
</table>
</body>
</html>