package kr.green.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.DeliveryService;
import kr.green.market.vo.DeliveryVO;

@Controller
@RequestMapping(value= "/delivery")
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
    @RequestMapping(value= "/register")
    public ModelAndView deliveryRegister(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/delivery/register");		//타일즈를 통해 불러올 jsp 경로
        ArrayList<DeliveryVO> dVoList = deliveryService.getDeliveryListAll();
        return mv;
    }
    @RequestMapping(value= "/finish")
    public ModelAndView deliveryFinish(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/delivery/finish");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
}
