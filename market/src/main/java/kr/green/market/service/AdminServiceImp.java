package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.AdminDAO;
import kr.green.market.dao.BoardDAO;
import kr.green.market.dao.ItemDAO;
import kr.green.market.dao.MemberDAO;
import kr.green.market.pagination.Criteria;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	ItemDAO itemDao;
	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<MemberVO> getAllMemberList(Criteria cri) {
		return adminDao.selectAllMemberList(cri);
	}

	@Override
	public ArrayList<SellerVO> getRequestSellerList() {
		return adminDao.selectRequestSellerList();
	}

	@Override
	public boolean agreeSeller(String id) {
		if(id == null) {
			return false;
		}
		SellerVO sVo = memberDao.selectSeller(id);
		if(sVo == null) {
			return false;
		}
		sVo.setState("승인완료");
		sVo.setValid("I");
		adminDao.updateAgreeSeller(sVo);
		return true;
	}

	@Override
	public boolean changeMemberGrade(String id, String grade) {
		if(id == "" || grade == "") {
			return false;
		}
		MemberVO mVo = memberDao.selectMember(id);
		System.out.println("changeMemberGradeSMP : " + mVo);
		if(mVo == null) {
			return false;
		}
		mVo.setGrade(grade);
		System.out.println("changeMemberGradeSMP : " + mVo);
		memberDao.updateMember(mVo);
		return true;
	}

	@Override
	public ArrayList<CouponVO> getCouponList() {
		return adminDao.selectCouponList();
	}

	@Override
	public boolean deleteCoupon(Integer coupon_no) {
		if(coupon_no == null) {
			return false;
		}
		CouponVO cVo = itemDao.selectCoupon(coupon_no);
		System.out.println("deleteCouponSMP cVo : " + cVo);
		if(cVo == null) {
			return false;
		}
		cVo.setState("만료");
		cVo.setValid("D");
		adminDao.updateCoupon(cVo);
		return true;
	}

	@Override
	public CouponVO addCoupon(CouponVO cVo) {
		if(cVo == null) {
			return null;
		}
		adminDao.insertCoupon(cVo);
		int no = adminDao.selectMaxCouponNo();
		return adminDao.selectCoupon(no);
	}

	@Override
	public boolean registerBoard(BoardVO bVo) {
		if(bVo == null) {
			return false;
		}
		adminDao.insertBoard(bVo);
		return true;
	}

	@Override
	public ArrayList<BoardVO> getBoardListAll() {
		return adminDao.selectBoardListAll();
	}

	@Override
	public BoardVO modifyBoard(BoardVO bVo) {
		if(bVo == null) {
			return null;
		}
		BoardVO bVo1 = boardDao.selectBoard(bVo.getNo());
		if(bVo1 == null){
			return null;
		}
		bVo1.setTitle(bVo.getTitle());
		bVo1.setContents(bVo.getContents());
		bVo1.setViews(bVo1.getViews()-1);
		adminDao.updateBoard(bVo1);
		return bVo1;
	}

	@Override
	public void deleteBoard(Integer board_no) {
		if(board_no == null) {
			return;
		}
		BoardVO bVo = boardDao.selectBoard(board_no);
		if(bVo == null) {
			return;
		}
		bVo.setValid("D");
		adminDao.updateBoard(bVo);
	}

	@Override
	public ArrayList<BoardVO> getAskListAll() {
		return adminDao.selectAskListAll();
	}

	@Override
	public ArrayList<CommentVO> getCommentListAll() {
		return adminDao.selectCommentListAll();
	}

	@Override
	public ArrayList<BoardVO> getReplyListAll() {
		return adminDao.selectReplyListAll();
	}

	@Override
	public boolean deleteComment(Integer no) {
		if(no == null) {
			return false;
		}
		adminDao.deleteComment(no);
		return true;
	}

	@Override
	public boolean deleteAsk(Integer no) {
		if(no == null) {
			return false;
		}
		adminDao.deleteBoard(no);
		return true;
	}

	@Override
	public boolean deleteReply(Integer no) {
		if(no == null) {
			return false;
		}
		adminDao.deleteBoard(no);
		return true;
	}

	@Override
	public int getTotalCountMemberList(Criteria cri) {
		return adminDao.getTotalCountMemberList(cri);
	}

}
