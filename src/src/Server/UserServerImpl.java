package src.Server;


import src.dao.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 22787 on 2017/12/1.
 */
@WebServlet(name = "userServerImpl", urlPatterns = {"/user"},
        initParams = {
                @WebInitParam(name = "success", value = "indexlogin.jsp")
        })
public class UserServerImpl extends HttpServlet {
    UserDaoImpl dao = new UserDaoImpl();
    private Map<String, String> map = new HashMap();

    @Override
    public void init() throws ServletException {

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean flag;
        flag = dao.loginUser(username, password);
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        if (flag == true) {
            out.print(username);
        } else {
            out.print("no");
        }

        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
