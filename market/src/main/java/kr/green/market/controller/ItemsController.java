package kr.green.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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

import kr.green.market.service.DeliveryService;
import kr.green.market.service.ItemService;
import kr.green.market.service.MemberService;
import kr.green.market.utils.UploadFileUtils;
import kr.green.market.vo.AddressListVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CouponBagVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;

@Controller
@RequestMapping(value= "/items")
public class ItemsController {

	@Autowired
	MemberService memberService;
	@Autowired
	ItemService itemService;
	@Resource
	private String uploadPath;
	@Autowired
	DeliveryService deliveryService;
	
    @RequestMapping(value= "/list")
    public ModelAndView itemList(ModelAndView mv, Model model) throws Exception{
    	ArrayList<ItemVO> itemList = itemService.getItemList();
    	model.addAttribute("itemList", itemList);
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/detail")
    public ModelAndView itemsDetail(ModelAndView mv, Model model, Integer item_no) throws Exception{
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
    	ArrayList<OptionVO> options = itemService.getItemOptions(item_no);
    	System.out.println("itemDetail Options : " + options);
    	model.addAttribute("options", options);
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
    	String[] detail,  Integer[] count,  Integer[] price, Integer total_price, String id) throws Exception{
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
    public String orderRequest(Integer item_no, Integer[] option_no, String[] select,
    String[] detail,  Integer[] count,  Integer[] price, Integer total_price, Integer delivery_price, Integer coupon_price,
    Integer last_Price, String id, AddressListVO aVo, Integer delivery_code, Integer address_no, String request){
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
		itemService.registerFile(itemNo);	//파일명 등록
        OptionVO oVo = new OptionVO();
        oVo.setItem_no(itemNo);
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
    public ModelAndView itemAdministration(ModelAndView mv) throws Exception{
        mv.setViewName("/items/administration");	//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/modify")
    public ModelAndView itemModify(ModelAndView mv) throws Exception{
        mv.setViewName("/items/modify");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    } 
    @RequestMapping(value= "/myBuy")
    public ModelAndView myBuy(ModelAndView mv, Model model, Integer no) throws Exception{
        mv.setViewName("/items/myBuy");		//타일즈를 통해 불러올 jsp 경로
        System.out.println("myBuy no : " + no);
        BuyVO bVo = itemService.getBuy(no);
        System.out.println("myBuy bVo : " + bVo);
        DeliveryVO dVo = deliveryService.getDelivery1(bVo.getNo());
        if(dVo == null){
        	dVo.setSeller_name("");
        	dVo.setContents("");
        	dVo.setStart("");
        	dVo.setEnd("");
        	dVo.setCompany("");
        	dVo.setDeliverer("");
        	dVo.setPhone("");
        	dVo.setStartTime("");
        	dVo.setEndTime("");
        }
        if(dVo.getCompany() == null){
        	dVo.setCompany("");
        	dVo.setDeliverer("");
        	dVo.setPhone("");
        	dVo.setStartTime("");
        	dVo.setEndTime("");
        }
        if(dVo.getEndTime() == null){
        	dVo.setEndTime("");
        }
        System.out.println("myBuy dVo : " + dVo);
        model.addAttribute("dVo", dVo);
        model.addAttribute("bVo", bVo);
        return mv;
    } 
}
