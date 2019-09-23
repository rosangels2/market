package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;

public interface BoardDAO {

	void insertBoard(@Param("category")String category, @Param("board_no")Integer board_no, @Param("item_no")Integer item_no, @Param("writer")String writer, @Param("to")String to, @Param("title")String title, @Param("contents")String contents, @Param("state")String state);

	int selectMaxBoard();

	BoardVO selectBoard(@Param("no")int no);

	ArrayList<BoardVO> selectAskListAll(@Param("board_no")Integer item_no);

	ArrayList<BoardVO> selectMyAskList(@Param("board_no")Integer item_no, @Param("writer")String id);

	ArrayList<CommentVO> selectCommentList(@Param("board_no")Integer item_no);

	void insertComment(@Param("category")String category, @Param("board_no")Integer board_no, @Param("writer")String writer, @Param("to")String to, @Param("contents")String contents);

	int selectMaxComment();

	CommentVO selectComment(@Param("no")int no);

	void updateBoardState(@Param("no")Integer board_no, @Param("state")String string);

	BoardVO selectReply(@Param("board_no")Integer board_no);

	void updateReply(@Param("bVo")BoardVO bVo);

	ArrayList<BoardVO> selectReplyList(@Param("item_no")Integer item_no);

	void updateComment(@Param("cVo")CommentVO cVo1);

	ArrayList<BoardVO> selectMyAskListAll(@Param("id")String id);

	ArrayList<BoardVO> selectMyAskReplyList(@Param("id")String id);

	void insertReply(@Param("bVo")BoardVO bVo);

}
