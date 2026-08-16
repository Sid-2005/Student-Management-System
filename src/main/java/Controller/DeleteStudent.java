package Controller;

import DB.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("DeleteStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Sid = req.getParameter("Sid");

        if (Sid != null && !Sid.isEmpty()) {
            Student student = new Student();
            student.setSid(Integer.valueOf(Sid));

            try {
                int check = student.deleteStudent(student);

                if (check == 0) {
                    req.setAttribute("Message", "No student found with ID: " + Sid);
                } else {
                    req.setAttribute("Message", "Student successfully deleted with ID: " + Sid);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("Message", "Please enter a valid Student ID.");
        }

        req.getRequestDispatcher("DeleteStudent.jsp").forward(req, resp);
    }
}