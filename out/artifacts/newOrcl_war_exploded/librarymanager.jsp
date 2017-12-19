<%@ page import="src.dao.LibraryDaoImpI" %>

<%@ page import="src.vo.lib" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LibraryManager</title>

    <link href="CSS/table.css" rel="stylesheet" type="text/css">
</head>
<body>


<table class="hovertable">
    <tr>
        <th>借阅编号</th>
        <th>学号</th>
        <th>书名</th>
        <th>时间</th>
    </tr>
    <%
        LibraryDaoImpI dao = new LibraryDaoImpI();
        List<lib> list = dao.queryAll();
        Iterator<lib> it = list.iterator();
        while (it.hasNext()) {
            lib lib = it.next();
    %>
    <tr onmouseover="this.style.backgroundColor='#ffff66';"
        onmouseout="this.style.backgroundColor='#d4e3e5';">
        <td><%=lib.getBookid()%>
        </td>
        <td><%=lib.getUsername()%>
        </td>

        <td><%=lib.getBook()%>
        </td>
        <td><%=lib.getDate1()%>
        </td>


    </tr>

    <%
        }
    %>


</table>

</body>
</html>