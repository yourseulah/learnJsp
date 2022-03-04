package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;
import com.it.domain.PageViewDTO;
import com.it.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping ("/notice/") //최상위폴더
public class NoticeController {

	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	@GetMapping("/list")
	public void list(Model model, PageDTO page) {
	//Model 객체는 VO객체를(테이블 데이터를) 저장해서 list.jsp파일로 데이터 전송
		model.addAttribute("list", service.getNotice(page));
		//getNotice로 조회한 모든 내용을 list변수로 전달
		
		int total = service.getTotalCount(); //전체레코드 갯수 뽑아내기
		
		PageViewDTO pageview = new PageViewDTO(page, total);
		//log.info(page);
		//log.info(total);
		model.addAttribute("pageview", pageview);
		model.addAttribute("page", page);
	}
	
	@GetMapping("/insert")
	public void insert() {
		//메세지 호출만
	}
	
	@PostMapping("/insert")
	public String insert(NoticeVO notice) {
		log.info("---글쓰기시작---");
		log.info(notice);
		//insert.jsp form을 통해 넘어온걸 
		//서비스 계층에 넘겨준다 테이블에 입력
		service.insert(notice);
		
		//리스트로 이동 (return 사용)
		log.info("---글쓰기완료---");
		return "redirect:/notice/list"; 
		//반환하는 값이 ""안에 있으니까 type이 String
		//controller를 통해서 이동
	}
	
	@GetMapping("/view")
	public void view (NoticeVO notice, Model model, PageDTO page) {
		//list.jsp로부터 get방식으로 넘겨온 번호를 하나 받는데 
		//이렇게 큰 가방이 필요할까 싶지만 그래도 가장 안전한 방법
		log.info("---읽기전---");
		log.info(notice);
		//notice로 데이터 들어온것 확인 (mapper까지 내려감)
		//글번호 하나만 받은 board를 service의 read함수로 모든 데이터를 다시 notice객체에 대입
		notice = service.read(notice);
		
		log.info("---읽은후---");
		log.info(notice);
		
		//글번호에 해당하는 모든 정보를 담은 board를 변수"notice"로 view.jsp에 넘겨준다.
		//왼쪽board : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽board : 위에서 데이터받은 객체
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	}
	
	@GetMapping("/update")
	public void update(NoticeVO notice, Model model, PageDTO page) {
		//view.jsp 수정태크로부터 get방식으로 넘겨온 번호 하나를 notice가방안에 임시저장한다
		//update.jsp로 넘겨주는 model객체 선언
		log.info("---업데이트를 위한 번호 ---");
		log.info(notice);
		
		
		//notice로 데이터 들어온것 확인 (mapper까지 내려감)
		//글번호 하나만 받은 board를 service의 read함수로 모든 데이터를 다시 notice객체에 대입
		notice = service.read(notice); 
		log.info("---업데이트를 위한 데이터---");
		log.info(notice);
		
		//글번호에 해당하는 모든 정보를 담은 board를 변수"notice"로 view.jsp에 넘겨준다.
		//왼쪽board : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽board : 위에서 데이터받은 객체   
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	}
	
	@PostMapping("/update")
	public String update(NoticeVO notice, PageDTO page) {
		log.info("---업데이트데이터---");
		log.info(notice);
		service.update(notice); //업데이트
		return "redirect:/notice/view?n_num=" + notice.getN_num() +"&pageNum=" + page.getPageNum();
		//get으로 넘길때 id값이 영문이어야만 한다. 한글 못읽음
	}
	
	@GetMapping("/delete")
	public String delete(NoticeVO notice) {
		log.info("---삭제---");
		service.delete(notice);
		return "redirect:/notice/list";
	}
	

	
	
	

	
	
}
