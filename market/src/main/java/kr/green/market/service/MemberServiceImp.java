package kr.green.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.market.dao.MemberDAO;
import kr.green.market.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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

	@Override
	public void signup(MemberVO mVo) {
		if(mVo == null){
			return;
		}
		if(mVo.getName() == null){
			mVo.setName("");
		}
		if(mVo.getPhone() == null){
			mVo.setPhone("");
		}
		if(mVo.getAddress() == null){
			mVo.setAddress("");
		}
		if(mVo.getBank() == null){
			mVo.setBank("");
		}
		if(mVo.getAccount() == null){
			mVo.setAccount("");
		}
		mVo.setPassword(passwordEncoder.encode(mVo.getPassword()));		
		memberDao.insertMember(mVo);
	}

	@Override
	public MemberVO signin(MemberVO mVo) {
		if(mVo == null){
			return null;
		}
		MemberVO oVo = memberDao.selectMember(mVo.getId());
		if(oVo == null){
			return null;
		}
		if(!passwordEncoder.matches(mVo.getPassword(), oVo.getPassword())){
			return null;
		}
		return oVo;
	}

}
