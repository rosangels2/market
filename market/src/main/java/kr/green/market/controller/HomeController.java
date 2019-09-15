package kr.green.market.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.ItemService;
import kr.green.market.service.MemberService;
import kr.green.market.vo.BagVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CategoryVO;
import kr.green.market.vo.CouponBagVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;
import kr.green.market.vo.WishlistVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	ItemService itemService;
	
    @RequestMapping(value= "/")
    public ModelAndView home(ModelAndView mv, Model model) throws Exception{
    	mv.setViewName("/main/home");		//타일즈를 통해 불러올 jsp 경로
    	ArrayList<ItemVO> itemList = itemService.getItemListAll();	//메인화면 아이템 목록 불러오기
    	model.addAttribute("itemList", itemList);
    	ArrayList<CategoryVO> categoryList = itemService.getCategoryListAll();	//카테고리 목록 불러오기
    	model.addAttribute("categoryList", categoryList);
    	Set<String> categoryKind = new HashSet<String>();
    	for(int i=0; i<categoryList.size(); i++) {			
    		categoryKind.add(categoryList.get(i).getKind());	//카테고리 분류명 중복 제거
    	}
    	System.out.println("home categoryKind : " + categoryKind);
    	model.addAttribute("categoryKind", categoryKind);
        return mv;
    }
    @RequestMapping(value= "/signup", method = RequestMethod.GET)
    public ModelAndView signupGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signup");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/signup", method = RequestMethod.POST)
    public String signupPost(MemberVO mVo) throws Exception{
    	System.out.println("signup mVo : " + mVo);
    	memberService.signup(mVo);
        return "redirect:/";
    }
	//id 중복 검사
	@RequestMapping(value ="/dup")
	@ResponseBody
	public boolean idcheck(@RequestBody String id){
		if(id.length() < 8 || id.length() > 12) {
			return false;
		}
		MemberVO mVo = memberService.getMember(id);
	    System.out.println("dup mVo : " + mVo);
	    if(mVo != null) {
	    	return false;
	    }
	    return true;
	}
    @RequestMapping(value= "/signin", method = RequestMethod.GET)
    public ModelAndView signinGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signin");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/signin", method = RequestMethod.POST)
    public String signinPost(Model model, MemberVO mVo){
    	System.out.println("signin mVo : " + mVo);
    	MemberVO user = memberService.signin(mVo);
    	System.out.println("signin user : " + user);
    	if(user == null){
    		return "redirect:/signin";
    	}
    	model.addAttribute("user", user);
    	return "redirect:/";
    }
    @RequestMapping(value= "/signout")
    public String signout(HttpServletRequest r) {
    	r.getSession().removeAttribute("user");
    	return "redirect:/";
    }
    @RequestMapping(value= "/idFind", method = RequestMethod.GET)
    public ModelAndView idFindGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/idFind");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
	@RequestMapping(value ="/idFind", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idFindPost(@RequestBody String str){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println(str);
	    String [] arr = str.split("&");	//전송된 정보를 &을 기준으로 구분하여 나눠 배열에 저장
	    String name = arr[0];	//&을 기준으로 앞쪽의 0번지값을 String객체 id에 저장한다
	    String email = "";	//빈 문자열 객체를 생성
	    try {
			email=URLDecoder.decode(arr[1], "UTF-8");	//인코딩 돼 깨진 email값을 decode 메서드로 복원
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    name = memberService.getVal(name);	//id=xxx 형식의 값에서 id=를 빼고 xxx만을 가져오는 인터페이스 호출 후 결과값을 저장
	    email = memberService.getVal(email);	//email=xxx 형식의 값에서 email=를 빼고 xxx만을 가져오는 인터페이스 호출 후 결과값을 저장
	    System.out.println("idFind name = " + name);
	    System.out.println("idFind email = " + email);
	    MemberVO mVo = memberService.idFind(name, email);
	    if(mVo != null) {
	    	map.put("id", mVo.getId());
	    }else {
	    	map.put("id", null);
	    }
	    return map;
	}    
    @RequestMapping(value= "/passwordFind", method=RequestMethod.GET)
    public ModelAndView passwordFindGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/passwordFind");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value = "/mail/mailForm")
    public String mailForm() {

        return "mail";
    }  
    // mailSending 코드
    @RequestMapping(value = "/mail/mailSending")
    public String mailSending(HttpServletRequest request) {

        String setfrom = "stajun@naver.com";         
        String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
        String title   = request.getParameter("title");      // 제목
        String content = request.getParameter("content");    // 내용

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper 
                = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
            messageHelper.setTo(tomail);     // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content);  // 메일 내용

            mailSender.send(message);
        } catch(Exception e){
            System.out.println(e);
        }

        return "redirect:/mail/mailForm";
    }
	@RequestMapping(value ="/checkemail")
	@ResponseBody
	public Map<Object, Object> emailcheck(
			@RequestBody String str){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    
	    String [] arr = str.split("&");	//전송된 정보를 &을 기준으로 구분하여 나눠 배열에 저장
	    String id = arr[0];	//&을 기준으로 앞쪽의 0번지값을 String객체 id에 저장한다
	    String email = "";	//빈 문자열 객체를 생성
	    try {
			email=URLDecoder.decode(arr[1], "UTF-8");	//인코딩 돼 깨진 email값을 decode 메서드로 복원
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    id = memberService.getVal(id);	//id=xxx 형식의 값에서 id=를 빼고 xxx만을 가져오는 인터페이스 호출 후 결과값을 저장
	    email = memberService.getVal(email);	//email=xxx 형식의 값에서 email=를 빼고 xxx만을 가져오는 인터페이스 호출 후 결과값을 저장
	    
	    boolean isOk = memberService.checkMember(id,email);	//입력받은 id와 email이 회원 정보와 일치하는지 확인하고 결과를 boolean 변수에 저장
	    map.put("isOk",isOk);	//ajax에 전송할 변수 isOk에 boolean 변수값을 저장 
	    
	    return map;	//map 정보를 ajax에 반환
	}
	@RequestMapping(value = "/password/send")
	public String passwordSend(String id,String email) {
		String newPw = memberService.createPw();	//랜덤한 임시 비밀번호를 생성하여 변수에 저장
		memberService.modify(id,email,newPw);	//id, email, 임시 비밀번호를 사용하여 회원 정보를 수정 
		String title = "변경된 비밀번호입니다.";
		String contents = "변경된 비밀번호는 \n"+newPw+"\n 입니다.";
		memberService.sendMail(email,title,contents);	//변경된 값을 통해 email을 전송
	    return "redirect:/passwordFind";
	}
    @RequestMapping(value= "/myMenu")
    public ModelAndView myMenuGet(ModelAndView mv, Model model, String id) throws Exception{
        mv.setViewName("/member/myMenu");		//타일즈를 통해 불러올 jsp 경로
        ArrayList<BuyVO> bVoList = itemService.getBuyList(id);	//구매 내역 불러오기
        System.out.println("myMenuGet bVoList : " + bVoList);
        model.addAttribute("buyList", bVoList);
        ArrayList<WishlistVO> wVoList = itemService.getWishlistList(id);	//회원의 위시리스트 내역 불러오기
        System.out.println("myMenu wVoList : " + wVoList);
        model.addAttribute("wishlistList", wVoList);
        ArrayList<BagVO> bagList = itemService.getBagList(id);		//회원의 장바구니 내역 불러오기
        System.out.println("myMenu bagList : " + bagList);
        model.addAttribute("bagList", bagList);
        int total_price = 0;	//장바구니 합계 계산용 변수
        for(int i=0; i<bagList.size(); i++) {
        	total_price += bagList.get(i).getPrice();	//장바구니 가격 합계를 계산
        }
        System.out.println("myMenu total_price : " + total_price);
        model.addAttribute("total_price", total_price);
        ArrayList<CouponVO> cList = itemService.getCouponAll();	//모든 쿠폰 정보 가져오기
        ArrayList<CouponVO> cList1 = new ArrayList<CouponVO>(); 
        System.out.println("myMenu cList : " + cList);
        for(int i=0; i<cList.size(); i++) {
        	CouponBagVO cbVo = itemService.getCouponBag(id, cList.get(i).getNo());
        	if(cbVo == null){	//없는 쿠폰이라면
        		cList1.add(cList.get(i));		//받을 수 있는 쿠폰 정보 담기
        	}
        }
        System.out.println("myMenu cList1 : " + cList1);	
        model.addAttribute("cList", cList1);	
        ArrayList<CouponBagVO> cVoList = itemService.getCouponBagList(id);	//사용 가능한 쿠폰함 정보 가져오기
        System.out.println("myMenu cVoList : " + cVoList);
        ArrayList<CouponVO> couponList = new ArrayList<CouponVO>();
        for(int i=0; i<cVoList.size(); i++) {
        	CouponVO cVo = itemService.getCoupon(cVoList.get(i).getCoupon_no());
        	if(cVo != null){
        		couponList.add(cVo);	//보유중인 쿠폰 정보 가져오기
        	}
        }
        System.out.println("myMenu couponList : " + couponList);
        model.addAttribute("couponList", couponList);
        
        SellerVO sVo = memberService.getSeller(id);		//판매자 정보 가져오기
        System.out.println("myMenu sVo : " + sVo);
        model.addAttribute("seller", sVo);
        return mv;
    }
    @RequestMapping(value ="/oldPasswordCheck")
	@ResponseBody
	public boolean oldPasswordCheck(MemberVO mVo){
	    System.out.println("oldPasswordCheck mVo : " + mVo);
	    MemberVO mVo1 = memberService.signin(mVo);
	    System.out.println("oldPasswordCheck mVo1 : " + mVo1);
	    if(mVo1 != null) {
	    	return true;
	    }
	    return false;
    }
    @RequestMapping(value= "/modify")
    public String modify(Model model, MemberVO mVo, String oldPassword, HttpServletRequest r){
    	System.out.println("modify mVo : " + mVo);
    	System.out.println("modify oldPassword : " + oldPassword);
    	MemberVO oVo = memberService.modify(mVo, oldPassword);
    	System.out.println("modify oVo : " + oVo);
		boolean t = memberService.updateUserToSession(r, oVo);
		model.addAttribute("success",t);
		System.out.println("modify success : " + t);
		model.addAttribute("id", mVo.getId());
    	return "redirect:/myMenu";
    }
    @RequestMapping(value= "/withdrawal")
    public String withdrawal(MemberVO mVo){
    	System.out.println("withdrawal mVo : " + mVo);
    	if(mVo == null){
    		return "redirect:/myMenu";
    	}
    	if(!memberService.deleteMember(mVo.getId(), mVo.getPassword())){
    		return "redirect:/myMenu";
    	}
    	return "redirect:/signout";
    }
    @RequestMapping(value= "/requestSeller")
    public String requestSeller(Model model, SellerVO sVo){
    	System.out.println("requestSeller sVo : " + sVo);
    	SellerVO s = memberService.getSeller(sVo.getId());
    	if(s == null) {		//판매자 등록
    		SellerVO newSeller = memberService.addSeller(sVo);
    	}else {		//판매자 수정
    		SellerVO modifySeller = memberService.modifySeller(sVo);
    	}
    	model.addAttribute("id", sVo.getId());
    	return "redirect:/myMenu";
    }
    @RequestMapping(value ="/deleteBag")
	@ResponseBody
	public boolean deleteBag(BagVO bVo){   
	    return itemService.deleteBag(bVo.getNo(), bVo.getId());	
	}
}
