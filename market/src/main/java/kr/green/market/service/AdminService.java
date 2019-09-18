package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.pagination.Criteria;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminService {

	ArrayList<MemberVO> getAllMemberList(Criteria cri);

	ArrayList<SellerVO> getRequestSellerList(Criteria cri);

	boolean agreeSeller(String id);

	boolean changeMemberGrade(String id, String grade);

	ArrayList<CouponVO> getCouponList();

	boolean deleteCoupon(Integer coupon_no);

	CouponVO addCoupon(CouponVO cVo);

	boolean registerBoard(BoardVO bVo);

	ArrayList<BoardVO> getBoardListAll(Criteria cri);

	BoardVO modifyBoard(BoardVO bVo);

	void deleteBoard(Integer board_no);

	ArrayList<BoardVO> getAskListAll(Criteria cri);

	ArrayList<CommentVO> getCommentListAll(Criteria cri);

	ArrayList<BoardVO> getReplyListAll(Criteria cri);

	boolean deleteComment(Integer no);

	boolean deleteAsk(Integer no);

	boolean deleteReply(Integer no);

	int getTotalCountMemberList(Criteria cri);

	int getTotalCountRequestSellerList(Criteria cri);

	int getTotalCountAskList(Criteria cri);

	int getTotalCountReplyList(Criteria cri);

	int getTotalCountCommentList(Criteria cri);

	int getTotalCountBoardList(Criteria cri);

}
