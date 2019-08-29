package kr.green.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.DeliveryService;
import kr.green.market.vo.DeliveryVO;

@Controller
@RequestMapping(value= "/delivery")
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
    @RequestMapping(value= "/register", method=RequestMethod.GET)
    public ModelAndView deliveryRegisterGet(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/delivery/register");		//타일즈를 통해 불러올 jsp 경로
        ArrayList<DeliveryVO> dVoList = deliveryService.getDeliveryListAll();
        return mv;
    }
    @RequestMapping(value= "/register", method=RequestMethod.POST)
    public String deliveryRegisterPost(String company, String deliverer, String phone, Integer delivery_no){
    	System.out.println("deliveryRegister company : " + company);
    	System.out.println("deliveryRegister deliverer : " + deliverer);
    	System.out.println("deliveryRegister phone : " + phone);
    	System.out.println("deliveryRegister delivery_no: " + delivery_no);
    	DeliveryVO dVo = deliveryService.getDelivery(delivery_no);
    	System.out.println("deliveryRegister dVo : " + dVo);
    	dVo.setCompany(company);
    	dVo.setDeliverer(deliverer);
    	dVo.setPhone(phone);
    	deliveryService.addDeliverer(dVo);
    	return "redirect:/delivery/register";
    }
    @RequestMapping(value= "/finish", method=RequestMethod.GET)
    public ModelAndView deliveryFinishGet(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/delivery/finish");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/finish", method=RequestMethod.POST)
    public String deliveryFinishPost(String deliverer, String phone, Integer delivery_no){
    	System.out.println("deliveryFinish deliverer : " + deliverer);
    	System.out.println("deliveryFinish phone : " + phone);
    	System.out.println("deliveryFinish delivery_no: " + delivery_no);
    	deliveryService.endDelivery(deliverer, phone, delivery_no);
    	return "redirect:/delivery/finish";
    }
}
