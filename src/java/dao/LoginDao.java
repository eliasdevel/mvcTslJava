/*
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author elias
 */
public class LoginDao extends Standart {

    HttpSession sess;

    public LoginDao(HttpSession sess) {
        this.sess = sess;

    }

    /**
     *
     * @return List of states
     * @throws SQLException
     */
    public boolean logged() throws SQLException {

        Statement st = this.con.createStatement();

        ResultSet rs = st.executeQuery("Select * from users where type = 'R' "
                + "and email = '" + this.sess.getAttribute("email") + "' "
                + "and password = '" + this.sess.getAttribute("password") + "';");
        User user = new User();
        while (rs.next()) {

            //Setters
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setCpf(rs.getString("cpf"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setType(rs.getString("type"));

            //turn null, "minha mania"
        }
        return (this.sess.getAttribute("email") == null ? user.getEmail() == null : this.sess.getAttribute("email").equals(user.getEmail())) && (this.sess.getAttribute("password") == null ? user.getPassword() == null : this.sess.getAttribute("password").equals(user.getPassword()));
    }
}
