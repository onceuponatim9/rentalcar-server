$(document).ready(() => {
	$('#name').focusout(e => {
		if($('#name').val() === "") {
			$('#error-msg-name').show();
			$('#name').css('border', 'solid 1px tomato');
		} else {
			$('#error-msg-name').hide();
			$('#name').css('border', 'solid 1px lightgrey');
			$('#name').css('border-bottom', 'none');
		}
	});
	
	$('#phone').focusout(e => {
		if($('#phone').val() === "") {
			$('#error-msg-phone').show();
			$('#phone').css('border', 'solid 1px tomato');
		} else {
			$('#error-msg-phone').hide();
			$('#phone').css('border', 'solid 1px lightgrey');
		}
		
		const phone = $('#phone').val();
		
		if(phone.match(/\d{3}-\d{4}-\d{4}|\d{11}/) === null) {
			$('#error-msg-phone-pattern').show();
			$('#phone').css('border', 'solid 1px tomato');
		} else {
			if(phone.length === 11) {
				const update = `${phone.substr(0,3)}-${phone.substr(3,4)}-${phone.substr(7,4)}`;
				$('#phone').val(update);
			}
		}
	});
	
	$('form').submit(e => {
		e.preventDefault();
		
		const name = $('#name').val();
		const phone = $('#phone').val();
		const carName = $('#carName').val();
		const startDate = $('#start-date').val();
		const endDate = $('#end-date').val();
		const price = $('#price').val();
		const payWay = e.target.pay-way.value;
		
		let isValid = true;
		
		if(name === "") {
			isValid = false;
			$('#error-msg-name').show();
			$('#name').css('border', 'solid 1px tomato');
		}
		if(phone === "") {
			isValid = false;
			$('#error-msg-phone').show();
			$('#phone').css('border', 'solid 1px tomato');
		}
		if(carName === "") {
			isValid = false;
			$('#error-msg-carName').show();
			$('#carName').css('border', 'solid 1px tomato');
		}
		if(startDate === "") {
			isValid = false;
			$('#error-msg-startDate').show();
			$('#startDate').css('border', 'solid 1px tomato');
		}
		if(endDate === "") {
			isValid = false;
			$('#error-msg-endDate').show();
			$('#endDate').css('border', 'solid 1px tomato');
		}
		if(price === "") {
			isValid = false;
			$('#error-msg-price').show();
			$('#price').css('border', 'solid 1px tomato');
		}
		if(payWay === "") {
			isValid = false;
			$('#error-msg-payWay').show();
			$('#radio-container').css('border', 'solid 1px tomato');
			$('#gender-man-label').css('border', 'solid 1px tomato');
			$('#gender-woman-label').css('border', 'solid 1px tomato');
		}
		
		if(isValid) {
			e.target.submit();
		}
	});
});