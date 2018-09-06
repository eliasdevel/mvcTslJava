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
import models.City;

/**
 *
 * @author elias
 */
public class AddressDao extends Standart {

    private List<Address> addresses;
    private CitysDao citysDao;

    public AddressDao(List<Address> addresses) {
        this.con = con;
        this.addresses = addresses;
    }

    /**
     *
     * @return List of states
     * @throws SQLException
     */
    public List<Address> getAddresses(Address stateQ) throws SQLException {
        this.citysDao = new CitysDao(new ArrayList<City>());
        
        
        String query = "SELECT * FROM addresses";
        if (stateQ != null) {
            query += "street ilike %'?'%";
        }

        PreparedStatement ps = this.con.prepareStatement(query + ";");

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Address address = new Address();
            //Setters
            address.setId(rs.getInt("id"));
            address.setCep(rs.getString("cep"));
            address.setHint(rs.getString("hint"));
            address.setStreet(rs.getString("street"));
            address.setCity(this.citysDao.getCity(rs.getInt("cityid")));
            this.addresses.add(address);

            //turn null, "minha mania"
            address = null;
        }
        return this.addresses;
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
    
     public Address getAddress(int id) throws SQLException {
        ResultSet rs = this.getById("addresses", id+"" );
        rs.next();
        Address a = new Address();
        a.setId(rs.getInt("id"));
        a.setCep(rs.getString("cep"));
        a.setHint(rs.getString("hint"));
        a.setStreet(rs.getString("street"));
        this.citysDao = new CitysDao(new ArrayList<City>());
        a.setCity(this.citysDao.getCity(rs.getInt("city_id")));
        return a;
    }

}
