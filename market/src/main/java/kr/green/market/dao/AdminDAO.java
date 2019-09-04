package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminDAO {

	ArrayList<MemberVO> selectAllMemberList();

	ArrayList<SellerVO> selectRequestSellerList();

	void updateAgreeSeller(@Param("sVo")SellerVO sVo);

	ArrayList<CouponVO> selectCouponList();

	void updateCoupon(@Param("cVo")CouponVO cVo);

	void insertCoupon(@Param("cVo")CouponVO cVo);

	int selectMaxCouponNo();

	CouponVO selectCoupon(@Param("no")int no);

	void insertBoard(@Param("bVo")BoardVO bVo);

	ArrayList<BoardVO> selectBoardListAll();

	void updateBoard(@Param("bVo")BoardVO bVo1);
}
