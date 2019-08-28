package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.DeliveryDAO;
import kr.green.market.vo.DeliveryVO;

@Service
public class DeliveryServiceImp implements DeliveryService{

	@Autowired
	DeliveryDAO deliveryDao;
	
	@Override
	public ArrayList<DeliveryVO> getDeliveryListAll() {
		return deliveryDao.selectDeliveryListAll();
	}

}
