package kr.green.market.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

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

import kr.green.market.service.MemberService;
import kr.green.market.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	private JavaMailSender mailSender;
	
    @RequestMapping(value= "/")
    public ModelAndView home(ModelAndView mv) throws Exception{
        mv.setViewName("/main/home");		//타일즈를 통해 불러올 jsp 경로
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
	    if(mVo != null)
	    	map.put("id", mVo.getId());
	    else
	    	map.put("id", null);
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
		String contents = "변경된 비밀번호입니다.\n"+newPw+"\n";
		memberService.sendMail(email,title,contents);	//변경된 값을 통해 email을 전송
	    return "redirect:/passwordFind";
	}
    @RequestMapping(value= "/myMenu")
    public ModelAndView myMenu(ModelAndView mv) throws Exception{
        mv.setViewName("/member/myMenu");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/modify")
    public String signout(Model model, MemberVO mVo, String oldPassword, HttpServletRequest r){
    	System.out.println("modify mVo : " + mVo);
    	System.out.println("modify oldPassword : " + oldPassword);
    	MemberVO oVo = memberService.modify(mVo, oldPassword);
    	System.out.println("modify oVo : " + oVo);
		boolean t = memberService.updateUserToSession(r,oVo);
		model.addAttribute("success",t);
		System.out.println("modify success : " + t);
    	return "redirect:/myMenu";
    }
}
