package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.MemberDto;

@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	SqlSession session;
	String ns = "bit.data.dao.MemberDao.";
		
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		//원래는 앞에 namespace.id인데 생략가능 (다른 파일에 같은 아이디가 있을 수도 있으므로 붙이는 것이 좋음)
		return session.selectOne(ns + "getTotalCount");
	}

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return session.selectList(ns + "getAllMembers");
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		session.insert(ns+"insertMember", dto);

	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "getIdSearch", id);
	}

	@Override
	public String getName(String id) {
		return session.selectOne(ns + "getName", id);
	}

	@Override
	public int getIdPassCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "loginIdPassCheck", map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "getDataById", id);
	}

	@Override
	public MemberDto getDataByNum(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "getDataByNum", num);
	}

	@Override
	public void updatePhoto(Map<String, Object> map) {
		// TODO Auto-generated method stub
		session.update(ns + "updatePhoto", map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		session.update(ns + "updateMember", dto);
	}

	@Override
	public void deleteMember(int num) {
		// TODO Auto-generated method stub
		session.delete(ns + "deleteMember", num);
	}
}
