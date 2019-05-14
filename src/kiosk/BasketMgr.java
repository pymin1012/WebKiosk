package kiosk;

import java.util.Hashtable;

import kiosk.OrdersBean;

public class BasketMgr {


			//Integer=��ǰ��ȣ(ProductNo)
			private Hashtable<Integer, OrdersBean> or_basket = new Hashtable<>();
			
			
			//Cart Insert
			public void addCart(OrdersBean orders/*���ο� ��ٱ���*/) {
				int Oh_num =orders.getOh_num();
				int or_count/*�ֹ�����*/ = orders.getOr_count();
				if(or_count>0) {
					//cart�� ������ ����� ���� �ִٸ�
					if(or_basket.containsKey(Oh_num)) {
						//������ ����� �ֹ���ü
						OrdersBean temp = or_basket.get(Oh_num);
						//���ο� �ֹ� ����+ ������ �ֹ�����
						or_count+=temp.getOr_count();
						//order ��ü�� ������ �ֹ�����setter
						orders.setOr_count(or_count);
						//īƮ�� �ٽ� �����ϸ� ������ �ֹ���ü�� �����ȴ�.
						or_basket.put(Oh_num, orders);
					}else {
						//������ ������ ���ٸ�
						or_basket.put(Oh_num, orders);
					}
					
				}
		
			}
			
			//Cart Update
			public void updateCart(OrdersBean orders) {
				int Oh_num =orders.getOh_num();
				//������ key���� ��������
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
