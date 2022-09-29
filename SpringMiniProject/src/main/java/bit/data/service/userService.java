package bit.data.service;

import bit.data.dao.userDaoInter;
import bit.data.dto.userdto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class userService implements userServiceInter{

    @Autowired
    userDaoInter userDao;

    @Override
    public void insertUser(userdto dto) {
        userDao.insertUser(dto);
    }

    @Override
    public int checkId(String userid) {
        return userDao.checkId(userid);
    }

    @Override
    public int checkIdPass(String userid, String userpass) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("userid",userid);
        map.put("userpass",userpass);
        return userDao.checkIdPass(map);
    }
}
