package kr.green.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.pagination.Criteria;
import kr.green.market.pagination.PageMaker;
import kr.green.market.service.BoardService;
import kr.green.market.service.DeliveryService;
import kr.green.market.service.ItemService;
import kr.green.market.service.MemberService;
import kr.green.market.utils.UploadFileUtils;
import kr.green.market.vo.AddressListVO;
import kr.green.market.vo.BagVO;
import kr.green.market.vo.BoardVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CommentVO;
import kr.green.market.vo.CouponBagVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;
import kr.green.market.vo.WishlistVO;

@Controller
@RequestMapping(value= "/items")
public class ItemsController {

	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	@Autowired
	ItemService itemService;
	@Resource
	private String uploadPath;
	@Autowired
	DeliveryService deliveryService;
	
    @RequestMapping(value= "/list")
    public ModelAndView itemList(ModelAndView mv, Model model, Criteria cri) throws Exception{
    	System.out.println("itemsList cri : " + cri);
    	cri.setPerPageNum(5);	//한 페이지에 보여줄 개수글 설정
    	PageMaker pM = new PageMaker();	//pageMaker 객체를 생성 후 복사
	    pM.setCriteria(cri);			//보여줄 게시글들의 설정을 수정
	    pM.setDisplayPageNum(5);	//페이지네이션의 개수를 설정(setDisplayPageNum을 먼저 호출해서 계산해야 setTotalCount함수가 정상적으로 작동)
	    int totalCount = itemService.getTotalCount(cri);	//총 게시글 수를 계산하여 변수에 저장하는 인터페이스를 호출
	    pM.setTotalCount(totalCount);	//페이지네이션을 계산하기 위해 총 게시글 수를 수정
    	ArrayList<ItemVO> itemList = itemService.getItemList(cri);
    	model.addAttribute("itemList", itemList);
    	model.addAttribute("pageMaker", pM);	//pageMaker의 객체를 model의 변수에 저장
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/detail")
    public ModelAndView itemsDetail(ModelAndView mv, Model model, Integer item_no, String id) throws Exception{
    	ItemVO iVo = itemService.getItem(item_no);	//상품 상세 정보 불러오기
    	model.addAttribute("item", iVo);
    	ArrayList<FileVO> itemFiles = itemService.getFiles(item_no);		//상품 첨부파일 불러오기
    	System.out.println("itemDetail itemFiles : " + itemFiles);
    	if(itemFiles != null){
    		model.addAttribute("itemFiles", itemFiles);
    	}
    	SellerVO sVo = itemService.getSellerName(iVo.getSeller_id());	//판매자 정보 불러오기
    	System.out.println("itemDetail sVo : " + sVo);
    	model.addAttribute("seller", sVo);
    	
    	ArrayList<OptionVO> options = itemService.getItemOptions(item_no);	//선택 상품 불러오기
    	System.out.println("itemDetail Options : " + options);
    	Set<String> select = new HashSet<String>();
    	for(int i=0; i<options.size(); i++) {		//중복 제거
    		select.add(options.get(i).getSelect());
    	}
    	System.out.println("itemDetail selects : " + select);
    	model.addAttribute("selects", select);
    	
    	ArrayList<BoardVO> askList = boardService.getAskListAll(item_no);	//전체 문의글 목록 불러오기
    	System.out.println("itemDetail askList : " + askList);
    	model.addAttribute("askList", askList);
    	if(id != null){
    		ArrayList<BoardVO> myAskList = boardService.getMyAskList(item_no, id);	//내 문의글 목록 불러오기
    		model.addAttribute("myAskList", myAskList);
    	}
    	ArrayList<BoardVO> replyList = boardService.getReplyList(item_no);	//문의 답변 목록 불러오기
    	System.out.println("itemDetail replyList : " + replyList);
    	model.addAttribute("replyList", replyList);
    	ArrayList<CommentVO> cVoList = boardService.getCommentList(item_no);	//댓글 목록 가져오기
    	model.addAttribute("commentList", cVoList);
        mv.setViewName("/items/detail");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
	@RequestMapping(value="/getDetail")	//세부 옵션 불러오기
	@ResponseBody
	public Map<Object, Object> getDetailOptions(@RequestBody String option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println("getDetailOptions option" + option);
	    String[] arr = option.split("&");
	    String no = arr[0];
	    String select = arr[1];
	    System.out.println("getDetailOptions no : " + no + " , select : " + select);
	    no = memberService.getVal(no);
	    select = memberService.getVal(select);
	    int item_no1 = Integer.parseInt(no);
	    Integer item_no = item_no1;
	    System.out.println("getDetailOptions item_no : " + item_no + " , select : " + select);
	    ArrayList<OptionVO> oVo = itemService.getOptionDetail(item_no, select);
	    System.out.println("getDetailOptions oVo : " + oVo);
	    map.put("oVo", oVo);
	    return map;
	}
	@RequestMapping(value="/getPrice")	//세부 옵션 불러오기
	@ResponseBody
	public Map<Object, Object> getPrice(@RequestBody Integer detail_no){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println("getPrice detail_no : " + detail_no);
	    OptionVO oVo = itemService.getDetailOptions(detail_no);
	    System.out.println("getPrice oVo : " + oVo);
	    map.put("price", oVo.getPrice());
	    map.put("oVo", oVo);
	    return map;
	}
	@RequestMapping(value="/getTotal")	//세부 옵션 불러오기
	@ResponseBody
	public Map<Object, Object> getTotal(@RequestBody String str){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    String[] arr = str.split("&");
	    String price = arr[0];
	    String total = arr[1];
	    price = memberService.getVal(price);
	    total = memberService.getVal(total);
	    int price1 = Integer.parseInt(price);
	    int total1 = Integer.parseInt(total);
	    int total_price = price1+total1;
	    map.put("total", total_price);
	    return map;
	}
    @RequestMapping(value= "/order")
    public ModelAndView order(Model model, ModelAndView mv, Integer item_no,  Integer[] option_no, String[] select,
    	String[] detail,  Integer[] count,  Integer[] price, Integer total_price, String id, Integer bag_no) throws Exception{
    	ArrayList<OptionVO> oVoList = itemService.getOderOptions(item_no, option_no, select, detail, count, price);
        Integer orderCount = select.length;
        model.addAttribute("orderCount", orderCount);
        model.addAttribute("optionList", oVoList);
        model.addAttribute("total_price", total_price);
        mv.setViewName("/items/order");		//타일즈를 통해 불러올 jsp 경로
	    ArrayList<CouponBagVO> couponList = itemService.getCouponList(id);	//쿠폰함 불러오기
	    ArrayList<CouponVO> cVo = new ArrayList<CouponVO>();
	    for(int i=0; i<couponList.size(); i++){	
	    	CouponVO cVo1 = itemService.getCoupon(couponList.get(i).getCoupon_no());
	    	int discount = Integer.parseInt(String.valueOf(Math.round(cVo1.getDiscount())));	//double 반올림 > String 형변환 > int 형변환
	    	cVo1.setDiscount(discount);
	    	cVo.add(cVo1);
	    }
	    ArrayList<AddressListVO> aVo = memberService.getAddressList(id);	//배송지 목록 불러오기
	    System.out.println("order aVo : " + aVo);
	    model.addAttribute("addressList", aVo);
	    model.addAttribute("cVo", cVo);
        return mv;
    }  
    @RequestMapping(value="/orderRequest", method=RequestMethod.POST)
    public String orderRequest(Model model, Integer item_no, Integer[] option_no, String[] select,
    String[] detail,  Integer[] count,  Integer[] price, Integer total_price, Integer delivery_price, Integer coupon_price,
    Integer last_Price, String id, AddressListVO aVo, Integer delivery_code, Integer address_no, String request, Integer coupon_no){
    	ArrayList<OptionVO> orderList = itemService.getOderOptions(item_no, option_no, select, detail, count, price);	//option 객체로 변환
    	System.out.println("orderRequest orderList : " + orderList);
    	if(delivery_code == 0){
    		aVo.setNo(address_no);
    	}else if(delivery_code == 1){
    		Integer num = memberService.addAddress(aVo);	//배송지 등록
    		aVo.setNo(num);
    	}
    	BuyVO bVo = new BuyVO();
    	DeliveryVO dVo = new DeliveryVO();
    	System.out.println("orderRequest bVo : " + bVo);
    	for(int i=0; i<orderList.size(); i++){
    		ItemVO iVo = itemService.getItem(orderList.get(i).getItem_no());
    		System.out.println("orderRequest iVO : " + iVo);
    		bVo.setImage(iVo.getFile());
    		bVo.setId(id);
    		bVo.setItem_no(orderList.get(i).getItem_no());
    		bVo.setOption_no(orderList.get(i).getNo());
    		bVo.setSelect(orderList.get(i).getSelect());
    		bVo.setDetail(orderList.get(i).getDetail());
    		bVo.setCount(orderList.get(i).getStock());
    		bVo.setPrice(orderList.get(i).getPrice());
    		bVo.setRequest(request);
    		System.out.println("orderRequest bVo : " + bVo);
    		BuyVO bVo1 = itemService.addBuy(bVo);				//구매 정보 등록하기
    		System.out.println("orderRequest bVo1 : " + bVo1);
        	SellerVO sVo = memberService.getSeller(orderList.get(i).getItem_no());	//판매자 정보 가져오기
        	System.out.println("orderRequest sVo : " + sVo);	
        	dVo.setBuy_no(bVo1.getNo());
        	dVo.setRequest(request);
        	dVo.setStart(sVo.getPlace());
        	dVo.setEnd(aVo.getAddress());
        	dVo.setSeller_name(sVo.getName());
        	dVo.setContents("선택 상품 : " + orderList.get(i).getSelect()+" / 선택 옵션 : " + orderList.get(i).getDetail()+" / 수량 : "+orderList.get(i).getStock());
        	DeliveryVO dVo1 = itemService.addDelivery(dVo);
        	System.out.println("orderRequest dVo1 : " + dVo1);
    	}
    	System.out.println("orderRequest coupon_no : " + coupon_no);
    	if(coupon_no != null) {
    		itemService.useCoupon(id, coupon_no);	//사용한 쿠폰 삭제하기
    	}
    	model.addAttribute("id", id);
    	return "redirect:/myMenu";
    }
    @RequestMapping(value= "/register", method = RequestMethod.GET)
    public ModelAndView itemRegisterGet(ModelAndView mv) throws Exception{
        mv.setViewName("/items/register");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/register", method = RequestMethod.POST)
    public String itemRegisterPost(MultipartFile[] file2, String seller_id, String title, Integer price1, String[] select,  String[] detail,  Integer[] stock,  Integer[] price) throws Exception{
        Integer categoryNo = 1;
        int itemNo = itemService.registerItem(seller_id, categoryNo, title, price1);	//아이템 등록
		for(MultipartFile tmp : file2){
			if(tmp.getOriginalFilename().length() != 0) {
				String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
				itemService.addFile(file, itemNo);	//파일 등록
			}
		}
		itemService.registerFile(itemNo);	//첫번째 파일을 대표 파일로 등록
        OptionVO oVo = new OptionVO();
        oVo.setItem_no(itemNo);
        oVo.setItem_title(title);
        itemService.registerOption(oVo, select, detail, stock, price);	//옵션 등록
        return "redirect:/items/list";
        
    }
	private String uploadFile(String name, byte[] data)	//첨부파일 업로드 메서드(매핑 없이 컨트롤러 내에서 자체적으로 실행)
			throws Exception{
			UUID uid = UUID.randomUUID();	//동일한 파일명이 있어도 중복되지 않게 구분해주는 식별자
			String savaName = uid.toString() + "_" + name;
			File target = new File(uploadPath, savaName);
			FileCopyUtils.copy(data, target);
			return savaName;
	}
	@ResponseBody
	@RequestMapping("download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
    @RequestMapping(value= "/administration")
    public ModelAndView itemAdministration(ModelAndView mv, Model model, String id) throws Exception{
        mv.setViewName("/items/administration");	//타일즈를 통해 불러올 jsp 경로
        System.out.println("itemAdministration id : " + id);
        ArrayList<ItemVO> itemList = itemService.getMyItemList(id);
        System.out.println("itemAdministration itemList : " + itemList);
        model.addAttribute("itemList", itemList);
        return mv;
    }
    @RequestMapping(value= "/modify", method=RequestMethod.GET)	//상품 수정하기 페이지
    public ModelAndView itemModifyGet(ModelAndView mv, Model model, Integer item_no, String id) throws Exception{
        mv.setViewName("/items/modify");
        ItemVO iVo = itemService.getItem(item_no);	//아이템 정보 불러오기
        if(!iVo.getSeller_id().equals(id)) {
        	return mv;
        }
        model.addAttribute("item", iVo);
        ArrayList<OptionVO> optionList = itemService.getOptions(item_no);	//옵션 목록 불러오기
        System.out.println("itemModify optionList : " + optionList);
        model.addAttribute("optionList", optionList);
        ArrayList<FileVO> fileList = itemService.getFiles(item_no);		//파일 목록 불러오기
        System.out.println("itemModify fileList : " + fileList);
        model.addAttribute("fileList", fileList);
        return mv;
    } 
    @RequestMapping(value= "/modify", method=RequestMethod.POST)	//상품 수정하기
    public String itemModifyPost(Model model, Integer item_no, String id, String title, Integer price1, Integer[] option_no, Integer[] file_no, String foremost_image,
    		String[] select,  String[] detail,  Integer[] stock,  Integer[] price, MultipartFile[] file2,
    		String[] modify_select,  String[] modify_detail,  Integer[] modify_stock,  Integer[] modify_price) throws Exception{
        System.out.println("itemModifyPost item_no : " + item_no);
        System.out.println("itemModifyPost id : " + id);
        System.out.println("itemModifyPost foremost_image : " + foremost_image);
    	model.addAttribute("id", id);
    	ItemVO iVo = itemService.getItem(item_no);	//아이템 정보 불러오기
        if(!iVo.getSeller_id().equals(id)) {		//판매자와 접속자가 일치하지 않을 경우 돌아가기
        	return "redirect:/items/administration";
        }
        iVo.setFile(foremost_image);			
        iVo.setTitle(title);
        iVo.setPrice(price1);
        itemService.modifyItem(iVo);						//아이템 정보 수정
        itemService.modifyImages(item_no, foremost_image);	//위시리스트, 장바구니, 주문 이미지 변경
        itemService.deleteOptions(item_no, option_no);		//옵션 삭제
        itemService.deleteFiles(item_no, file_no);			//파일 삭제
        for(MultipartFile tmp : file2){
			if(tmp.getOriginalFilename().length() != 0) {
				String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
				itemService.addFile(file, item_no);	//파일 등록
			}
		}
        OptionVO oVo = new OptionVO();
        oVo.setItem_no(item_no);
        oVo.setItem_title(title);
        itemService.registerOption(oVo, select, detail, stock, price);	//옵션 등록
        for(int i=0; i<modify_select.length; i++) {
        	OptionVO oVo1 = new OptionVO();
        	oVo1.setItem_no(item_no);
        	oVo1.setItem_title(title);
        	oVo1.setNo(option_no[i]);
        	oVo1.setSelect(modify_select[i]);
        	oVo1.setDetail(modify_detail[i]);
        	oVo1.setStock(modify_stock[i]);
        	oVo1.setPrice(modify_price[i]);
        	System.out.println("itemModifyPost oVo1 : " + oVo1);
        	itemService.modifyOption(oVo1);		//옵션 수정
        }
    	return "redirect:/items/administration";
    }
    @RequestMapping(value= "/myBuy")
    public ModelAndView myBuy(ModelAndView mv, Model model, Integer no) throws Exception{
        mv.setViewName("/items/myBuy");		//타일즈를 통해 불러올 jsp 경로
        System.out.println("myBuy no : " + no);
        BuyVO bVo = itemService.getBuy(no);
        System.out.println("myBuy bVo : " + bVo);
        DeliveryVO dVo = deliveryService.getDelivery1(bVo.getNo());
        String start = "정보 없음";
        String end = "정보 없음";
        if(bVo.getState().equals("배송 대기")) {
        	dVo.setCompany("정보 없음");
        	dVo.setDeliverer("정보 없음");
        	dVo.setPhone("정보 없음");
        }
        if(bVo.getState().equals("배송중")) {
        	start = dVo.getStartTime();
        }
        if(bVo.getState().equals("배송 완료")) {
        	start = dVo.getStartTime();
        	end = dVo.getEndTime();
        }
        System.out.println("myBuy dVo : " + dVo);
        System.out.println("myBuy start : " + start);
        System.out.println("myBuy end : " + end);
        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("dVo", dVo);
        model.addAttribute("bVo", bVo);
        return mv;
    } 
    @RequestMapping(value= "/addWishlist")	//위시리스트
    public String addWishlist(Model model, String id, Integer item_no){
    	if(id == null || id == ""){
    		return "redirect:/items/list";
    	}
    	System.out.println("addWishlist id : " + id);
    	System.out.println("addWishlist item_no : " + item_no);
    	ItemVO iVo = itemService.getItem(item_no);		//아이템 정보 불러오기
    	System.out.println("addWishlist iVo : " + iVo);
    	WishlistVO wVo = new WishlistVO();
    	wVo.setId(id);
    	wVo.setImage(iVo.getFile());
    	wVo.setItem_no(item_no);
    	wVo.setItem_name(iVo.getTitle());
    	wVo.setItem_price(iVo.getPrice());
    	System.out.println("addWishlist wVo : " + wVo);
    	itemService.addWishlist(wVo);
    	model.addAttribute("item_no", item_no);
    	return "redirect:/items/detail";
    }
    @RequestMapping(value= "/deleteWishlist")	//장바구니
    @ResponseBody
    public boolean deleteWishlist(@RequestBody String str){
    	if(str == null){
    		return false;
    	}
    	System.out.println("deleteWishlist str : " + str);
    	String [] arr = str.split("&");	//전송된 정보를 &을 기준으로 구분하여 나눠 배열에 저장
    	String id = arr[0];
    	String no1 = arr[1];
    	id = memberService.getVal(id);
    	no1 = memberService.getVal(no1);
    	System.out.println("deleteWishlist id : " + id);
    	System.out.println("deleteWishlist no1 : " + no1);
    	Integer wishlist_no = Integer.parseInt(no1);
    	System.out.println("deleteWishlist wishlist_no : " + wishlist_no);
    	itemService.deleteWishlist(id, wishlist_no);
    	return true;
    }
    @RequestMapping(value= "/addBag")	//장바구니
    public String addBag(Model model, Integer item_no,  Integer[] option_no, String[] select,
        String[] detail,  Integer[] count,  Integer[] price, Integer total_price, String id){
    	ArrayList<OptionVO> oVoList = itemService.getOderOptions(item_no, option_no, select, detail, count, price);
    	System.out.println("addBag oVoList : " + oVoList);
    	System.out.println("addBag id : " + id);
    	BagVO bVo = new BagVO();
    	for(int i=0; i<oVoList.size(); i++){
    		ItemVO iVo = itemService.getItem(oVoList.get(i).getItem_no());
    		System.out.println("addBag iVo : " + iVo);
    		bVo.setImage(iVo.getFile());
    		bVo.setId(id);
    		bVo.setItem_no(oVoList.get(i).getItem_no());
    		bVo.setOption_no(oVoList.get(i).getNo());
    		bVo.setSelect(oVoList.get(i).getSelect());
    		bVo.setDetail(oVoList.get(i).getDetail());
    		bVo.setCount(oVoList.get(i).getStock());
    		bVo.setPrice(oVoList.get(i).getPrice());
    		System.out.println("addBag bVo : " + bVo);
    		itemService.addBag(bVo);
    	}
    	model.addAttribute("item_no", item_no);
    	return "redirect:/items/detail";
    }
    @RequestMapping(value="/couponGet", method = RequestMethod.POST)	//쿠폰함
    @ResponseBody
    public Map<Object, Object> couponGet(@RequestBody String str) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	System.out.println("couponGet str : " + str);
    	String[] arr= str.split("&");
    	String id = arr[0];
    	String coupon_no1 = arr[1];
    	id = memberService.getVal(id);
    	coupon_no1 = memberService.getVal(coupon_no1);
    	int coupon_no2 = Integer.parseInt(coupon_no1);
    	Integer coupon_no = coupon_no2;
    	System.out.println("couponGet id : " + id);
    	System.out.println("couponGet coupon_no : " + coupon_no);
    	CouponBagVO cbVO = itemService.getCoupon(id, coupon_no);
    	CouponVO cVo = itemService.getCoupon(cbVO.getCoupon_no());
    	System.out.println("couponGet cVo : " + cVo);
    	map.put("cVo", cVo);
    	return map;
    }
    @RequestMapping(value="/deleteItem", method = RequestMethod.POST)	//쿠폰함
    @ResponseBody
    public Map<Object, Object> deleteItem(ItemVO iVo) {
    	Map<Object, Object> map = new HashMap<Object, Object>();
    	System.out.println("deleteItem iVo : " + iVo);
    	if(itemService.deleteItem(iVo.getNo(), iVo.getSeller_id())) {
    		
    	}
    	return map;
    }
}
