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
import models.City;

/**
 *
 * @author elias
 */
public class CitysDao extends Standart {

    private List<City> citys;
    private StatesDao statesDao;
    public CitysDao(List<City> citys) {
        this.con = con;
        this.citys = citys;
    }

    /**
     *
     * @return List of citys
     * @throws SQLException
     */
    public List<City> getCitys(City cityQ) throws SQLException {
        String query = "SELECT * FROM citys ";
        if (cityQ != null) {
            query += "name ilike %'?'%";
        }

        PreparedStatement ps = this.con.prepareStatement(query + ";");

        if (cityQ != null) {
            ps.setString(1, cityQ.getName());
        }
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            City city = new City();
            //Setters
            city.setId(rs.getInt("id"));
            city.setName(rs.getString("name"));

            this.citys.add(city);
            //turn null, "minha mania"
            city = null;
        }
        return this.citys;
    }

    public boolean saveCity(City city) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = this.getById("citys", city.getId() + "");
        if (rs.next()) {
            ps = this.con.prepareStatement("UPDATE citys  name  = ? where id = ?;");
            ps.setString(1, city.getName());
            ps.setInt(2, city.getId());
        } else {
            ps = this.con.prepareStatement("insert into citys values(?,?);");
            ps.setInt(1, city.getId());
            ps.setString(2, city.getName());

        }
        return ps.execute();
    }

    public City getCity(int id) throws SQLException {
        this.statesDao = new StatesDao(new ArrayList<State>());
        ResultSet rs = this.getById("citys", id + "");
        rs.next();
        City c = new City();
        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        c.setState(this.statesDao.getState(rs.getString("state_id")));
        return c;
    }

}
