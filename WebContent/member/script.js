//////////////////////////////////////////////////
// login.jsp
//////////////////////////////////////////////////
function login() {
	if (document.loginFrm.mb_phone.value == "") {
		alert("전화번호를 입력하세요.");
		document.loginFrm.mb_phone.focus();
		return;
	}

	if (document.loginFrm.mb_pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		document.loginFrm.mb_pwd.focus();
		return;
	}

	document.loginFrm.submit();
}

function press() { 
	if (event.keyCode == 13) { 
		if (document.loginFrm.mb_phone.value == "") {
			alert("전화번호를 입력하세요.");
			document.loginFrm.mb_phone.focus();
			return;
		}

		if (document.loginFrm.mb_pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			document.loginFrm.mb_pwd.focus();
			return;
		}

		document.loginFrm.submit(); 
	}
}

function autoHypenPhone(str) {
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) {
		return str;
	} else if (str.length < 7) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	} else if (str.length < 11) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	} else {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}
	return str;
}

//////////////////////////////////////////////////
// orderHistory.jsp
//////////////////////////////////////////////////
$(function(){
	$('#orderHistoryModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget); 
		var oh_tnum = button.data('oh-tnum');
		var modal = $(this);
		modal.find('.modal-content').load('orderHistoryModal.jsp?oh_tnum=' + oh_tnum);
	});
});

function paging(page) {
	document.readFrm.nowPage.value = page;
	document.readFrm.submit();
}

//////////////////////////////////////////////////
//login.jsp
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//login.jsp
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//login.jsp
//////////////////////////////////////////////////


//////////////////////////////////////////////////
//login.jsp
//////////////////////////////////////////////////