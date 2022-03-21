package com.it.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
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
	public String list(HttpSession session, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
		int total = service.getTotalCount(); //전체레코드 갯수 뽑아내기
		
		PageViewDTO pageview = new PageViewDTO(page, total);
		//log.info(page);
		//log.info(total);
		model.addAttribute("pageview", pageview);
		model.addAttribute("page", page);
		
		model.addAttribute("list", service.getNotice(page));
		return "/notice/list";
		} else {
			return "redirect: /admin/login";
		}
	}
	
	@GetMapping("/insert")
	public String insert(HttpSession session, Model model) {
		String a_id = (String)session.getAttribute("a_id");
		String a_name = (String)session.getAttribute("a_name");
		if(a_id != null) {
			model.addAttribute("a_name", a_name);
			//log.info("관리자이름: " + a_name);
			return "/notice/insert";
		} else {
			return "redirect:/admin/login";
		}
	}
	
	/*
	@PostMapping("/insert")
	public String insert(NoticeVO notice) {
		log.info("---글쓰기시작---");
		log.info(notice);
		//insert.jsp form을 통해 넘어온걸 
		//서비스 계층에 넘겨준다 테이블에 입력
		service.insert(notice);
	
		log.info("---글쓰기완료---");
		return "redirect:/notice/list"; 
	} */
	
	@PostMapping("insert")
	public String insert(HttpServletRequest request) {
		DiskFileUpload upload = new DiskFileUpload();
		log.info(request);
		try {
			List items = upload.parseRequest(request); // 웹브라우저 전송객체 생성
			Iterator params = items.iterator(); // 반복자 생성. 있으면 저장하고 없으면 저장하지X
			String filepath = "C:\\myWorkSpace\\learnJsp\\pds";
			//resourses에 종속되지 않는 공간을 만들기위한 경로 설정
			
			NoticeVO notice = new NoticeVO();
			while (params.hasNext()) {
				FileItem item = (FileItem)params.next();
				if (item.isFormField()) {
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					log.info(fieldname + ":" + fieldvalue);
					if (fieldname.equals("n_subject")) {
						notice.setN_subject(fieldvalue);
					} else if (fieldname.equals("n_name")) {
						notice.setN_name(fieldvalue);
					} else if (fieldname.equals("n_contents")) {
						notice.setN_contents(fieldvalue);
					}
					
				} else { // binary file 
					String fname = item.getName();
					//log.info(fname);
					if (fname != "") {
						notice.setN_file(fname);
						File file = new File(filepath + "/" + fname); 
						item.write(file);
					}
				}
			}
			log.info(notice);
			service.insert(notice);
			return "redirect:/notice/list";
			
		} catch (Exception e) {
			System.out.print(e);
		}
		return "redirect:/notice/insert";
	}
	
	@GetMapping("/download")
	public void download(NoticeVO notice, HttpServletResponse response) {
		/* response => HTTP 응답 정보(요청 처리 결과)를 제공하는 인터페이스 */
		/* request => HTTP 요청 정보(클라이언트 요청, 쿠키, 세션 등)를 제공하는 인터페이스 */
		notice = service.read(notice);
		//log.info(response);
		
		try {
			String filepath ="C:\\MyWorkSpace\\LearnJsp\\pds\\" + notice.getN_file();
			File file = new File(filepath);
			String newName = new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			//log.info("newName: " + newName);
			response.setHeader("Content-Disposition", "attachement;filename=" + newName);
			//log.info("response : " + response);
			
			FileInputStream fis = new FileInputStream(filepath);
			OutputStream out = response.getOutputStream();
			//log.info("out :" + out);
			
			int read = 0;
			byte[] buffer = new byte[1024];
			
			while((read = fis.read(buffer)) != -1) {
				out.write(buffer, 0, read);
				//log.info(read);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	@GetMapping("/view")
	public String view (HttpSession session, NoticeVO notice, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
		//list.jsp로부터 get방식으로 넘겨온 번호를 하나 받는데 
		//이렇게 큰 가방이 필요할까 싶지만 그래도 가장 안전한 방법
		log.info("---읽기전---");
		log.info(notice);
		//notice로 데이터 들어온것 확인 (mapper까지 내려감)
		//글번호 하나만 받은 notice를 service의 read함수로 모든 데이터를 다시 notice객체에 대입
		notice = service.read(notice);
		log.info("---읽은후---");
		log.info(notice);
		//글번호에 해당하는 모든 정보를 담은 notice를 변수"notice"로 view.jsp에 넘겨준다.
		//왼쪽notice : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽notice : 위에서 데이터받은 객체
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
		return "/notice/view";
		} else {
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/update")
	public String update(HttpSession session, NoticeVO notice, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
		log.info("---업데이트를 위한 번호 ---");
		log.info(notice);
		notice = service.read(notice); 
		log.info("---업데이트를 위한 데이터---");
		log.info(notice);
		//글번호에 해당하는 모든 정보를 담은 board를 변수"notice"로 view.jsp에 넘겨준다.
		//왼쪽board : jsp에서 사용할명칭 (따라서 다른이름도 상관없는데 의미부여를위해)
		//오른쪽board : 위에서 데이터받은 객체   
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
		return "/notice/update";
		
		} else {
			return "redirect:/admin/login";
		}
	}
	
	@PostMapping("/update")
	public String update(HttpServletRequest request, PageDTO page) {
		DiskFileUpload upload = new DiskFileUpload();
		log.info(request);
		NoticeVO notice = new NoticeVO();
		try {
			List items = upload.parseRequest(request); // 웹브라우저 전송객체 생성
			Iterator params = items.iterator(); // 반복자 생성. 있으면 저장하고 없으면 저장하지X
			String filepath = "C:\\myWorkSpace\\learnJsp\\pds";
			//resourses에 종속되지 않는 공간을 만들기위한 경로 설정
			
			while (params.hasNext()) {
				FileItem item = (FileItem)params.next();
				if (item.isFormField()) {
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					log.info(fieldname + ":" + fieldvalue);
					if (fieldname.equals("n_subject")) {
						notice.setN_subject(fieldvalue);
					} else if (fieldname.equals("n_name")) {
						notice.setN_name(fieldvalue);
					} else if (fieldname.equals("n_contents")) {
						notice.setN_contents(fieldvalue);
					} else if (fieldname.equals("n_file")) {
						notice.setN_file(fieldvalue);
					} else if (fieldname.equals("n_num")) {
						notice.setN_num(Integer.parseInt(fieldvalue));
					}
					
				} else { // binary file 
					String fname = item.getName();
					//log.info(fname);
					if (fname != "") {
						notice.setN_file(fname);
						File file = new File(filepath + "/" + fname); 
						item.write(file);
					}
				}
			}
			log.info(notice);
			service.update(notice);
			return "redirect:/notice/list";
			
		} catch (Exception e) {
			System.out.print(e);
		}
		
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
