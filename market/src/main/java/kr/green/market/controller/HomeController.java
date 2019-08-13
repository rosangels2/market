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
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/signup")
    public ModelAndView signupGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signup");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/signin")
    public ModelAndView signinGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signin");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/password/find")
    public ModelAndView passwordFind(ModelAndView mv) throws Exception{
        mv.setViewName("/member/find");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/items/list")
    public ModelAndView itemList(ModelAndView mv) throws Exception{
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/items/detail")
    public ModelAndView itemsDetail(ModelAndView mv) throws Exception{
        mv.setViewName("/items/detail");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }
    @RequestMapping(value= "/myMenu")
    public ModelAndView myMenu(ModelAndView mv) throws Exception{
        mv.setViewName("/member/myMenu");		//타일즈를 통해 불러올 jsp 경로
        mv.addObject("setHeader", "타일즈");
        return mv;
    }  
}
