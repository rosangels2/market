package kr.green.market.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public ModelAndView signupPost(ModelAndView mv, MemberVO mVo, String password1) throws Exception{
    	System.out.println("signupPost mVo : " + mVo);
    	System.out.println("signupPost password1 : " + password1);
        mv.setViewName("/member/signup");		//타일즈를 통해 불러올 jsp 경로
        return mv;
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
    @RequestMapping(value= "/signin")
    public ModelAndView signinGet(ModelAndView mv) throws Exception{
        mv.setViewName("/member/signin");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/passwordFind")
    public ModelAndView passwordFind(ModelAndView mv) throws Exception{
        mv.setViewName("/member/passwordFind");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/idFind")
    public ModelAndView idFind(ModelAndView mv) throws Exception{
        mv.setViewName("/member/idFind");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/myMenu")
    public ModelAndView myMenu(ModelAndView mv) throws Exception{
        mv.setViewName("/member/myMenu");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
}
