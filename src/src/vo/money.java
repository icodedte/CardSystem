package src.vo;

import java.util.Date;

/**
 * Created by 22787 on 2017/12/2.
 */
public class money {
    String username;
    int usemoney;
    String date;
    Date usedata;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getUsemoney() {
        return usemoney;
    }

    public void setSpend(int spendmoney) {
        this.usemoney = spendmoney;
    }
}
