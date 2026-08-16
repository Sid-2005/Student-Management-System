package Controller;

import DB.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("UpdateStudent.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String Sid = req.getParameter("Sid");
        String SName = req.getParameter("SName");
        String PhoneNo = req.getParameter("PhoneNo");
        boolean flag = false;
        int pos = 0;
        int check = 0;

        if( (Sid != null && SName != null && PhoneNo!= null) && (!Sid.isEmpty() &&( !SName.isEmpty() || !PhoneNo.isEmpty())) )
            flag = true;

        if(flag)
        {
            if (PhoneNo.isEmpty())
                pos = 1;
            else if (SName.isEmpty())
                pos = 2;
            else
                pos = 3;

            Student student = new Student();
            student.setSid(Integer.valueOf(Sid));

            try {
                check = student.StudentExist(student);

                    if(check == 0)
                        req.setAttribute("Message", "No student found with ID: " + Sid);

                    else {

                        if(pos == 1)
                            student.setSname(SName);
                        else if (pos == 2) {
                            student.setPhone_no(PhoneNo);
                        }
                        else
                        {
                            student.setSname(SName);
                            student.setPhone_no(PhoneNo);
                        }

                        check = student.UpdateStudent(student,pos);

                        if(check == 0 )
                            req.setAttribute("Message", "student not Updated with ID: " + Sid);
                        else
                            req.setAttribute("Message", "Student Updated with ID: " + Sid);
                    }
            }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        else
        {
            req.setAttribute("Message", "Please fill in either the New Name or New Phone Number to update.");
        }
        req.getRequestDispatcher("UpdateStudent.jsp").forward(req, resp);
    }


}