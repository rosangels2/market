package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.BoardVO;

public interface BoardDAO {

	void insertBoard(@Param("category")String category, @Param("board_no")Integer board_no, @Param("writer")String writer, @Param("title")String title, @Param("contents")String contents);

	int selectMaxBoard();

	BoardVO selectBoard(@Param("no")int no);

	ArrayList<BoardVO> selectAskListAll(@Param("board_no")Integer item_no);

	ArrayList<BoardVO> selectMyAskList(@Param("board_no")Integer item_no, @Param("writer")String id);

}
