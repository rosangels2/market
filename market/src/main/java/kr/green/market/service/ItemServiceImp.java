package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.ItemDAO;
import kr.green.market.vo.BagVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;
import kr.green.market.vo.WishlistVO;

@Service
public class ItemServiceImp implements ItemService{

	@Autowired
	ItemDAO itemDao;
	@Override
	public int registerItem(String seller_id, Integer categoryNo, String title, Integer price1) {
		if(seller_id == null || categoryNo == null || title == null || price1 == null){
			return -1;
		}
		itemDao.insertItem(seller_id, categoryNo, title, price1);
		return itemDao.selectItemNo();
	}
	@Override
	public boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price) {
		if(oVo == null || select == null || detail == null || stock == null || price == null) {
			return false;
		}
        for(int i=0 ; i<select.length ; i++){
        	if(select[i] == "" || detail[i] == "" || stock[i] == null || price[i] == null){
        		return false;
        	}
        	oVo.setSelect(select[i]);
        	oVo.setDetail(detail[i]);
        	oVo.setStock(stock[i]);
        	oVo.setPrice(price[i]);
        	itemDao.insertOption(oVo);
        }
		return true;
	}
	@Override
	public void addFile(String file, int itemNo) {
		itemDao.insertFile(file, itemNo);
	}
	@Override
	public void registerFile(int itemNo) {
		String file =  itemDao.selectFile(itemNo);
		ItemVO iVo = itemDao.selectItem(itemNo);
		iVo.setFile(file);
		itemDao.updateItem(iVo);
	}
	@Override
	public ArrayList<ItemVO> getItemList() {
		return itemDao.selectItemList();
	}
	@Override
	public ItemVO getItem(Integer no) {
		if(no == null){
			return null;
		}
		ItemVO iVo = itemDao.selectItem(no);
		if(iVo == null) {
			return null;
		}
		return iVo;
	}
	@Override
	public ArrayList<FileVO> getFiles(Integer no) {
		if(no == null){
			return null;
		}
		return itemDao.selectFiles(no);
	}
	@Override
	public SellerVO getSellerName(String seller_id) {
		if(seller_id == null){
			return null;
		}
		SellerVO sVo = itemDao.selectSeller(seller_id);
		if(sVo == null){
			return null;
		}
		return sVo;
	}
	@Override
	public ArrayList<OptionVO> getItemOptions(Integer item_no) {
		if(item_no == null){
			return null;
		}
		return itemDao.selectOptions(item_no);
	}
	@Override
	public ArrayList<OptionVO> getOptionDetail(Integer item_no, String select) {
		if(item_no == null || select == null){
			return null;
		}
		return itemDao.selectDetails(item_no, select);
	}
	@Override
	public OptionVO getDetailOptions(Integer detail_no) {
		if(detail_no == null){
			return null;
		}
		return itemDao.selectOption(detail_no);
	}
	@Override
	public ArrayList<OptionVO> getOderOptions(Integer item_no, Integer[] option_no, String[] select, String[] detail, Integer[] count, Integer[] price) {
    	ArrayList<OptionVO> oVoList = new ArrayList<OptionVO>();
    	OptionVO oVo = new OptionVO();
        for(int i=0 ; i<select.length ; i++){
        	if(item_no == null || option_no[i] == null || select[i] == "" || detail[i] == "" || count[i] == null || price[i] == null){
        		return null;
        	}
        	oVo.setItem_no(item_no);
        	oVo.setNo(option_no[i]);
        	oVo.setSelect(select[i]);
        	oVo.setDetail(detail[i]);
        	oVo.setStock(count[i]);
        	oVo.setPrice(price[i]);
        	oVoList.add(new OptionVO(oVo));
        }
		return oVoList;
	}
	@Override
	public ArrayList getCouponList(String id) {
		if(id == null){
			return null;
		}
		return itemDao.selectCouponList(id);
	}
	@Override
	public CouponVO getCoupon(Integer coupon_no) {
		if(coupon_no == null){
			return null;
		}
		return itemDao.selectCoupon(coupon_no);
	}
	@Override
	public BuyVO addBuy(BuyVO bVo) {
		if(bVo == null){
			return null;
		}
		itemDao.insertBuy(bVo);
		int num = itemDao.selectMaxBuy();
		return itemDao.selectBuy(num);
	}
	@Override
	public DeliveryVO addDelivery(DeliveryVO dVo) {
		if(dVo == null) {
			return null;
		}
		itemDao.insertDelivery(dVo);
		int num = itemDao.selectMaxDelivery();
		return itemDao.selectDelivery(num);
	}
	@Override
	public ArrayList<BuyVO> getBuyList(String id) {
		if(id == null){
			return null;
		}
		return itemDao.selectBuyList(id);
	}
	@Override
	public BuyVO getBuy(Integer no) {
		if(no == null){
			return null;
		}
		return itemDao.selectBuy(no);
	}
	@Override
	public boolean addWishlist(WishlistVO wVo) {
		if(wVo == null) {
			return false;
		}
		WishlistVO wVo1 = itemDao.selectWishlistAdd(wVo.getId(), wVo.getItem_no());	//wishlist 중복 검사를 위한 wishlist 불러오기
		if(wVo1 != null) {
			return false;
		}
		itemDao.insertWishlist(wVo);
		return true;
	}
	@Override
	public ArrayList<WishlistVO> getWishlistList(String id) {
		if(id == null){
			return null;
		}
		return itemDao.selectWishlistAll(id);
	}
	@Override
	public boolean deleteWishlist(String id, Integer wishlist_no) {
		if(id == null || wishlist_no == null) {
			return false;
		}
		WishlistVO wVo = itemDao.selectWishlistDelete(wishlist_no);	//삭제를 위해 wishlist 불러오기
		if(wVo == null || !wVo.getId().equals(id)){
			return false;
		}
		wVo.setValid("D");
		itemDao.updateWishlist(wVo);
		return true;
	}
	@Override
	public boolean addBag(BagVO bVo) {
		if(bVo == null){
			return false;
		}
		itemDao.insertBag(bVo);
		return true;
	}
}
