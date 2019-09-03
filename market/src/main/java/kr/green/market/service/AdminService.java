package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminService {

	ArrayList<MemberVO> getAllMemberList();

	ArrayList<SellerVO> getRequestSellerList();

	boolean agreeSeller(String id);

	boolean changeMemberGrade(String id, String grade);

}
