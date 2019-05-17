package kiosk;

import java.util.Hashtable;

import kiosk.OrdersBean;

public class BasketMgr {
	//Integer=장바구니 번호
	private Hashtable<Integer, OrdersBean> basket = new Hashtable<>();
	private static int num = 0;
	
	//Cart Insert
	public void addBasket(OrdersBean bean) {
		if (bean.getOr_count() > 0) {
			num++;
			bean.setOr_basket(num);
			basket.put(num, bean);
		}
	}

	//Cart Update
	public void updateBasket(OrdersBean bean) {
		basket.put(bean.getOr_basket(), bean);
	}

	//Cart Delete
	public void deleteBasket(OrdersBean bean) {
		basket.remove(bean.getOr_basket());
	}
	
	//Cart List
	public Hashtable<Integer, OrdersBean> getBasketList(){
		return basket;
	}
}
