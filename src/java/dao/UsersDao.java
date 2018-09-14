/*
 */
package dao;

import java.sql.PreparedStatement;
import java.util.List;
import models.State;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Address;
import models.User;

/**
 *
 * @author elias
 */
public class UsersDao extends Standart {

    private List<User> users;
    private AddressDao addressDao;

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
        ResultSet rs = this.getById("users", user.getId() + "");
        if (rs.next()) {
            ps = this.con.prepareStatement("UPDATE users set name  = ? , email = ?, cpf = ? , type= ? where id = ?;");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCpf());
            ps.setString(4, user.getType());
            ps.setInt(5, user.getId());
        } else {
            ps = this.con.prepareStatement("insert into users (name,email,cpf,type,address_id) values(?,?,?,?,?);");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCpf());
            ps.setString(4, user.getType());
            ps.setInt(5, user.getAddress().getId());
        }
        return ps.execute();
    }

    public User getUser(int id) throws SQLException {
        User u = new User();
        ResultSet rs = this.getById("users", id + "");
        rs.next();
        u.setCpf(rs.getString("cpf"));
        u.setType(rs.getString("type"));
        u.setEmail(rs.getString("email"));
        this.addressDao = new AddressDao(new ArrayList<Address>());
        u.setAddress(this.addressDao.getAddress(rs.getInt("address_id")));
        u.setName(rs.getString("name"));
        return u;
    }

}
