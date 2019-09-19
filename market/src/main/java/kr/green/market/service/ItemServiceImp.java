package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.ItemDAO;
import kr.green.market.pagination.Criteria;
import kr.green.market.vo.BagVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CategoryVO;
import kr.green.market.vo.CouponBagVO;
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
	public ArrayList<ItemVO> getItemList(Criteria cri) {
		return itemDao.selectItemList(cri);
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
	public ArrayList<OptionVO> getOrderOptions(Integer[] option_no, String[] select, String[] detail, Integer[] count, Integer[] price) {
    	ArrayList<OptionVO> oVoList = new ArrayList<OptionVO>();
    	OptionVO oVo = new OptionVO();
        for(int i=0 ; i<select.length ; i++){
        	if(option_no[i] == null || select[i] == "" || detail[i] == "" || count[i] == null || price[i] == null){
        		return null;
        	}
        	OptionVO oVo1 = itemDao.selectOption(option_no[i]);
        	oVo.setItem_no(oVo1.getItem_no());
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
	public ArrayList<CouponBagVO> getCouponList(String id) {
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
		itemDao.insertBuy(bVo);		//주문 등록
		int num = itemDao.selectMaxBuy();
		OptionVO oVo = itemDao.selectOption(bVo.getOption_no());
		if(oVo != null){
			oVo.setStock(oVo.getStock()-bVo.getCount());
			itemDao.updateOption(oVo);	//구매한 수량만큼 상품 재고 감소
		}
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
	@Override
	public ArrayList<BagVO> getBagList(String id) {
		if(id == null) {
			return null;
		}
		
		return itemDao.selectBagList(id);
	}
	@Override
	public boolean useCoupon(String id, Integer coupon_no) {
		if(id == null || coupon_no == null) {
			return false;
		}
		CouponBagVO cVo = itemDao.selectCouponBag(id, coupon_no);
		if(cVo == null) {
			return false;
		}
		cVo.setValid("D");
		itemDao.modifyCouponBag(cVo);
		return true;
	}
	@Override
	public ArrayList<CouponBagVO> getCouponBagList(String id) {
		if(id == null) {
			return null;
		}
		return itemDao.selectCouponBagList(id);
	}
	@Override
	public ArrayList<CouponVO> getCouponAll() {
		return itemDao.selectCouponAll();
	}
	@Override
	public CouponBagVO getCouponBag(String id, Integer coupon_no) {
		if(id == null || coupon_no == null) {
			return null;
		}
		return itemDao.selectCouponBag(id, coupon_no);
	}
	@Override
	public CouponBagVO getCoupon(String id, Integer coupon_no) {
		if(id == null || coupon_no == null) {
			return null;
		}
		itemDao.insertCouponBag(id, coupon_no);
		int no = itemDao.selectMaxCouponBag();
		return itemDao.selectCouponBag1(no);
	}
	@Override
	public ArrayList<ItemVO> getMyItemList(String id) {
		if(id == null) {
			return null;
		}
		return itemDao.selectMyItemList(id);
	}
	@Override
	public boolean deleteItem(Integer no, String seller_id) {
		if(no == null || seller_id == null){
			return false;
		}
		ItemVO iVo = itemDao.selectItem(no);
		if(iVo == null || !iVo.getSeller_id().equals(seller_id)) {
			return false;
		}
		iVo.setValid("D");
		itemDao.updateItem(iVo);
		return true;
	}
	@Override
	public ArrayList<OptionVO> getOptions(Integer item_no) {
		if(item_no == null) {
			return null;
		}
		return itemDao.selectOptions(item_no);
	}
	@Override
	public boolean deleteOptions(Integer item_no, Integer[] option_no) {
		if(item_no == null || option_no == null) {
			return false;
		}
		ArrayList<OptionVO> options = itemDao.selectOptions(item_no);
		System.out.println("deleteOptions options : " + options);
		for(int i=0; i<options.size(); i++) {
			int count = 0;
			for(int j=0; j<option_no.length; j++) {
				if(options.get(i).getNo() == option_no[j]){
					count = 1;
				}
			}
			if(count == 0) {
				itemDao.deleteOption(options.get(i).getNo());
			}
		}
		return true;
	}
	@Override
	public boolean deleteFiles(Integer item_no, Integer[] file_no) {
		if(item_no == null || file_no == null) {
			return false;
		}
		ArrayList<FileVO> files = itemDao.selectFiles(item_no);
		System.out.println("deletefiles files : " + files);
		for(int i=0; i<files.size(); i++) {
			int count = 0;
			for(int j=0; j<file_no.length; j++) {
				if(files.get(i).getNo() == file_no[j]){
					count = 1;
				}
			}
			if(count == 0) {
				itemDao.deleteFile(files.get(i).getNo());
			}
		}
		return true;
	}
	@Override
	public boolean modifyImages(Integer item_no, String foremost_image) {
		if(item_no == null || foremost_image == "") {
			return false;
		}
		itemDao.updateBuyImage(item_no, foremost_image);	//장바구니 이미지 변경
		itemDao.updateBagImage(item_no, foremost_image);	//주문 이미지 변경
		itemDao.updateWishlistImage(item_no, foremost_image);	//위시리스트 이미지 변경
		return true;
	}
	@Override
	public boolean modifyForemostImage(ItemVO iVo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean modifyItem(ItemVO iVo) {
		if(iVo == null) {
			return false;
		}
		itemDao.updateItem(iVo);
		return true;
	}
	@Override
	public boolean modifyOption(OptionVO oVo1) {
		if(oVo1 == null) {
			return false;
		}
		itemDao.updateOption(oVo1);
		return true;
	}
	@Override
	public int getItemTotalCount(Criteria cri) {
		
		return itemDao.getItemTotalCount(cri);
	}
	@Override
	public ArrayList<ItemVO> getItemListAll() {
		return itemDao.selectItemListAll();
	}
	@Override
	public ArrayList<CategoryVO> getCategoryListAll() {
		return itemDao.selectCategoryListAll();
	}
	@Override
	public boolean deleteBag(Integer no, String id) {
		if(no == null || id == "") {
			return false;
		}
		BagVO bVo = itemDao.selectBag(no);
		if(bVo != null && bVo.getId().equals(id)){
			bVo.setValid("D");
			itemDao.updateBag(bVo);
		}
		return true;
	}
	@Override
	public boolean buyAgree(Integer no, String id) {
		if(no == null || id == "") {
			return false;
		}
		BuyVO bVo1 = itemDao.selectBuy(no);
		if(bVo1 == null) {
			return false;
		}
		bVo1.setState("구매확정");
		itemDao.updateBuy(bVo1);
		return true;
	}
	@Override
	public boolean buyCancel(Integer no, String id) {
		if(no == null || id == "") {
			return false;
		}
		BuyVO bVo1 = itemDao.selectBuy(no);
		if(bVo1 == null) {
			return false;
		}
		bVo1.setState("취소요청");
		itemDao.updateBuy(bVo1);
		return true;
	}
	@Override
	public boolean buyReturn(Integer no, String id) {
		if(no == null || id == "") {
			return false;
		}
		BuyVO bVo1 = itemDao.selectBuy(no);
		if(bVo1 == null) {
			return false;
		}
		bVo1.setState("교환/반품요청");
		itemDao.updateBuy(bVo1);
		return true;
	}
	@Override
	public ArrayList<ItemVO> getItemListSeller(String id) {
		if(id == null) {
			return null;
		}
		return itemDao.selectItemListSeller(id);
	}
	@Override
	public ArrayList<BuyVO> getRequestListSeller(String id, Criteria cri) {
		if(id == null) {
			return null;
		}
		return itemDao.selectRequestListSeller(id, cri);
	}
	@Override
	public boolean buyCancelAgree(Integer no, String id) {
		if(no == null || id == null) {
			return false;
		}
		BuyVO bVo = itemDao.selectBuy(no);
		if(bVo == null || !bVo.getSeller_id().equals(id)) {
			return false;
		}
		bVo.setState("취소처리");
		bVo.setValid("D");
		itemDao.updateBuy(bVo);		//주문 상태 변경
		OptionVO oVo = itemDao.selectOption(bVo.getOption_no());
		if(oVo != null){
			oVo.setStock(oVo.getStock()+bVo.getCount());	//구매 취소 후 재고 변경
			itemDao.updateOption(oVo);
		}
		return true;
	}
	@Override
	public boolean buySwapAgree(Integer no, String id) {
		if(no == null || id == null) {
			return false;
		}
		BuyVO bVo = itemDao.selectBuy(no);
		if(bVo == null || !bVo.getSeller_id().equals(id)) {
			return false;
		}
		bVo.setState("교환처리");
		itemDao.updateBuy(bVo);		//주문 상태 변경
		OptionVO oVo = itemDao.selectOption(bVo.getOption_no());
		if(oVo != null){
			oVo.setStock(oVo.getStock()+bVo.getCount());	//교환 처리 후 재고 변경
			itemDao.updateOption(oVo);
		}
		return true;
	}
	@Override
	public boolean buyReturnAgree(Integer no, String id) {
		if(no == null || id == null) {
			return false;
		}
		BuyVO bVo = itemDao.selectBuy(no);
		if(bVo == null || !bVo.getSeller_id().equals(id)) {
			return false;
		}
		bVo.setState("반품처리");
		itemDao.updateBuy(bVo);		//주문 상태 변경
		OptionVO oVo = itemDao.selectOption(bVo.getOption_no());
		if(oVo != null){
			oVo.setStock(oVo.getStock()+bVo.getCount());	//반품 처리 후 재고 변경
			itemDao.updateOption(oVo);
		}
		return true;
	}
	@Override
	public ArrayList<ItemVO> getMoreItemList(Integer no) {
		if(no == null) {
			return null;
		}
		return itemDao.selectMoreItemList(no);
	}

}
