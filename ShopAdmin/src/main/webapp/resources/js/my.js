
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

/*
//jQuery 시작 - multipart일때는 이렇게 쓸수 x MySpring가서 multipart처리 안되어있는 notice에서 확인해보기
$(document).ready(function() { //현재 페이지가 시작될때 처리할 내용을 작성 (ready)
	$("#id_btn").click(function() { //버튼이 클릭될 때 처리할 내용을 작성 (click)
		//alert('테스트버튼');
		//alert($("#id_subject").val()); //그 명칭안에 들어있는 값(value)
		if($("#id_subject").val() == '') {
			alert('Please fill in title');
		} else if ($("#id_contents").val() == '') {
			alert('Please fill in content');
		} else { 
		$("id_writeform").submit(); //폼에 소속된 객체의 내용을 전송
		}
	});
});
*/






















	