package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.BuyVO;
import kr.green.market.vo.CouponVO;
import kr.green.market.vo.DeliveryVO;
import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;

public interface ItemDAO {

	void insertItem(@Param("seller_id")String seller_id, @Param("category_no")Integer categoryNo, @Param("title")String title, @Param("price")Integer price1);

	int selectItemNo();

	void insertOption(@Param("oVo")OptionVO oVo);

	void insertFile(@Param("file")String file, @Param("item_no")int itemNo);

	String selectFile(@Param("item_no")int itemNo);

	ItemVO selectItem(@Param("no")int itemNo);

	void updateItem(@Param("iVo")ItemVO iVo);

	ArrayList<ItemVO> selectItemList();

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

}
