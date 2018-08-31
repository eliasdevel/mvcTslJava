/*
 */
package dao;

import java.sql.PreparedStatement;
import java.util.List;
import models.State;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author elias
 */
public class StatesDao extends Standart {

    private List<State> states;

    public StatesDao(List<State> states) {
        this.con = con;
        this.states = states;
    }

    /**
     *
     * @return List of states
     * @throws SQLException
     */
    public List<State> getStates(State stateQ) throws SQLException {
        String query = "SELECT * FROM states ";
        if (stateQ != null) {
            query += "name ilike %'?'%";
        }

        PreparedStatement ps = this.con.prepareStatement(query + ";");

        if (stateQ != null) {
            ps.setString(1, stateQ.getName());
        }
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            State state = new State();
            //Setters
            state.setId(rs.getString("id"));
            state.setName(rs.getString("name"));
            this.states.add(state);

            //turn null, "minha mania"
            state = null;
        }
        return this.states;
    }

    public boolean saveState(State state) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = this.getById("states", state.getId());
        if (rs.next()) {
            ps = this.con.prepareStatement("UPDATE states set id = ? , name  = ? where id = ?;");
            ps.setString(1, state.getId());
            ps.setString(2, state.getName());
            ps.setString(3, state.getId());
        } else {
            ps = this.con.prepareStatement("insert into states values(?,?);");
            ps.setString(1, state.getId());
            ps.setString(2, state.getName());

        }
        return ps.execute();
    }

    public boolean delete(State state) throws SQLException {
        PreparedStatement ps = this.con.prepareStatement("DELETE FROM states where id = ?;");
        ps.setString(1, state.getId());
        return ps.execute();
    }

}
