package kr.green.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@Override
	public MemberVO modify(MemberVO mVo, String oldPassword) {
		if(mVo == null){
			return null;
		}
		MemberVO oVo = memberDao.selectMember(mVo.getId());
		if(oVo == null || !passwordEncoder.matches(oldPassword, oVo.getPassword())){
			return null;
		}
		mVo.setPassword(passwordEncoder.encode(mVo.getPassword()));
		memberDao.updateMember(mVo);
		return mVo;
	}

	@Override
	public boolean updateUserToSession(HttpServletRequest r, MemberVO oVo) {
		if(oVo == null){
			return false;
		}
		HttpSession s = r.getSession();
		s.removeAttribute("user");		//이전 회원정보 제거
		s.setAttribute("user", oVo);	//새 회원 정보 추가
		return true;
	}

	@Override
	public MemberVO idFind(String name, String email) {
		if(name == null || email == null){
			return null;
		}
		MemberVO mVo = memberDao.selectMemberFind(email, name);
		if(mVo == null){
			return null;
		}
		return mVo;
	}

	@Override
	public String getVal(String str) {
		String [] arr = str.split("=");	//입력받은 문자열을 =을 기준으로 배열로 나눠서 저장 
		if(arr.length == 2){	//배열의 길이가 2라면 	예시)id=xxx -> 0번지 = id, 1번지 = xxx
			return arr[1];	//배열의 1번지를 반환(실제 입력값인 xxx)
		}else{
			return "";
		}
	}
	
	
}
