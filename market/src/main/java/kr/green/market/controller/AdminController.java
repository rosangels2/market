package kr.green.market.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.AdminService;
import kr.green.market.service.MemberService;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;

@Controller
@RequestMapping(value= "/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	
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
    public ModelAndView adminMember(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/admin/member");	//타일즈를 통해 불러올 jsp 경로
        ArrayList<MemberVO> memberList = adminService.getAllMemberList();	//멤버 리스트 불러오기
        System.out.println("adminMember memberList : " + memberList);
        model.addAttribute("memberList", memberList);
        ArrayList<SellerVO> requestSellerList = adminService.getRequestSellerList();	//판매자 리스트 불러오기
        System.out.println("adminMember requestSellerList : " + requestSellerList);
        model.addAttribute("sellerList", requestSellerList);
        return mv;
    }
    @RequestMapping(value="/changeGrade")	//멤버 등급 변경
	@ResponseBody
	public boolean changeGrade(MemberVO mVo){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println("changeGrade id : " + mVo);
	    if(adminService.changeMemberGrade(mVo.getId(), mVo.getGrade())) {
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value="/agreeSeller")	//판매자 신청 승인
	@ResponseBody
	public boolean agreeSeller(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println("agreeSeller id : " + id);
	    if(adminService.agreeSeller(id)){
	    	return true;
	    }
	    return false;
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
