package kr.green.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.MemberDAO;
import kr.green.market.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	
	@Override
	public MemberVO getMember(String id) {
		if(id == null){
			return null;	
		}
		MemberVO mVo = memberDao.selectMember(id);
		if(mVo == null){
			return null;
		}
		return mVo;
	}

}
