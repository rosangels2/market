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

import kr.green.market.service.ItemService;
import kr.green.market.service.MemberService;
import kr.green.market.utils.UploadFileUtils;
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
    public ModelAndView order(Model model, ModelAndView mv, Integer item_no,  Integer[] option_no, String[] select,  String[] detail,  Integer[] count,  Integer[] price, Integer total_price) throws Exception{
    	ArrayList<OptionVO> oVoList = itemService.getOderOptions(item_no, option_no, select, detail, count, price);
        System.out.println("order oVoList : " + oVoList);
        Integer orderCount = select.length;
        System.out.println("order orderCount : " + orderCount);
        model.addAttribute("orderCount", orderCount);
        model.addAttribute("optionList", oVoList);
        model.addAttribute("total_price", total_price);
        mv.setViewName("/items/order");		//타일즈를 통해 불러올 jsp 경로
        return mv;
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
}
