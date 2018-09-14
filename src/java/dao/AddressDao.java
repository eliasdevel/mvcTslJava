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

    public boolean saveAddress(Address address) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = this.getById("addresses", address.getId()+"");
        if (rs.next()) {
            ps = this.con.prepareStatement("UPDATE addresses  set cep = ? , hint = ?,street = ?, city_id = ? where id = ?;");
            ps.setString(1, address.getCep());
            ps.setString(2, address.getHint());
            ps.setString(3, address.getStreet());
            ps.setInt(4,  address.getCity().getId());
            ps.setInt(5,  address.getId());
        } else {
            ps = this.con.prepareStatement("insert into addresses (cep,hint,street,city_id)values(?,?,?,?);");
            ps.setString(1, address.getCep());
            ps.setString(2, address.getHint());
            ps.setString(3, address.getStreet());
            ps.setInt(4, address.getCity().getId());
            rs =  this.con.createStatement().executeQuery("SELECT nextval('addresses_id_sequence');");
            rs.next();
            address.setId(rs.getInt(1)+1);
        }
        return ps.execute();
    }

    public boolean delete(Address addr) throws SQLException {
        PreparedStatement ps = this.con.prepareStatement("DELETE FROM addresses where id = ?;");
        ps.setInt(1, addr.getId());
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
