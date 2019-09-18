package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.pagination.Criteria;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

public interface AdminDAO {

	ArrayList<MemberVO> selectAllMemberList(@Param("cri")Criteria cri);

	ArrayList<SellerVO> selectRequestSellerList(@Param("cri")Criteria cri);

	void updateAgreeSeller(@Param("sVo")SellerVO sVo);

	ArrayList<CouponVO> selectCouponList();

	void updateCoupon(@Param("cVo")CouponVO cVo);

	void insertCoupon(@Param("cVo")CouponVO cVo);

	int selectMaxCouponNo();

	CouponVO selectCoupon(@Param("no")int no);

	void insertBoard(@Param("bVo")BoardVO bVo);

	ArrayList<BoardVO> selectBoardListAll(@Param("cri")Criteria cri);

	void updateBoard(@Param("bVo")BoardVO bVo1);

	ArrayList<BoardVO> selectAskListAll(@Param("cri")Criteria cri);

	ArrayList<CommentVO> selectCommentListAll(@Param("cri")Criteria cri);

	ArrayList<BoardVO> selectReplyListAll(@Param("cri")Criteria cri);

	void deleteComment(@Param("no")Integer no);

	void deleteBoard(@Param("no")Integer no);

	int getTotalCountMemberList(@Param("cri")Criteria cri);

	int getTotalCountRequestSellerList(@Param("cri")Criteria cri);

	int getTotalCountAskList(@Param("cri")Criteria cri);

	int getTotalCountReplyList(@Param("cri")Criteria cri);

	int getTotalCountCommentList(@Param("cri")Criteria cri);

	int getTotalCountBoardList(@Param("cri")Criteria cri);
}
