package kr.green.market.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.market.dao.ItemDAO;
import kr.green.market.dao.MemberDAO;
import kr.green.market.vo.AddressListVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.MemberVO;
import kr.green.market.vo.SellerVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	@Autowired
	ItemDAO itemDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public MemberVO getMember(String id) {
		if(id == null){
			return null;	
		}
		MemberVO mVo = memberDao.selectMember(id);
		if(mVo == null){
			return null;
		}
		return mVo;
	}

	@Override
	public void signup(MemberVO mVo) {
		if(mVo == null){
			return;
		}
		if(mVo.getName() == null){
			mVo.setName("");
		}
		if(mVo.getPhone() == null){
			mVo.setPhone("");
		}
		if(mVo.getAddress() == null){
			mVo.setAddress("");
		}
		if(mVo.getBank() == null){
			mVo.setBank("");
		}
		if(mVo.getAccount() == null){
			mVo.setAccount("");
		}
		mVo.setPassword(passwordEncoder.encode(mVo.getPassword()));		
		memberDao.insertMember(mVo);
	}

	@Override
	public MemberVO signin(MemberVO mVo) {
		if(mVo == null){
			return null;
		}
		MemberVO oVo = memberDao.selectMember(mVo.getId());
		if(oVo == null){
			return null;
		}
		if(!passwordEncoder.matches(mVo.getPassword(), oVo.getPassword())){
			return null;
		}
		return oVo;
	}

	@Override
	public MemberVO modify(MemberVO mVo, String oldPassword) {
		if(mVo == null){
			return null;
		}
		MemberVO oVo = memberDao.selectMember(mVo.getId());
		if(oVo == null || !passwordEncoder.matches(oldPassword, oVo.getPassword())){
			return null;
		}
		mVo.setPassword(passwordEncoder.encode(mVo.getPassword()));
		memberDao.updateMember(mVo);
		return mVo;
	}

	@Override
	public boolean updateUserToSession(HttpServletRequest r, MemberVO oVo) {
		if(oVo == null){
			return false;
		}
		HttpSession s = r.getSession();
		s.removeAttribute("user");		//이전 회원정보 제거
		s.setAttribute("user", oVo);	//새 회원 정보 추가
		return true;
	}

	@Override
	public MemberVO idFind(String name, String email) {
		if(name == null || email == null){
			return null;
		}
		MemberVO mVo = memberDao.selectMemberFind(email, name);
		if(mVo == null){
			return null;
		}
		return mVo;
	}

	@Override
	public String getVal(String str) {
		String [] arr = str.split("=");	//입력받은 문자열을 =을 기준으로 배열로 나눠서 저장 
		if(arr.length == 2){	//배열의 길이가 2라면 	예시)id=xxx -> 0번지 = id, 1번지 = xxx
			return arr[1];	//배열의 1번지를 반환(실제 입력값인 xxx)
		}else{
			return "";
		}
	}

	@Override
	public boolean checkMember(String id, String email) {
		MemberVO user = memberDao.selectMember(id);	//id를 통해 가져온 회원 정보를 저장
		if(user != null && user.getEmail().equals(email)) {	//회원정보의 이메일과 입력한 이메일이 같다면 
			return true;	//true를 반환
		}
		return false;
	}

	@Override
	public String createPw() {
		String str ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String pw="";
		for(int i=0; i< 8; i++) {
			int r = (int)(Math.random()*62);
			pw += str.charAt(r);
		}
		return pw;
	}

	@Override
	public void modify(String id, String email, String newPw) {
		MemberVO user = memberDao.selectMember(id);	//id를 통해 회언 정보를 가져와서 변수에 저장
		if(user == null){
			return;
		}
		if(!user.getEmail().equals(email)){
			return;
		}
		String encodePw = passwordEncoder.encode(newPw);	//새로 생성된 임시 비밀번호를 암호화해 변수에 저장
		user.setPassword(encodePw);			//암호화된 비밀번호로 객체 정보를 수정
		memberDao.updateMember(user);		//해당 객체 정보를 통해 회원 정보를 수정		
	}

	@Override
	public void sendMail(String email, String title, String contents) {
		String setfrom = "stajun@google.com";         
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");
	        
	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(email);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(contents);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }		
	}

	@Override
	public Integer getSellerNo(String id) {
		if(id == null) {
			return null;
		}
		return memberDao.selectSellerNo(id);
	}

	@Override
	public ArrayList<AddressListVO> getAddressList(String id) {
		if(id == null){
			return null;
		}
		return memberDao.selectAddressList(id);
	}

	@Override
	public Integer addAddress(AddressListVO aVo) {
		if(aVo == null){
			return -1;
		}
		memberDao.insertAddress(aVo);
		return memberDao.selectInsertAddress();
	}

	@Override
	public SellerVO getSeller(Integer item_no) {
		if(item_no == null) {
			return null;
		}
		ItemVO iVo = itemDao.selectItem(item_no);
		return memberDao.selectSeller(iVo.getSeller_id());
	}

	@Override
	public boolean deleteMember(String id, String password) {
		if(id == null || password == null){
			return false;
		}
		MemberVO oVo = memberDao.selectMember(id);
		if(oVo == null){
			return false;
		}
		if(!passwordEncoder.matches(password, oVo.getPassword())){
			return false;
		}
		oVo.setValid("D");
		memberDao.updateMember(oVo);
		return true;
	}

	@Override
	public SellerVO getSeller(String id) {
		if(id == null) {
			return null;
		}
		return memberDao.selectSeller(id);
	}

	@Override
	public SellerVO addSeller(SellerVO sVo) {
		if(sVo == null) {
			return null;
		}
		memberDao.insertSeller(sVo);
		int no = memberDao.selectMaxSellerNo();
		return memberDao.selectSeller1(no);
	}

	@Override
	public SellerVO modifySeller(SellerVO sVo) {
		if(sVo == null) {
			return null;
		}
		SellerVO sVo1 = memberDao.selectSeller(sVo.getId());
		if(sVo1 == null) {
			return null;
		}
		sVo1.setLicense(sVo.getLicense());
		sVo1.setName(sVo.getName());
		sVo1.setPhone(sVo.getPhone());
		sVo1.setBank(sVo.getBank());
		sVo1.setAccount(sVo.getAccount());
		sVo1.setPlace(sVo.getPlace());
		memberDao.updateSeller(sVo1);
		return memberDao.selectSeller(sVo1.getId());
	}
	
}
