package kr.green.market.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.pagination.Criteria;
import kr.green.market.pagination.PageMaker;
import kr.green.market.service.AdminService;
import kr.green.market.service.BoardService;
import kr.green.market.service.MemberService;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;

@Controller
@RequestMapping(value= "/board")
public class BoardController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	@Autowired
	AdminService adminService;

    @RequestMapping(value= "/list")		//공지사항 목록
    public ModelAndView boardList(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/board/list");		//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = adminService.getTotalCountBoardList(cri);	//총 게시글 수를 계산하여 변수에 저장
	    System.out.println("boardList totalCount : " + totalCount);
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);
        ArrayList<BoardVO> boardList = adminService.getBoardListAll(cri);
        System.out.println("boardList boardList : " + boardList);
        model.addAttribute("boardList", boardList);
        return mv;
    }    
    @RequestMapping(value= "/display")	//공지사항 내용
    public ModelAndView boardDisplay(ModelAndView mv, Model model, Integer board_no) throws Exception{
        mv.setViewName("/board/display");		//타일즈를 통해 불러올 jsp 경로
        System.out.println("boardDisplay board_no : " + board_no);
        BoardVO bVo = boardService.getBoard(board_no);
        boardService.addViews(bVo.getNo());
        System.out.println("boardDisplay bVo : " + bVo);
        model.addAttribute("bVo", bVo);
        return mv;
    }
    @RequestMapping(value="/ask")	//문의 요청
    @ResponseBody
    public Map<Object, Object> ask(@RequestBody String str) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	try {
			str=URLDecoder.decode(str, "UTF-8");	//인코딩 돼 깨진 email값을 decode 메서드로 복원
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	System.out.println("boardAsk str : " + str);
    	String[] arr = str.split("&");
    	String writer = memberService.getVal(arr[0]);    	
    	String board_no1 = memberService.getVal(arr[1]); 
    	int board_no2 = Integer.parseInt(board_no1);
    	Integer board_no = board_no2;
    	String category = memberService.getVal(arr[2]);    	
    	String title = memberService.getVal(arr[3]);    	
    	String contents = memberService.getVal(arr[4]);
    	System.out.println("boardAsk writer : " + writer);
    	System.out.println("boardAsk board_no : " + board_no);
    	System.out.println("boardAsk category : " + category);
    	System.out.println("boardAsk title : " + title);
    	System.out.println("boardAsk contents : " + contents);
    	BoardVO bVo = boardService.registerAsk(category, board_no, writer, title, contents);
    	System.out.println("boardAsk bVo : " + bVo);
    	map.put("bVo", bVo);
    	return map;
    }
    @RequestMapping(value="/addComment")	//댓글 등록
    @ResponseBody
    public Map<Object, Object> addComment(@RequestBody String str) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	try {
			str=URLDecoder.decode(str, "UTF-8");	//인코딩 돼 깨진 email값을 decode 메서드로 복원
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	System.out.println("addComment str : " + str);
    	String[] arr = str.split("&");
    	String category = memberService.getVal(arr[0]);   	
    	String board_no1 = memberService.getVal(arr[1]); 
    	int board_no2 = Integer.parseInt(board_no1);
    	Integer board_no = board_no2;   	
    	String writer = memberService.getVal(arr[2]);  
    	String to = memberService.getVal(arr[3]);
    	if(to == "") {
    		to = null;
    	}
    	String contents = memberService.getVal(arr[4]);
    	System.out.println("addComment category : " + category);
    	System.out.println("addComment board_no : " + board_no);
    	System.out.println("addComment writer : " + writer);
    	System.out.println("addComment to : " + to);
    	System.out.println("addComment contents : " + contents);
    	CommentVO cVo = boardService.registerComment(category, board_no, writer, to, contents);
    	System.out.println("addComment cVo : " + cVo);
    	map.put("comment", cVo);
    	return map;
    }
    @RequestMapping(value="/deleteComment")	//댓글 삭제
    @ResponseBody
    public boolean deleteComment(CommentVO cVo) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	System.out.println("deleteComment cVo : " + cVo);
    	if(boardService.deleteComment(cVo)) {
    		return true;
    	}
    	return false;
    }
    @RequestMapping(value="/askReply")	//문의 답변
    @ResponseBody
    public Map<Object, Object> askReply(BoardVO bVo) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	System.out.println("askReply bVo : " + bVo);
    	BoardVO reply = boardService.registerReply(bVo);
    	System.out.println("askReply reply : " + reply);
    	map.put("reply", reply);
    	return map;
    }
}
