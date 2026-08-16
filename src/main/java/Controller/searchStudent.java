package Controller;


import DB.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/searchStudent")
public class searchStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sidParam = req.getParameter("Sid");

        if (sidParam != null && !sidParam.isEmpty()) {
            try {
                Student student = new Student();
                student.setSid(Integer.valueOf(sidParam));

                student = student.searchStudent(student);

                if (student != null) {
                    req.setAttribute("studentData", student);
                } else {
                    req.setAttribute("errorMessage", "No student found with ID: " + sidParam);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        req.getRequestDispatcher("searchStudent.jsp").forward(req, resp);
    }
}