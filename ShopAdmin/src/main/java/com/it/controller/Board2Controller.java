package com.it.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.Board2VO;
import com.it.service.Board2Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board2/")
public class Board2Controller {

	@Setter(onMethod_ = @Autowired)
	private Board2Service service;
	
	@GetMapping("/insert")
	public void insert () {
		//메세지를 호출만 함
	}
	
	@PostMapping ("/insert")
	public void insert(HttpServletRequest request) { //부호화 방식이 multipart이면 객체를 수신할수 없음, 그래서 가방이아니라 request로 할수 밖에 없다.
		DiskFileUpload upload = new DiskFileUpload(); // common-file upload 패키지에 있는 DiskFileUpload객체
		//모든데이터(파일포함)전송컴포넌트객체 생성
		log.info(request);
		try {
			List items = upload.parseRequest(request); //웹브라우저 전송 객체 생성해서 업로드컴포넌트에 전달
			Iterator params = items.iterator() ; // 반복자 생성 
			log.info(items);
			log.info(params);
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
			
		} catch (Exception e) {
			System.out.print(e);
		}
	}

}
