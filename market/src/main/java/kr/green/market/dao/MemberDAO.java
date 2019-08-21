package kr.green.market.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("id")String id);

	void insertMember(@Param("mVo")MemberVO mVo);

	void updateMember(@Param("mVo")MemberVO mVo);

	MemberVO selectMemberFind(@Param("email")String email, @Param("name")String name);

}