package kr.green.market.dao;

import java.util.ArrayList;

import kr.green.market.vo.DeliveryVO;

public interface DeliveryDAO {

	ArrayList<DeliveryVO> selectDeliveryListAll();

}
