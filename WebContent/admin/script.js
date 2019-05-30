	function update(id){
		document.update.id.value=id;
		document.update.submit();
	}

//product 

	function productDetail(no) {
		document.detail.no.value=no;
		document.detail.submit();
	}

	function productDelete(no) {
		document.del.no.value=no;
		document.del.submit();
	}

	function productUpdate(no){
		document.update.no.value=no;
		document.update.submit();
	}


//order

	function orderDetail(no){
		document.detail.no.value=no;
		document.detail.submit();	
	}
	
	function orderUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function orderDelete(form) {
		form.flag.value="delete";
		form.submit();
	}
	

//order end