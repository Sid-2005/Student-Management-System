import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {


    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String UserMail = req.getParameter("umail");
        String UserPassword = req.getParameter("upassword");

        CheckAuth obj = new CheckAuth();

        obj.setUserMail(UserMail);
        obj.setUserPassword(UserPassword);

        Boolean isAuth;
        try {
            isAuth = obj.Check_Auth();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (isAuth) {
            res.sendRedirect(req.getContextPath() + "/Dashboard.jsp");
        } else {
            res.sendRedirect(req.getContextPath() + "/LoginFailed.jsp");
        }


    }
}