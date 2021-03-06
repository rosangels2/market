package kr.green.market.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.pagination.Criteria;
import kr.green.market.pagination.PageMaker;
import kr.green.market.service.AdminService;
import kr.green.market.service.BoardService;
import kr.green.market.service.MemberService;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

@Controller
@RequestMapping(value= "/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	@Autowired
	BoardService boardService;
	
    @RequestMapping(value= "ask")
    public ModelAndView adminAsk(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/admin/ask");	//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = adminService.getTotalCountAskList(cri);	//총 게시글 수를 계산하여 변수에 저장
	    System.out.println("adminAsk totalCount : " + totalCount);
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);
        ArrayList<BoardVO> askList = adminService.getAskListAll(cri);	//상품 문의 목록 불러오기
        System.out.println("adminAsk askList : " + askList);
        model.addAttribute("askList", askList);
        return mv;
    }
    @RequestMapping(value= "comment")
    public ModelAndView adminComment(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/admin/comment");	//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = adminService.getTotalCountCommentList(cri);	//총 게시글 수를 계산하여 변수에 저장\
	    System.out.println("adminComment totalCount : " + totalCount);
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);
        ArrayList<CommentVO> commentList = adminService.getCommentListAll(cri);	//댓글 목록 불러오기
        System.out.println("adminComment commentList : " + commentList);
        model.addAttribute("commentList", commentList);
        return mv;
    }
    @RequestMapping(value= "reply")
    public ModelAndView adminReply(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/admin/reply");	//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = adminService.getTotalCountReplyList(cri);	//총 게시글 수를 계산하여 변수에 저장
	    System.out.println("adminReply totalCount : " + totalCount);
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);
        ArrayList<BoardVO> replyList = adminService.getReplyListAll(cri);	//문의답변 목록 불러오기
        System.out.println("adminReply replyList : " + replyList);
        model.addAttribute("replyList", replyList);
        return mv;
    }
    @RequestMapping(value= "/boardRegister", method = RequestMethod.GET)
    public ModelAndView BoardRegisterGet(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/admin/boardRegister");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
    @RequestMapping(value= "/boardRegister", method = RequestMethod.POST)
    public String BoardRegisterPost(BoardVO bVo){
    	System.out.println("BoardRegisterPost bVo : " + bVo);
    	adminService.registerBoard(bVo);
        return "redirect:/board/list";
    } 
    @RequestMapping(value= "/boardModify", method = RequestMethod.GET)
    public ModelAndView BoardModifyGet(ModelAndView mv, Model model, Integer board_no) throws Exception{
        mv.setViewName("/admin/boardModify");	//타일즈를 통해 불러올 jsp 경로
        BoardVO bVo = boardService.getBoard(board_no);	//게시글 내용 불러오기
        model.addAttribute("bVo", bVo);
        return mv;
    } 
    @RequestMapping(value= "/boardModify", method = RequestMethod.POST)
    public String BoardModifyPost(Model model, BoardVO bVo) {
    	System.out.println("BoardModifyPost bVo : " + bVo);
    	BoardVO bVo1 = adminService.modifyBoard(bVo);
    	model.addAttribute("board_no", bVo.getNo());
    	return "redirect:/board/display";
    }
    @RequestMapping(value= "/member")
    public ModelAndView adminMember(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/admin/member");	//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = adminService.getTotalCountMemberList(cri);	//총 게시글 수를 계산하여 변수에 저장
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);	//pageMaker의 객체를 model의 변수에 저장
        ArrayList<MemberVO> memberList = adminService.getAllMemberList(cri);	//멤버 리스트 불러오기
        System.out.println("adminMember memberList : " + memberList);
        model.addAttribute("memberList", memberList);
        return mv;
    }
    @RequestMapping(value= "/sellerRequest")
    public ModelAndView sellerRequest(ModelAndView mv, Model model, Criteria cri) throws Exception{
        mv.setViewName("/admin/sellerRequest");	//타일즈를 통해 불러올 jsp 경로
        PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);		//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);
	    int totalCount = adminService.getTotalCountRequestSellerList(cri);	//총 게시글 수를 계산하여 변수에 저장
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
	    model.addAttribute("pageMaker", pM);	//pageMaker의 객체를 model의 변수에 저장
        ArrayList<SellerVO> requestSellerList = adminService.getRequestSellerList(cri);	//판매자 리스트 불러오기
        System.out.println("adminMember requestSellerList : " + requestSellerList);
        model.addAttribute("sellerList", requestSellerList);
        return mv;
    }
    @RequestMapping(value="/changeGrade")	//멤버 등급 변경
	@ResponseBody
	public boolean changeGrade(MemberVO mVo){
	    System.out.println("changeGrade id : " + mVo);
	    if(adminService.changeMemberGrade(mVo.getId(), mVo.getGrade())) {
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value="/agreeSeller")	//판매자 신청 승인
	@ResponseBody
	public boolean agreeSeller(@RequestBody String id){
	    System.out.println("agreeSeller id : " + id);
	    if(adminService.agreeSeller(id)){
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value= "/coupon")
    public ModelAndView adminCoupon(ModelAndView mv, Model model) throws Exception{
        mv.setViewName("/admin/coupon");	//타일즈를 통해 불러올 jsp 경로
        ArrayList<CouponVO> couponList = adminService.getCouponList();
        System.out.println("adminCoupon couponLisst : " + couponList);
        model.addAttribute("couponList", couponList);
        return mv;
    }
    @RequestMapping(value="/deleteCoupon")	//쿠폰 삭제
	@ResponseBody
	public boolean deleteCoupon(@RequestBody String no){
	    System.out.println("deleteCoupon no : " + no);
	    int no1 = Integer.parseInt(no);
	    Integer coupon_no = no1;
	    if(adminService.deleteCoupon(coupon_no)) {
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value="/addCoupon")	//쿠폰 등록
	@ResponseBody
	public Map<Object, Object> addCoupon(CouponVO cVo){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println("addCoupon cVo : " + cVo);
	    CouponVO newcVo = adminService.addCoupon(cVo);
	    System.out.println("addCoupon newcVo : " + newcVo);
	    map.put("coupon", newcVo);
	    return map;
	}
    @RequestMapping(value= "/boardDelete")
    public String adminboardDelete(Integer board_no, String user) throws Exception{
    	if(user.equals("admin")){
    		adminService.deleteBoard(board_no);
    	}
        return "redirect:/board/list";
    }
    @RequestMapping(value="/deleteComment")	//댓글 삭제
	@ResponseBody
	public boolean deleteComment(@RequestBody Integer no){
	    if(adminService.deleteComment(no)) {
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value="/deleteAsk")	//상품 문의글 삭제
	@ResponseBody
	public boolean deleteAsk(@RequestBody Integer no){
    	if(adminService.deleteAsk(no)) {
	    	return true;
	    }
	    return false;
	}
    @RequestMapping(value="/deleteReply")	//문의 답변글 삭제
	@ResponseBody
	public boolean deleteReply(@RequestBody Integer no){
    	if(adminService.deleteReply(no)) {
	    	return true;
	    }
	    return false;
	}
}
