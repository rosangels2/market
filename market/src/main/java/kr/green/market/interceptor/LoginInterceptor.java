package kr.green.market.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.market.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
	    ModelMap modelMap = modelAndView.getModelMap();
	    MemberVO user = (MemberVO)modelMap.get("user");		//User user = (User)modelMap.get("user");에서 형변환하여 사용

		if(user != null){	//user 정보가 있다면 
		    request.getSession().setAttribute("user", user);	//변수 user에 유저 정보를 저장
	    }
	}
}
