package kr.green.market.service;

import java.util.ArrayList;

import kr.green.market.vo.FileVO;
import kr.green.market.vo.ItemVO;
import kr.green.market.vo.OptionVO;
import kr.green.market.vo.SellerVO;

public interface ItemService {

	int registerItem(String seller_id, Integer categoryNo, String title, Integer price1);

	boolean registerOption(OptionVO oVo, String[] select, String[] detail, Integer[] stock, Integer[] price);

	void addFile(String file, int itemNo);

	void registerFile(int itemNo);

	ArrayList<ItemVO> getItemList();

	ItemVO getItem(Integer no);

	ArrayList<FileVO> getFiles(Integer no);

	SellerVO getSellerName(String seller_id);

	ArrayList<OptionVO> getItemOptions(Integer item_no);

	ArrayList<OptionVO> getOptionDetail(Integer item_no, String select);

	OptionVO getDetailOptions(Integer detail_no);

}
