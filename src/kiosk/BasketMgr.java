package kiosk;

import java.util.Hashtable;

import kiosk.OrdersBean;

public class BasketMgr {


			//Integer=상품번호(ProductNo)
			private Hashtable<Integer, OrdersBean> or_basket = new Hashtable<>();
			
			
			//Cart Insert
			public void addCart(OrdersBean orders/*새로운 장바구니*/) {
				int Oh_num =orders.getOh_num();
				int or_count/*주문수량*/ = orders.getOr_count();
				if(or_count>0) {
					//cart에 기존에 저장된 것이 있다면
					if(or_basket.containsKey(Oh_num)) {
						//기존에 저장된 주문객체
						OrdersBean temp = or_basket.get(Oh_num);
						//새로운 주문 수량+ 기존의 주문수량
						or_count+=temp.getOr_count();
						//order 객체에 합쳐진 주문수량setter
						orders.setOr_count(or_count);
						//카트에 다시 저장하면 기존에 주문객체는 덮어쓰기된다.
						or_basket.put(Oh_num, orders);
					}else {
						//기존에 저장이 없다면
						or_basket.put(Oh_num, orders);
					}
					
				}
		
			}
			
			//Cart Update
			public void updateCart(OrdersBean orders) {
				int Oh_num =orders.getOh_num();
				//동일한 key값을 덮여쓰기
				or_basket.put(Oh_num, orders);
			}
			
			//Cart Delete
			public void deleteCart(OrdersBean orders) {
				int Oh_num =orders.getOh_num();
				or_basket.remove(Oh_num);
			}
			//Cart List
			public Hashtable<Integer, OrdersBean> getCartList(){
				return or_basket;
			}
}
