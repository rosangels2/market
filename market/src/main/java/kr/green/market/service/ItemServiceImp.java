package kr.green.market.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.market.dao.ItemDAO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;

@Service
public class ItemServiceImp implements ItemService{

	@Autowired
	ItemDAO itemDao;
	@Override
	public int registerItem(Integer sellerNo, Integer categoryNo, String title) {
		if(sellerNo == null || categoryNo == null || title == null){
			return -1;
		}
		itemDao.insertItem(sellerNo, categoryNo, title);
		return itemDao.selectItemNo();
	}
	@Override
	public boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price) {
		if(oVo == null || select == null || detail == null || stock == null || price == null) {
			return false;
		}
        for(int i=0 ; i<select.length ; i++){
        	if(select[i] == "" || detail[i] == "" || stock[i] == null || price[i] == null){
        		return false;
        	}
        	oVo.setSelect(select[i]);
        	oVo.setDetail(detail[i]);
        	oVo.setStock(stock[i]);
        	oVo.setPrice(price[i]);
        	itemDao.insertOption(oVo);
        }
		return true;
	}
	@Override
	public void addFile(String file, int itemNo) {
		itemDao.insertFile(file, itemNo);
	}
	@Override
	public void registerFile(int itemNo) {
		String file =  itemDao.selectFile(itemNo);
		ItemVO iVo = itemDao.selectItem(itemNo);
		iVo.setFile(file);
		itemDao.updateItem(iVo);
	}
	@Override
	public ArrayList<ItemVO> getItemList() {
		return itemDao.selectItemList();
	}
}
