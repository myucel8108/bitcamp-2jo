package bit.data.dao;

import bit.data.dto.userdto;

import java.util.Map;

public interface userDaoInter {
    public void insertUser(userdto dto);
    public int checkId(String userid);
    public int checkIdPass(Map<String, String> map);
}
