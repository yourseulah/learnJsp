function writeform() {
		var thisform = document.writefrm; //폼 저장 
		thisform.method = "post";
		thisform.action = "/notice/insert";
		var id_subject = document.getElementById('id_subject').value; 
		//text 제목의 값, getElementById을 쓰면 많은 계층구조가 있더라도 중복값만 없다면 끌어올수 있다.  
		if (id_subject == '') {
			alert('Please type in title');
		} else {
			thisform.submit(); // 폼 전송
		}
		//alert(id_subject);
		//alert("글이 입력되었습니다");
	};
	

//javascript가 물리는지 검사로 확인하고 수정한 코드가 안바뀌어 있으면 cashe 비우기
//css와 javascript는 cashe 를 비워주어야 한다.  

function boardform() {
		var thisform = document.boardfrm; //폼 저장 
		thisform.method = "post";
		thisform.action = "/board2/insert";
		var b_subject = document.getElementById('b_subject').value; //텍스트상자의 값
		if (b_subject == '') {
			alert('Please type in title');
		} else {
			thisform.submit(); // 폼 전송
		}
	};

	