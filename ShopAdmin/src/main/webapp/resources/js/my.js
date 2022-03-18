function writeform() {
		var thisform = document.writefrm; //폼 저장 
		thisform.method = "post";
		thisform.action = "/notice/insert";
		var id_subject = document.getElementById('id_subject').value; 
		//text 제목의 값, getElementById을 쓰면 많은 계층구조가 있더라도 중복값만 없다면 끌어올수 있다.  
		if (id_subject == '') {
			alert('제목을 입력해야 합니다.');
		} else {
			thisform.submit(); // 폼 전송
		}
		//alert(id_subject);
		//alert("글이 입력되었습니다");
	};
	function writeform2() {
		var thisform = document.writefrm; //폼 저장 
		thisform.method = "post";
		thisform.action = "/notice/insert";
		var id_subject = document.getElementById('id_subject').value; //텍스트상자의 값
		if (id_subject == '') {
			alert('제목을 입력해야 합니다.2');
		} else {
			thisform.submit(); // 폼 전송
		}
		//alert(id_subject);
		//alert("글이 입력되었습니다");
	};