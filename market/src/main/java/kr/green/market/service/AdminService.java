package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminService {

	ArrayList<MemberVO> getAllMemberList();

	ArrayList<SellerVO> getRequestSellerList();

	boolean agreeSeller(String id);

	boolean changeMemberGrade(String id, String grade);

	ArrayList<CouponVO> getCouponList();

	boolean deleteCoupon(Integer coupon_no);

	CouponVO addCoupon(CouponVO cVo);

	boolean registerBoard(BoardVO bVo);

	ArrayList<BoardVO> getBoardListAll();

}
