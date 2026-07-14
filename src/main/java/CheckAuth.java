// Model to check Authentication

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class CheckAuth {

    private String UserMail;
    private String UserPassword;
    private String Retrieve_Pass;


    public String getRetrieve_Pass() {
        return Retrieve_Pass;
    }

    public void setRetrieve_Pass(String retrieve_Pass) {
        Retrieve_Pass = retrieve_Pass;
    }

    public String getUserMail() {
        return UserMail;
    }

    public void setUserMail(String userMail) {
        UserMail = userMail;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    public Boolean Check_Auth() throws SQLException {


        Connection conn = JdbcUtil.getConnection();

        String sql = "SELECT pword FROM auth_table where email = ?";

        PreparedStatement preStat = conn.prepareStatement(sql);
        preStat.setString(1, this.getUserMail());

        ResultSet rs = preStat.executeQuery();

        boolean isAuthenticated = false;

        if (rs.next()) {
            this.setRetrieve_Pass(rs.getString(1));
            isAuthenticated = this.getUserPassword().equals(this.getRetrieve_Pass());
        } else {
            System.out.println("No user found with email: " + this.getUserMail());

        }
        JdbcUtil.CloseReso(preStat, conn);

        rs.close();
        return isAuthenticated;

    }

}