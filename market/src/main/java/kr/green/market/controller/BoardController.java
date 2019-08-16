package kr.green.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value= "/board")
public class BoardController {

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
}
