/*
 */
package dao;

import static com.mysql.cj.jdbc.admin.TimezoneDump.main;
import com.mysql.cj.xdevapi.Result;
import java.util.List;
import models.State;
import db.ConexaoBD;
import java.sql.Connection;
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

    public List<State> getStates() throws SQLException {
        Statement st = this.con.createStatement();
        ResultSet rs = st.executeQuery("Select * from states;");
        while (rs.next()) {
            State state = new State();
            state.setId(rs.getString("id"));
            state.setName(rs.getString("name"));
            this.states.add(state);
            state = null;
        }
        return this.states;
    }
}