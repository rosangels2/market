package kr.green.market.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.market.vo.OptionVO;

public interface ItemDAO {

	void insertItem(@Param("seller_no")Integer sellerNo, @Param("category_no")Integer categoryNo, @Param("title")String title);

	int selectItemNo();

	void insertOption(@Param("oVo")OptionVO oVo);

	void insertFile(@Param("file")String file, @Param("item_no")int itemNo);

}
