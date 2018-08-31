/*
 */
package dao;

import java.sql.PreparedStatement;
import java.util.List;
import models.State;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import models.User;

/**
 *
 * @author elias
 */
public class UsersDao extends Standart {

    private List<User> users;

    public UsersDao(List<User> users) {
        this.con = con;
        this.users = users;
    }

    /**
     *
     * @return List of states
     * @throws SQLException
     */
    public List<User> getUsers(State stateQ) throws SQLException {
        String query = "SELECT * FROM users ";
        if (stateQ != null) {
            query += "name ilike %'?'%";
        }

        PreparedStatement ps = this.con.prepareStatement(query + ";");

        if (stateQ != null) {
            ps.setString(1, stateQ.getName());
        }
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User user = new User();
            //Setters
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setCpf(rs.getString("cpf"));
            this.users.add(user);

            //turn null, "minha mania"
            user = null;
        }
        return this.users;
    }

    public boolean saveUser(User user) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = this.getById("users", user.getId()+"");
        if (rs.next()) {
            ps = this.con.prepareStatement("UPDATE users  name  = ? where id = ?;");
            ps.setString(1, user.getName());
            ps.setInt(2,  user.getId());
        } else {
            ps = this.con.prepareStatement("insert into users values(?,?);");
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());

        }
        return ps.execute();
    }

   

}
