package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.DeliveryDAO;
import kr.green.market.dao.ItemDAO;
import kr.green.market.pagination.Criteria;
import kr.green.market.vo.BuyVO;
import kr.green.market.vo.DeliveryVO;

@Service
public class DeliveryServiceImp implements DeliveryService{

	@Autowired
	DeliveryDAO deliveryDao;
	@Autowired
	ItemDAO itemDao;
	
	@Override
	public ArrayList<DeliveryVO> getDeliveryListAll(Criteria cri) {
		return deliveryDao.selectDeliveryListAll(cri);
	}

	@Override
	public DeliveryVO getDelivery(Integer delivery_no) {
		if(delivery_no == null){
			return null;
		}
		return deliveryDao.selectDelivery(delivery_no);
	}

	@Override
	public boolean addDeliverer(DeliveryVO dVo) {
		if(dVo == null){
			return false;
		}
		deliveryDao.updateDelivery(dVo);
		BuyVO bVo = itemDao.selectBuy(dVo.getBuy_no());
		bVo.setState("배송중");
		itemDao.updateBuy(bVo);
		return true;
	}

	@Override
	public boolean endDelivery(String deliverer, String phone, Integer delivery_no) {
		if(deliverer == null || phone == null || delivery_no == null){
			return false;
		}
		DeliveryVO dVo = deliveryDao.selectDelivery(delivery_no);
		if(!dVo.getDeliverer().equals(deliverer) || !dVo.getPhone().equals(phone)) {
			return false;
		}
		deliveryDao.updateEndDelivery(dVo);
		BuyVO bVo = itemDao.selectBuy(dVo.getBuy_no());
		bVo.setState("배송 완료");
		itemDao.updateBuy(bVo);
		return true;
	}

	@Override
	public ArrayList<DeliveryVO> getDelivererList(String deliverer, String phone) {
		if(deliverer == null || phone == null) {
			return null;
		}
		return deliveryDao.selectDelivererList(deliverer, phone);
	}

	@Override
	public DeliveryVO getDelivery1(Integer buy_no) {
		if(buy_no == null) {
			return null;
		}
		return deliveryDao.selectDelivery1(buy_no);
	}

	@Override
	public int getDeliveryTotalCount(Criteria cri) {
		return deliveryDao.getDeliveryTotalCount(cri);
	}


}
