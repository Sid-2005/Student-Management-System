package Controller;

import DB.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("AddStudent.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String Sid = req.getParameter("Sid");
        String Sname = req.getParameter("Sname");
        String PhoneNo = req.getParameter("PhoneNo");
        boolean flag = false;

        if ((Sid != null && PhoneNo != null && Sname != null) && (!Sid.isEmpty() && !PhoneNo.isEmpty() && !Sname.isEmpty()))
            flag = true;

        if (flag) {
            try {
                Student student = new Student();
                student.setSid(Integer.valueOf(Sid));
                student.setSname(Sname);
                student.setPhone_no(PhoneNo);

                int check = student.AddStudent(student);
                req.setAttribute("check", check);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }
        req.getRequestDispatcher("AddStudent.jsp").forward(req, resp);
    }
}