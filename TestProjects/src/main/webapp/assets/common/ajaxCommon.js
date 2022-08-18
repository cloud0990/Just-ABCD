function callAjax(target, form, callback) {
	jQuery.ajax({
		type:'POST',
		url : target,
		data : form,
		dataType : 'json',
		cache: false,
		success : function(data) {
			if(data.resultCode=='S000') {
				callback(data);
			} else {
				alert('실패');
			}
		}
	});
}