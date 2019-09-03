package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminDAO {

	ArrayList<MemberVO> selectAllMemberList();

	ArrayList<SellerVO> selectRequestSellerList();

	void updateAgreeSeller(@Param("sVo")SellerVO sVo);
}
