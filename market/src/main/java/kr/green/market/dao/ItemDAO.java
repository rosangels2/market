package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface ItemDAO {

	void insertItem(@Param("seller_id")String seller_id, @Param("category_no")Integer categoryNo, @Param("title")String title, @Param("price")Integer price1);

	int selectItemNo();

	void insertOption(@Param("oVo")OptionVO oVo);

	void insertFile(@Param("file")String file, @Param("item_no")int itemNo);

	String selectFile(@Param("item_no")int itemNo);

	ItemVO selectItem(@Param("no")int itemNo);

	void updateItem(@Param("iVo")ItemVO iVo);

	ArrayList<ItemVO> selectItemList(@Param("cri")Criteria cri);

	ArrayList<FileVO> selectFiles(@Param("item_no")Integer no);

	SellerVO selectSeller(@Param("id")String seller_id);

	ArrayList<OptionVO> selectOptions(@Param("item_no")Integer item_no);

	ArrayList<OptionVO> selectDetails(@Param("item_no")Integer item_no, @Param("select")String select);

	OptionVO selectOption(@Param("no")Integer detail_no);

	ArrayList selectCouponList(@Param("id")String id);

	CouponVO selectCoupon(@Param("no")Integer coupon_no);

	void insertBuy(@Param("bVo")BuyVO bVo);

	int selectMaxBuy();

	BuyVO selectBuy(@Param("no")int num);

	ItemVO selectSeller(@Param("")Integer item_no);

	void insertDelivery(@Param("dVo")DeliveryVO dVo);

	int selectMaxDelivery();

	DeliveryVO selectDelivery(@Param("no")int num);

	void updateBuy(@Param("bVo")BuyVO bVo);

	ArrayList<BuyVO> selectBuyList(@Param("id")String id);

	void insertWishlist(@Param("wVo")WishlistVO wVo);

	WishlistVO selectWishlistAdd(@Param("id")String id, @Param("item_no")Integer item_no);		//wishlist 중복 검사를 위한 wishlist 불러오기

	ArrayList<WishlistVO> selectWishlistAll(@Param("id")String id);

	WishlistVO selectWishlistDelete(@Param("no")Integer wishlist_no);		//삭제를 위해 wishlist 불러오기

	void updateWishlist(@Param("wVo")WishlistVO wVo);

	void insertBag(@Param("bVo")BagVO bVo);

	ArrayList<BagVO> selectBagList(@Param("id")String id);

	CouponBagVO selectCouponBag(@Param("id")String id, @Param("coupon_no")Integer coupon_no);

	void modifyCouponBag(@Param("cVo")CouponBagVO cVo);

	ArrayList<CouponBagVO> selectCouponBagList(@Param("id")String id);

	ArrayList<CouponVO> selectCouponAll();

	void insertCouponBag(@Param("id")String id, @Param("coupon_no")Integer coupon_no);

	int selectMaxCouponBag();

	CouponBagVO selectCouponBag1(@Param("no")int no);

	ArrayList<ItemVO> selectMyItemList(@Param("id")String id);

	void deleteOption(@Param("no")Integer no);

	void deleteFile(@Param("no")Integer no);

	void updateBuyImage(@Param("item_no")Integer item_no, @Param("image")String foremost_image);
	
	void updateBagImage(@Param("item_no")Integer item_no, @Param("image")String foremost_image);
	
	void updateWishlistImage(@Param("item_no")Integer item_no, @Param("image")String foremost_image);

	void updateOption(@Param("oVo")OptionVO oVo1);

	int getTotalCount(@Param("cri")Criteria cri);

	ArrayList<ItemVO> selectItemListAll();

	ArrayList<CategoryVO> selectCategoryListAll();
	
}
