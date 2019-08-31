package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.BagVO;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;
import kr.green.market.vo.WishlistVO;

public interface ItemService {

	int registerItem(String seller_id, Integer categoryNo, String title, Integer price1);

	boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price);

	void addFile(String file, int itemNo);

	void registerFile(int itemNo);

	ArrayList<ItemVO> getItemList();

	ItemVO getItem(Integer no);

	ArrayList<FileVO> getFiles(Integer no);

	SellerVO getSellerName(String seller_id);

	ArrayList<OptionVO> getItemOptions(Integer item_no);

	ArrayList<OptionVO> getOptionDetail(Integer item_no, String select);

	OptionVO getDetailOptions(Integer detail_no);

	ArrayList<OptionVO> getOderOptions(Integer item_no, Integer[] option_no, String[] select, String[] detail, Integer[] count, Integer[] price);

	ArrayList getCouponList(String id);

	CouponVO getCoupon(Integer coupon_no);

	BuyVO addBuy(BuyVO bVo);

	DeliveryVO addDelivery(DeliveryVO dVo);

	ArrayList<BuyVO> getBuyList(String id);

	BuyVO getBuy(Integer no);

	boolean addWishlist(WishlistVO wVo);

	ArrayList<WishlistVO> getWishlistList(String id);

	boolean deleteWishlist(String id, Integer wishlist_no);

	boolean addBag(BagVO bVo);

	ArrayList<BagVO> getBagList(String id);

}
