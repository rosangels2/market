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
        model.addAttribute("deliveryList", dVoList);
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
    public ModelAndView deliveryFinishGet(ModelAndView mv, Model model, DeliveryVO dVo) throws Exception{
        mv.setViewName("/delivery/finish");		//타일즈를 통해 불러올 jsp 경로
        System.out.println("deliveryFinish : " + dVo);
        ArrayList<DeliveryVO> dVoList = deliveryService.getDelivererList(dVo.getDeliverer(), dVo.getPhone());
        System.out.println("deliveryFinish dVoList : " + dVoList);
        model.addAttribute("delivererList", dVoList);
        return mv;
    }
    @RequestMapping(value= "/finish", method=RequestMethod.POST)
    public String deliveryFinishPost(Model model, String deliverer1, String phone1, Integer delivery_no){
    	System.out.println("deliveryFinish deliverer : " + deliverer1);
    	System.out.println("deliveryFinish phone : " + phone1);
    	System.out.println("deliveryFinish delivery_no: " + delivery_no);
    	deliveryService.endDelivery(deliverer1, phone1, delivery_no);
    	model.addAttribute("deliverer", deliverer1);
    	model.addAttribute("phone", phone1);
    	return "redirect:/delivery/finish";
    }
}
