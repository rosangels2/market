package kr.green.market.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.pagination.Criteria;
import kr.green.market.pagination.PageMaker;
import kr.green.market.service.DeliveryService;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.MemberVO;

@Controller
@RequestMapping(value= "/delivery")
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
    @RequestMapping(value= "/register", method=RequestMethod.GET)
    public ModelAndView deliveryRegisterGet(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/delivery/register");		//타일즈를 통해 불러올 jsp 경로
    	//cri.setPerPageNum(20);	//한 페이지에 보여줄 게시글의 개수 설정
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);			//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = deliveryService.getDeliveryRegisterTotalCount(cri);	//총 게시글 수를 계산하여 변수에 저장하는 인터페이스를 호출
	    pM.setTotalCount(totalCount);
        ArrayList<DeliveryVO> dVoList = deliveryService.getDeliveryListAll(cri);
        model.addAttribute("pageMaker", pM);	//pageMaker의 객체를 model의 변수에 저장
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
    	if(dVo.getDeliverer() == null) {
    		dVo.setCompany(company);
        	dVo.setDeliverer(deliverer);
        	dVo.setPhone(phone);
        	deliveryService.addDeliverer(dVo);
    	}
    	return "redirect:/delivery/register";
    }
    @RequestMapping(value= "/finish", method=RequestMethod.GET)
    public ModelAndView deliveryFinishGet(ModelAndView mv, Model model, HttpServletRequest r,  Criteria cri) throws Exception{
    	MemberVO user = (MemberVO)r.getSession().getAttribute("user");
        mv.setViewName("/delivery/finish");		//타일즈를 통해 불러올 jsp 경로
        System.out.println("deliveryFinish : " + user);
      //cri.setPerPageNum(20);	//한 페이지에 보여줄 게시글의 개수 설정
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);			//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = deliveryService.getDelivererListTotalCount(user.getName(), user.getPhone(), cri);	//총 게시글 수를 계산하여 변수에 저장하는 인터페이스를 호출
	    pM.setTotalCount(totalCount);
        ArrayList<DeliveryVO> dVoList = deliveryService.getDelivererList(user.getName(), user.getPhone(), cri);
        System.out.println("deliveryFinish dVoList : " + dVoList);
        model.addAttribute("pageMaker", pM);	//pageMaker의 객체를 model의 변수에 저장
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
