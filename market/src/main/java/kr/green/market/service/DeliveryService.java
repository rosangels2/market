package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.pagination.Criteria;
import kr.green.market.vo.DeliveryVO;

public interface DeliveryService {

	ArrayList<DeliveryVO> getDeliveryListAll(Criteria cri);

	DeliveryVO getDelivery(Integer delivery_no);

	boolean addDeliverer(DeliveryVO dVo);

	boolean endDelivery(String deliverer, String phone, Integer delivery_no);

	ArrayList<DeliveryVO> getDelivererList(String deliverer, String phone, Criteria cri);

	DeliveryVO getDelivery1(Integer buy_no);

	int getDeliveryRegisterTotalCount(Criteria cri);

	int getDelivererListTotalCount(String deliverer, String phone, Criteria cri);

}
