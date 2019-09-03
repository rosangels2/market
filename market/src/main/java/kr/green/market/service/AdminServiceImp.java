package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.AdminDAO;
import kr.green.market.dao.MemberDAO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public ArrayList<MemberVO> getAllMemberList() {
		return adminDao.selectAllMemberList();
	}

	@Override
	public ArrayList<SellerVO> getRequestSellerList() {
		return adminDao.selectRequestSellerList();
	}

	@Override
	public boolean agreeSeller(String id) {
		if(id == null) {
			return false;
		}
		SellerVO sVo = memberDao.selectSeller(id);
		if(sVo == null) {
			return false;
		}
		sVo.setState("승인완료");
		sVo.setValid("I");
		adminDao.updateAgreeSeller(sVo);
		return true;
	}

	@Override
	public boolean changeMemberGrade(String id, String grade) {
		if(id == "" || grade == "") {
			return false;
		}
		MemberVO mVo = memberDao.selectMember(id);
		System.out.println("changeMemberGradeSMP : " + mVo);
		if(mVo == null) {
			return false;
		}
		mVo.setGrade(grade);
		System.out.println("changeMemberGradeSMP : " + mVo);
		memberDao.updateMember(mVo);
		return true;
	}

}
