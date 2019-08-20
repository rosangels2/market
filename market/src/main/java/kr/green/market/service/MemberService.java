package kr.green.market.service;

import javax.servlet.http.HttpServletRequest;

import kr.green.market.vo.MemberVO;

public interface MemberService {

	MemberVO getMember(String id);

	void signup(MemberVO mVo);

	MemberVO signin(MemberVO mVo);

	MemberVO modify(MemberVO mVo, String oldPassword);

	boolean updateUserToSession(HttpServletRequest r, MemberVO oVo);

	MemberVO idFind(String name, String email);

	String getVal(String str);

}
