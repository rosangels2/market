package kr.green.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.market.service.ItemService;
import kr.green.market.service.MemberService;
import kr.green.market.utils.UploadFileUtils;
import kr.green.market.vo.OptionVO;

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
    public ModelAndView itemList(ModelAndView mv) throws Exception{
        mv.setViewName("/items/list");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/detail")
    public ModelAndView itemsDetail(ModelAndView mv) throws Exception{
        mv.setViewName("/items/detail");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/order")
    public ModelAndView order(ModelAndView mv) throws Exception{
        mv.setViewName("/items/order");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }  
    @RequestMapping(value= "/register", method = RequestMethod.GET)
    public ModelAndView itemRegisterGet(ModelAndView mv) throws Exception{
        mv.setViewName("/items/register");		//타일즈를 통해 불러올 jsp 경로
        return mv;
    }
    @RequestMapping(value= "/register", method = RequestMethod.POST)
    public String itemRegisterPost(MultipartFile[] file2, String id, String title, String[] select,  String[] detail,  Integer[] stock,  Integer[] price) throws Exception{
        Integer sellerNo = memberService.getSellerNo(id);
        Integer categoryNo = 1;
        int itemNo = itemService.registerItem(sellerNo, categoryNo, title);
		for(MultipartFile tmp : file2){
			if(tmp.getOriginalFilename().length() != 0) {
				String file = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
				itemService.addFile(file, itemNo);
			}
		}
        OptionVO oVo = new OptionVO();
        oVo.setItem_no(itemNo);
        if(select.length == 0 || detail.length == 0 || stock == null || price == null){
        	return "redirect:/items/register";
        }
        itemService.registerOption(oVo, select, detail, stock, price);
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
