package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.AdminDAO;
import kr.green.market.dao.BoardDAO;
import kr.green.market.dao.ItemDAO;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.ItemVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	@Autowired
	AdminDAO adminDao;
	@Autowired
	ItemDAO itemDao;
	
	@Override
	public BoardVO registerAsk(String category, Integer board_no, String writer, String title, String contents) {
		if(category == null || board_no == null || writer == null || title == null || contents == null){
			return null;
		}
		String state = "답변대기";
		Integer item_no = null;
		boardDao.insertBoard(category, board_no, item_no, writer, title, contents, state);
		int no = boardDao.selectMaxBoard();
		return boardDao.selectBoard(no);
	}

	@Override
	public ArrayList<BoardVO> getAskListAll(Integer item_no) {
		return boardDao.selectAskListAll(item_no);
	}

	@Override
	public ArrayList<BoardVO> getMyAskList(Integer item_no, String id) {
		if(item_no == null || id == null){
			return null;
		}
		return boardDao.selectMyAskList(item_no, id);
	}

	@Override
	public ArrayList<CommentVO> getCommentList(Integer item_no) {
		if(item_no == null) {
			return null;
		}
		return boardDao.selectCommentList(item_no);
	}

	@Override
	public CommentVO registerComment(String category, Integer board_no, String writer, String to, String contents) {
		if(category == "" || board_no == null || writer == "" || contents == "") {
			return null;
		}
		boardDao.insertComment(category, board_no, writer, to, contents);	//댓글 등록
		int no = boardDao.selectMaxComment();	//등록한 댓글 번호 가져오기
		ItemVO iVo = itemDao.selectItem(board_no);
		if(iVo != null){
			iVo.setComment(iVo.getComment()+1);		//댓글 수 증가
			itemDao.updateItem(iVo);
		}
		return boardDao.selectComment(no);
	}

	@Override
	public BoardVO getBoard(Integer board_no) {
		if(board_no == null) {
			return null;
		}
		BoardVO bVo = boardDao.selectBoard(board_no);
		if(bVo == null) {
			return null;
		}
		return bVo;
	}

	@Override
	public boolean addViews(Integer no) {
		if(no == null) {
			return false;
		}
		BoardVO bVo = boardDao.selectBoard(no);
		if(bVo == null) {
			return false;
		}
		bVo.setViews(bVo.getViews()+1);
		adminDao.updateBoard(bVo);
		return true;
	}

	@Override
	public BoardVO registerReply(BoardVO bVo) {
		if(bVo == null) {
			return null;
		}
		BoardVO oVo = boardDao.selectBoard(bVo.getBoard_no());
		if(oVo == null || oVo.getBoard_no() != bVo.getItem_no()) {	//답변할 글의 상품 번호와 답변의 상품 번호가 다르다면
			return null;
		}
		BoardVO bVo1 = boardDao.selectReply(bVo.getBoard_no());
		if(bVo1 == null){	//답변이 없다면
			boardDao.insertBoard(bVo.getCategory(), bVo.getBoard_no(), bVo.getItem_no(), bVo.getWriter(), bVo.getTitle(), bVo.getContents(), bVo.getState());
		}else {		//답변이 있다면
			boardDao.updateReply(bVo);
		}
		boardDao.updateBoardState(bVo.getBoard_no(), "답변완료");
		return boardDao.selectReply(bVo.getBoard_no());
	}

	@Override
	public ArrayList<BoardVO> getReplyList(Integer item_no) {
		if(item_no == null) {
			return null;
		}
		return boardDao.selectReplyList(item_no);
	}

	@Override
	public boolean deleteComment(CommentVO cVo) {
		if(cVo == null) {
			return false;
		}
		CommentVO cVo1 = boardDao.selectComment(cVo.getNo());
		if(cVo1 == null || !cVo1.getWriter().equals(cVo.getWriter())) {
			return false;
		}
		cVo1.setValid("D");
		boardDao.updateComment(cVo1);
		return true;
	}
}
