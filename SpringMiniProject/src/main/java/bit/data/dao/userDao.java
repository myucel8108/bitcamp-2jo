package bit.data.dao;

import bit.data.dto.userdto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class userDao implements userDaoInter{
    @Autowired
    SqlSession session;
    String ns = "bit.bit.data.UserDao.";

    @Override
    public void insertUser(userdto dto) {
        session.insert(ns+"insertUser",dto);
    }

    @Override
    public int checkId(String userid) {
        return session.selectOne(ns+"checkId",userid);
    }

    @Override
    public int checkIdPass(Map<String, String> map) {

        return session.selectOne(ns+"checkIdPass",map);
    }
}
