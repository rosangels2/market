package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.BoardDAO;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public BoardVO registerAsk(String category, Integer board_no, String writer, String title, String contents) {
		if(category == null || board_no == null || writer == null || title == null || contents == null){
			return null;
		}
		String state = "답변 대기";
		boardDao.insertBoard(category, board_no, writer, title, contents, state);
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
		boardDao.insertComment(category, board_no, writer, to, contents);
		int no = boardDao.selectMaxComment();
		System.out.println("selectMaxComment no : " + no);
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
}
