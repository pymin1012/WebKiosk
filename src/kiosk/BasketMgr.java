package kiosk;

import java.util.LinkedHashMap;

import kiosk.OrdersBean;

public class BasketMgr {
	//Integer=장바구니 번호
	private LinkedHashMap<Integer, OrdersBean> basket = new LinkedHashMap<>();
	private static int num = 0;
	
	//Cart Insert
	public int addBasket(OrdersBean bean) {
		if (bean.getOr_count() > 0) {
			num++;
			bean.setOr_basket(num);
			basket.put(num, bean);
		}
		System.out.println(num);
		 return num;
	}
	
	//Get Cart Element
	public OrdersBean getBasketElement(int num) {
		return basket.get(num);
	}

	//Cart Update
	public void updateBasket(OrdersBean bean) {
		basket.put(bean.getOr_basket(), bean);
	}

	//Cart Delete
	public void deleteBasket(int num) {
		System.out.println(num);
		basket.remove(num);
	}
	
	//Cart List
	public LinkedHashMap<Integer, OrdersBean> getBasketList(){
		return basket;
	}
	
	//Is Basket Empty?
	public boolean isBasketEmpty() {
		return basket.isEmpty();
	}
}
