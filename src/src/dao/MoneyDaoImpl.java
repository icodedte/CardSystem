package src.dao;


import src.db.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 22787 on 2017/12/2.
 */
public class MoneyDaoImpl {
    Map<String, String> map = new HashMap<>();
    private Connection conn = null;

    public MoneyDaoImpl() {
        conn = DB.getConn();
    }


    public boolean usemoney(String username1, int usemoney) {
        PreparedStatement prep = null;
        ResultSet rs = null;
        boolean flag = false;
        try {
            prep = conn.prepareStatement("SELECT money FROM xiqu WHERE username=?");
            prep.setString(1, username1);
            rs = prep.executeQuery();
            while (rs.next()) {
                usemoney = rs.getInt("money") - usemoney;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (usemoney >= 0) {
            try {
                flag = true;
                prep = conn.prepareStatement("UPDATE xiqu SET money=? WHERE username=?");
                prep.setInt(1, usemoney);
                prep.setString(2, username1);
                prep.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (prep != null) {
                    try {
                        prep.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }


            }
            try {
                prep = conn.prepareStatement("INSERT into money(username,usemoney,usedata)VALUE (?,?,?)");
                prep.setString(1, username1);
                prep.setInt(2, usemoney);
                String c = "1204";
                prep.setString(3, c);
                prep.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (prep != null) {
                    try {
                        prep.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            flag = false;
        }
        return flag;
    }
}