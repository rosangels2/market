package kr.green.market.service;

import kr.green.market.vo.MemberVO;

public interface MemberService {

	MemberVO getMember(String id);

	void signup(MemberVO mVo);

}
