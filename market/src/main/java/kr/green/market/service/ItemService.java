package kr.green.market.service;

import java.util.ArrayList;

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

public interface ItemService {

	int registerItem(String seller_id, Integer categoryNo, String title, Integer price1);

	boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price);

	void addFile(String file, int itemNo);

	void registerFile(int itemNo);

	ArrayList<ItemVO> getItemList(Criteria cri);

	ItemVO getItem(Integer no);

	ArrayList<FileVO> getFiles(Integer no);

	SellerVO getSellerName(String seller_id);

	ArrayList<OptionVO> getItemOptions(Integer item_no);

	ArrayList<OptionVO> getOptionDetail(Integer item_no, String select);

	OptionVO getDetailOptions(Integer detail_no);

	ArrayList<OptionVO> getOrderOptions(Integer[] option_no, String[] select, String[] detail, Integer[] count, Integer[] price);

	ArrayList<CouponBagVO> getCouponList(String id);

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

	boolean useCoupon(String id, Integer coupon_no);

	ArrayList<CouponBagVO> getCouponBagList(String id);

	ArrayList<CouponVO> getCouponAll();

	CouponBagVO getCouponBag(String id, Integer coupon_no);

	CouponBagVO getCoupon(String id, Integer coupon_no);

	ArrayList<ItemVO> getMyItemList(String id);

	boolean deleteItem(Integer no, String seller_id);

	ArrayList<OptionVO> getOptions(Integer item_no);

	boolean modifyForemostImage(ItemVO iVo);

	boolean deleteOptions(Integer item_no, Integer[] option_no);

	boolean deleteFiles(Integer item_no, Integer[] file_no);

	boolean modifyImages(Integer item_no, String foremost_image);

	boolean modifyItem(ItemVO iVo);

	boolean modifyOption(OptionVO oVo1);

	int getItemTotalCount(Criteria cri);

	ArrayList<ItemVO> getItemListAll();

	ArrayList<CategoryVO> getCategoryListAll();

	boolean deleteBag(Integer no, String id);

	boolean buyAgree(Integer no, String id);

	boolean buyCancel(Integer no, String id);

	boolean buyReturn(Integer no, String id);

	ArrayList<ItemVO> getItemListSeller(String id);

	ArrayList<BuyVO> getRequestListSeller(String id, Criteria cri);

	boolean buyCancelAgree(Integer no, String id);

	boolean buySwapAgree(Integer no, String id);

	boolean buyReturnAgree(Integer no, String id);

	ArrayList<ItemVO> getMoreItemList(Integer no);

}
