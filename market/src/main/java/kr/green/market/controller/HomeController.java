package kr.green.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
    @RequestMapping(value= "/")
    public ModelAndView home(ModelAndView mv) throws Exception{
        mv.setViewName("/main/home");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/signup")
    public ModelAndView signupGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signup");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/signin")
    public ModelAndView signinGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signin");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/password/find")
    public ModelAndView passwordFind(ModelAndView mv) throws Exception{
        mv.setViewName("/member/find");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/items/list")
    public ModelAndView itemList(ModelAndView mv) throws Exception{
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/items/detail")
    public ModelAndView itemsDetail(ModelAndView mv) throws Exception{
        mv.setViewName("/items/detail");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/myMenu")
    public ModelAndView myMenu(ModelAndView mv) throws Exception{
        mv.setViewName("/member/myMenu");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/order")
    public ModelAndView order(ModelAndView mv) throws Exception{
        mv.setViewName("/items/order");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }  
    @RequestMapping(value= "/board/list")
    public ModelAndView boardList(ModelAndView mv) throws Exception{
        mv.setViewName("/board/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }    
    @RequestMapping(value= "/board/display")
    public ModelAndView boardDisplay(ModelAndView mv) throws Exception{
        mv.setViewName("/board/display");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }    
    @RequestMapping(value= "/items/register")
    public ModelAndView itemRegister(ModelAndView mv) throws Exception{
        mv.setViewName("/items/register");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }    
    @RequestMapping(value= "/items/administration")
    public ModelAndView itemAdministration(ModelAndView mv) throws Exception{
        mv.setViewName("/items/administration");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/items/modify")
    public ModelAndView itemModify(ModelAndView mv) throws Exception{
        mv.setViewName("/items/modify");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
    @RequestMapping(value= "/admin/board")
    public ModelAndView adminBoard(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/board");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/admin/board/modify")
    public ModelAndView adminBoardModify(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/boardModify");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
    @RequestMapping(value= "/admin/member")
    public ModelAndView adminMember(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/member");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/admin/requestDisplay")
    public ModelAndView adminRequestDisplay(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/requestDisplay");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
}
