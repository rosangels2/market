package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;

public interface BoardService {

	BoardVO registerAsk(String category, Integer board_no, String writer, String title, String contents);

	ArrayList<BoardVO> getAskListAll(Integer item_no);

	ArrayList<BoardVO> getMyAskList(Integer item_no, String id);

	ArrayList<CommentVO> getCommentList(Integer item_no);

	CommentVO registerComment(String category, Integer board_no, String writer, String to, String contents);

	BoardVO getBoard(Integer board_no);

}
