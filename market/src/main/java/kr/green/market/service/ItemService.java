package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;

public interface ItemService {

	int registerItem(Integer sellerNo, Integer categoryNo, String title);

	boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price);

	void addFile(String file, int itemNo);

	void registerFile(int itemNo);

	ArrayList<ItemVO> getItemList();

}