package bit.data.service;

import bit.data.dto.userdto;

import java.util.Map;

public interface userServiceInter {
    public void insertUser(userdto dto);
    public int checkId(String userid);
    public int checkIdPass(String userid, String userpass);
}