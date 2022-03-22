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

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;
import com.it.domain.PageViewDTO;
import com.it.service.Board2Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board2/")
public class Board2Controller {

	@Setter(onMethod_ = @Autowired)
	private Board2Service service;
	
	@GetMapping("/list")
	public String list(HttpSession session, Model model, PageDTO page) { 
		
			model.addAttribute("list", service.getList(page)); 
			//getList로 조회한 모든 내용(출력시킬데이터)을 list 변수로 전달
			int total = service.getTotalCount(); //전체레코드 갯수 뽑아내기
			PageViewDTO pageview = new PageViewDTO(page, total);
			//log.info(page);
			//log.info(pageview);
			model.addAttribute("pageview", pageview);
			return "/board2/list";
		
	}
	
	@GetMapping("/insert")
	public String insert (HttpSession session) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
			return "/board2/insert";
		} else {
			return "redirect:/member/login";
		}
	}
	
	@PostMapping ("/insert")
	public String insert(HttpServletRequest request) { //부호화 방식이 multipart이면 객체를 수신할수 없음, 그래서 가방이아니라 request로 할수 밖에 없다.
		DiskFileUpload upload = new DiskFileUpload(); // common-file upload 패키지에 있는 DiskFileUpload객체
		//모든데이터(파일포함)전송컴포넌트객체 생성
		//log.info(request);
		try {
			List items = upload.parseRequest(request); //웹브라우저 전송 객체 생성해서 업로드컴포넌트에 전달
			Iterator params = items.iterator() ; // 반복자 생성 
			//log.info(items);
			//log.info(params);
			//forEach를 쓰면 데이터가 없어서 넘길게 없는 경우 null로 표시되니까 
			//Iterator는 있으면 저장하고 없으면 저장하지 않는다
				
			String filepath = "C:\\myWorkSpace\\learnJsp\\pds"; 
			//resourses종속되지 않은 공간을 만들기위해서 pds 로 독립적인 파일경로설정
			//log.info(items.size());
			Board2VO board = new Board2VO();
			while (params.hasNext()) { //form 객체가 있을 경우  .hasNest() 데이터 있다 없다 
				FileItem item = (FileItem)params.next(); //폼 형식 객체를 변수에 저장 .next() 반환
				log.info(item);
				if (item.isFormField()) { //파일형식이 아니라면 
					//p_code = item.getString(); //파일보다 먼저 반환됨
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					log.info(fieldname + ":" + fieldvalue);
					if (fieldname.equals("b_subject")) {
						board.setB_subject(fieldvalue);
					} else if (fieldname.equals("b_name")) {
						board.setB_name(fieldvalue);
					} else if (fieldname.equals("b_contents")) {
						board.setB_contents(fieldvalue);
					}
						
				} else { //바이너리 파일이라면 
					String fname = item.getName();
					log.info(fname);
					if (fname != "") {
						board.setB_file(fname);
						File file = new File(filepath + "/" + fname); //파일객체 생성 
						item.write(file); //해당 경로에 파일 저장	
					}
				}
			}
			log.info(board);
			service.insert(board);
			return "redirect:/board2/list"; 
			
		} catch (Exception e) {
			System.out.print(e);
		}
		return "redirect:/board2/insert"; 
	}
	
	
	@GetMapping("/download")
	public void download(Board2VO board, HttpServletResponse response) {
		/* request 기본 객체와는 정반대로 웹 브라우저에 보내는 응답 정보를 담는다. */
		/* response => HTTP 응답 정보(요청 처리 결과)를 제공하는 인터페이스 */
		/* request => HTTP 요청 정보(클라이언트 요청, 쿠키, 세션 등)를 제공하는 인터페이스 */
		board = service.read(board);
		//log.info(response);
		
		try {
			String filepath = "C:\\MyWorkSpace\\LearnJsp\\pds\\" + board.getB_file();
			File file = new File(filepath);
			//File file = new File(filepath + "\\" + board.getB_file());
			//"/"와 "\\"의 구분? \\ 은 로컬에서 쓰는 경로
			//filepath에 board.getB_file()까지 추가해서 완전한 경로를 갖추었으니 (filepath)하나로
			//log.info("file : " + file);
			
			String newName = new String(file.getName().getBytes("UTF-8"), "ISO-8859-1"); 
			//다운로드파일 한글깨짐문제처리
			//log.info("newName : " + newName);
			
			// 웹페이지가 아닌 파일객체를 클라이언트에 전송한다는 지시어
			// 기본적으로 text/html을 전송하는데, 파일도 함께 보낸 느낌.
			// 클라이언트 웹브라우저에 파일 다운로드 처리됨
			response.setHeader("Content-Disposition", "attachment;filename=" + newName); 
			// file.getName() -> newName변수
			log.info("response : " + response);
			
			FileInputStream fis = new FileInputStream(filepath); 
			// 객체를 생성할 때 데이터를 읽어올 파일을 지정
			OutputStream out = response.getOutputStream(); 
			// 바이트단위 파일처리 
			
			//log.info("out : " + out);
			
			int read = 0; // 1024 단위로 읽은 바이트 수 // 처음에는 못 읽었다고 가정하고
			byte[] buffer = new byte[1024]; 
			// 임의로 조정 가능 // 성능에 따라 임의로 다르게 할 수 있는 것.
			/* 내용이 있는 부분 <= 읽은 실체 */
			
			while((read = fis.read(buffer)) != -1) 
			// -1 반환 : 더 이상 못 읽으면 <== 파일 끝에 도달했을 경우
			{
				out.write(buffer, 0, read); // buffer를 쓰는데, 0부터 read까지 읽으세요.
											// 로컬로 보내는 것이아닌 브라우저 서버로 보내는 것.
				log.info(read);
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	@GetMapping("/view")
	public String view(HttpSession session, Board2VO board, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
			board = service.read(board);
			model.addAttribute("board", board);
			model.addAttribute("page", page);
			return "/board2/view";
		} else {
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/update")
	public String update(HttpSession session, Board2VO board, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
			board = service.read(board);
			model.addAttribute("board", board);
			model.addAttribute("page", page);
			return "/board2/update";
		} else {
			return "redirect:/admin/login";
		}
	}
	
	@PostMapping("/update")
	public String update(HttpServletRequest request, PageDTO page) {
		DiskFileUpload upload = new DiskFileUpload(); 
		//log.info(request);
		Board2VO board = new Board2VO();
		try {
			List items = upload.parseRequest(request); 
			Iterator params = items.iterator(); 
				
			String filepath = "C:\\myWorkSpace\\learnJsp\\pds"; 
			
			//log.info(items.size());
			while (params.hasNext()) { //form 객체가 있을 경우  .hasNest() 데이터 있다 없다 
				FileItem item = (FileItem)params.next(); //폼 형식 객체를 변수에 저장 .next() 반환
				log.info(item);
				if (item.isFormField()) { //파일형식이 아니라면 
					//p_code = item.getString(); //파일보다 먼저 반환됨
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					log.info(fieldname + ":" + fieldvalue);
					if (fieldname.equals("b_subject")) {
						board.setB_subject(fieldvalue);
					} else if (fieldname.equals("b_name")) {
						board.setB_name(fieldvalue);
					} else if (fieldname.equals("b_contents")) {
						board.setB_contents(fieldvalue);
					} else if (fieldname.equals("b_file")) {
						board.setB_file(fieldvalue);
					} else if (fieldname.equals("b_num")) {
						board.setB_num(Integer.parseInt(fieldvalue));
					}
						
				} else { //바이너리 파일이라면 
					String fname = item.getName();
					log.info(fname);
					if (fname != "") {
						board.setB_file(fname);
						File file = new File(filepath + "/" + fname); //파일객체 생성 
						item.write(file); //해당 경로에 파일 저장	
					}
				}
			}
			log.info(board);
			service.update(board);
			return "redirect:/board2/view?b_num=" + board.getB_num(); 
			
		} catch (Exception e) {
			System.out.print(e);
		}
		return "redirect:/board2/view?b_num=" + board.getB_num() + "&pageNum=" + page.getPageNum();
	}
	
	@GetMapping("/delete")
	public String delete(Board2VO board) {
		service.delete(board);
		return "redirect:/board2/list";
	}

}
