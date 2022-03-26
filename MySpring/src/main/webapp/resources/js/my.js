//jQuery 시작
$(document).ready(function() { //현재 페이지가 시작될때 처리할 내용을 작성 (ready)
	$("#id_btn").click(function() { //버튼이 클릭될 때 처리할 내용을 작성 (click)
		//alert('테스트버튼');
		//alert($("#id_subject").val()); //그 명칭안에 들어있는 값(value)
		if($("#id_subject").val() == '') {
			alert('Please fill in title');
		} else if ($("#id_name").val() == '') {
			alert('Please fill in name');
		} else if ($("#id_contents").val() == '') {
			alert('Please fill in content');
		} else { 
			$("#id_writeform").attr("method", "post");
			$("#id_writeform").attr("action", "/notice/insert");
			$("#id_writeform").submit(); //폼에 소속된 객체의 내용을 전송
		}
	});
});
























	