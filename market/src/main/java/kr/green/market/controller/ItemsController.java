package kr.green.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value= "/items")
public class ItemsController {

    @RequestMapping(value= "/list")
    public ModelAndView itemList(ModelAndView mv) throws Exception{
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/detail")
    public ModelAndView itemsDetail(ModelAndView mv) throws Exception{
        mv.setViewName("/items/detail");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/order")
    public ModelAndView order(ModelAndView mv) throws Exception{
        mv.setViewName("/items/order");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }  
    @RequestMapping(value= "/register")
    public ModelAndView itemRegister(ModelAndView mv) throws Exception{
        mv.setViewName("/items/register");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }    
    @RequestMapping(value= "/administration")
    public ModelAndView itemAdministration(ModelAndView mv) throws Exception{
        mv.setViewName("/items/administration");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/modify")
    public ModelAndView itemModify(ModelAndView mv) throws Exception{
        mv.setViewName("/items/modify");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
}
