package src.dao;


import src.db.DB;
import src.vo.lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 22787 on 2017/12/2.
 */
public class LibraryDaoImpI {

    private Connection conn = null;

    public LibraryDaoImpI() {
        conn = DB.getConn();
    }

    public List<lib> queryAll() {

        PreparedStatement prep = null;
        ResultSet rs = null;
        List<lib> list = new ArrayList<lib>();
        try {
            prep = conn.prepareStatement("SELECT *FROM lib ORDER BY bookid");
            rs = prep.executeQuery();
            while (rs.next()) {
                lib lib = new lib();
                lib.setUsername(rs.getString("username"));
                lib.setBookid(rs.getInt("bookid"));
                lib.setBook(rs.getString("book"));
                lib.setDate1(rs.getString("date"));

                list.add(lib);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (prep != null) {
                try {
                    prep.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;

    }
}
