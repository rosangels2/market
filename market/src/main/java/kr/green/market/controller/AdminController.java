package kr.green.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value= "/admin")
public class AdminController {

    @RequestMapping(value= "/board")
    public ModelAndView adminBoard(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/board");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/boardModify")
    public ModelAndView adminBoardModify(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/boardModify");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
    @RequestMapping(value= "/member")
    public ModelAndView adminMember(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/member");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/requestDisplay")
    public ModelAndView adminRequestDisplay(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/requestDisplay");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/coupon")
    public ModelAndView adminCoupon(ModelAndView mv) throws Exception{
        mv.setViewName("/admin/coupon");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
}
