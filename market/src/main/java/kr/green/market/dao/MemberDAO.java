package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.AddressListVO;
import kr.green.market.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("id")String id);

	void insertMember(@Param("mVo")MemberVO mVo);

	void updateMember(@Param("mVo")MemberVO mVo);

	MemberVO selectMemberFind(@Param("email")String email, @Param("name")String name);

	Integer selectSellerNo(String id);

	ArrayList<AddressListVO> selectAddressList(@Param("id")String id);

}