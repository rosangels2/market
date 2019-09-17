package kr.green.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.market.pagination.Criteria;
import kr.green.market.vo.DeliveryVO;

public interface DeliveryDAO {

	ArrayList<DeliveryVO> selectDeliveryListAll(@Param("cri")Criteria cri);

	DeliveryVO selectDelivery(@Param("no")Integer delivery_no);

	void updateDelivery(@Param("dVo")DeliveryVO dVo);

	void updateEndDelivery(@Param("dVo")DeliveryVO dVo);

	ArrayList<DeliveryVO> selectDelivererList(@Param("deliverer")String deliverer, @Param("phone")String phone);

	DeliveryVO selectDelivery1(@Param("buy_no")Integer buy_no);

	int getDeliveryTotalCount(@Param("cri")Criteria cri);

}
