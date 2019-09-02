package kr.green.market.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.BoardService;
import kr.green.market.service.MemberService;
import kr.green.market.vo.BoardVO;

@Controller
@RequestMapping(value= "/board")
public class BoardController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;

    @RequestMapping(value= "/list")
    public ModelAndView boardList(ModelAndView mv) throws Exception{
        mv.setViewName("/board/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }    
    @RequestMapping(value= "/display")
    public ModelAndView boardDisplay(ModelAndView mv) throws Exception{
        mv.setViewName("/board/display");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value="/ask", method = RequestMethod.POST)	//쿠폰함
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
}
