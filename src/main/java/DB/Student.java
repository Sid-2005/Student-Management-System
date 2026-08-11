package DB;

import Util.JdbcUtil;
import com.mysql.cj.jdbc.JdbcConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Student {

    private Integer Sid;

    private String Sname;

    private String Phone_no;


    public Integer getSid() {
        return Sid;
    }

    public void setSid(Integer sid) {
        Sid = sid;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getPhone_no() {
        return Phone_no;
    }

    public void setPhone_no(String phone_no) {
        Phone_no = phone_no;
    }

    public List<Student> getAllStudent() throws SQLException {

        List<Student> studentList = new ArrayList<>();
        String query = "SELECT * FROM student_info";
        PreparedStatement preparedStatement = null;
        Connection connection = null;

        try {
            connection = JdbcUtil.getConnection();

            preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Student student = new Student();
                student.setSid(resultSet.getInt(1));
                student.setSname(resultSet.getString(2));
                student.setPhone_no(resultSet.getString(3));
                studentList.add(student);
            }
        }
        finally{

            JdbcUtil.CloseReso(preparedStatement, connection);
        }
        return studentList;
    }

}
