package Controller;

import DB.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/allStudent")
public class allStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Student student = new Student();
            List<Student> studentList = student.getAllStudent();

            req.setAttribute("studentList", studentList);

            req.getRequestDispatcher("displayStudent.jsp").forward(req,resp);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}