package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.BoardVO;

public interface BoardService {

	BoardVO registerAsk(String category, Integer board_no, String writer, String title, String contents);

	ArrayList<BoardVO> getAskListAll();

}
