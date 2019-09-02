package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.BoardDAO;
import kr.green.market.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public BoardVO registerAsk(String category, Integer board_no, String writer, String title, String contents) {
		if(category == null || board_no == null || writer == null || title == null || contents == null){
			return null;
		}
		boardDao.insertBoard(category, board_no, writer, title, contents);
		int no = boardDao.selectMaxBoard();
		return boardDao.selectBoard(no);
	}

	@Override
	public ArrayList<BoardVO> getAskListAll() {
		return boardDao.selectAskListAll();
	}

}
