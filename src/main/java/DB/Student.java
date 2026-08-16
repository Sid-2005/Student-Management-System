package DB;

import Util.JdbcUtil;
import com.mysql.cj.jdbc.JdbcConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

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

    public Student searchStudent(Student s) throws SQLException {

        String query = "SELECT * FROM student_info WHERE Sid = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = null;

        try {
            connection = JdbcUtil.getConnection();
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1,s.getSid());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                s.setSname(resultSet.getString("Sname"));
                s.setPhone_no(resultSet.getString("Phone_no"));
                return s;
            } else {
                return null;
            }

        } finally {
            JdbcUtil.CloseReso(preparedStatement, connection);
        }

    }

    public int AddStudent(Student student) throws SQLException {

        String query = "INSERT INTO student_info VALUES(?,?,?)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = JdbcUtil.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,student.getSid());
            preparedStatement.setString(2,student.getSname());
            preparedStatement.setString(3,student.getPhone_no());

            return preparedStatement.executeUpdate();

        }
        catch (SQLException e) {
            System.out.println("Insert Failed (Likely Duplicate ID): " + e.getMessage());
            return 0;
        }
        finally {
            JdbcUtil.CloseReso(preparedStatement,connection);
        }
    }
}
