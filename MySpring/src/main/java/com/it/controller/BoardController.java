package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;
import com.it.domain.PageViewDTO;
import com.it.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/") //url 최상위)
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model, PageDTO page) { 
	//Model 객체는 VO객체를(테이블 데이터를) 저장해서 list.jsp파일로 데이터 전송
		
		model.addAttribute("list", service.getList(page)); 
		//getList로 조회한 모든 내용(출력시킬데이터)을 list 변수로 전달
		
		int total = service.getTotalCount(); //전체레코드 갯수 뽑아내기
		
		PageViewDTO pageview = new PageViewDTO(page, total);
		//log.info(pageview);
		model.addAttribute("pageview", pageview);
	}
	
	@GetMapping("/insert")
	public void insert () {
		//메세지를 호출만 함
	}
	
	@PostMapping("/insert")
	public String insert(BoardVO board) {
		log.info("--------글쓰기시작--------");
		log.info(board);
		//insert.jsp form을 통해 넘어온걸 
		//서비스 계층에 넘겨준다 테이블에 입력
		service.insert(board); 
		
		//리스트로 이동 (return 사용)
		log.info("--------글쓰기완료--------");
		return "redirect:/board/list"; 
		//반환하는 값이 ""안에 있으니까 type이 String
		//controller 를 통해서 이동 
	}
	
	@GetMapping("/view")
	//list.jsp로부터 get방식으로 넘겨온 번호를 하나 받는데 
	//이렇게 큰 가방이 필요할까 싶지만 그래도 가장 안전한 방법
	//내용전체가 아니라 글번호 딱 하나만 받는 view메서드 안에 board객체 (임시저장용) 
	//view.jsp로 넘겨주는 model객체 선언
	public void view(BoardVO board, Model model) { 
		log.info("------읽기전------");
		log.info(board);
		//board로 데이터 들어온것 확인 (mapper까지 내려감)
		//글번호 하나만 받은 board를 service의 read함수로 모든 데이터를 다시 board객체에 대입
		board = service.read(board); 
	
		log.info("------읽은후------");
		log.info(board);
		
		//글번호에 해당하는 모든 정보를 담은 board를 변수"board"로 view.jsp에 넘겨준다.
		//왼쪽board : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽board : 위에서 데이터받은 객체
		model.addAttribute("board", board);
	}
	
	@GetMapping("/update")
	public void update(BoardVO board, Model model) { 
		//update.jsp로 넘겨주는 model객체 선언
		log.info("-----업데이트를 위한 번호------");
		log.info(board);
		board = service.read(board); //번호만 사용하여 조회
		log.info("-----업데이트를 위한 데이터-----");
		log.info(board);
		model.addAttribute("board", board);
	}
	
	@PostMapping("/update")
	public String update(BoardVO board) {
		log.info("-----업데이트데이터-----");
		log.info(board);
		service.update(board); //업데이트
		return "redirect:/board/view?b_num=" + board.getB_num();
		//get으로 넘길때 id값이 영문이어야만 한다. 한글 못읽음
	}

	@GetMapping("/delete")
	public String delete(BoardVO board) {
		log.info("-------삭제--------");
		service.delete(board);
		return "redirect:/board/list";
	}
	
	
	
	
}
 