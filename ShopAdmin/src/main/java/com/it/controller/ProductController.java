package com.it.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.ProductVO;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/")
public class ProductController {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public String list(HttpSession session, Model model) { 
		//log.info(service.getList());
		//model.addAttribute("list", service.getList()); 
		String a_id = (String)session.getAttribute("a_id");
		if(a_id != null) {
			model.addAttribute("list", service.getList());
			return "/product/list";
		} else {
			return "redirect: /admin/login";
		}  
	}
	
	@GetMapping("/insert")
	public String insert(HttpSession session) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
		return "/product/insert";
		}
	}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, ProductVO product) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect: /admin/login";
		} else {
			//log.info(product);
			service.insert(product);
			return "redirect:/product/list";
		}
	}
	
	@GetMapping("/view")
	public void view(ProductVO product, Model model) {
		log.info("-----읽기전-----");
		log.info(product);
		//list.jsp에서 Get방식으로 코드만 넘긴 걸 product가방에 담아서 read 
		product = service.read(product);
		
		log.info("-----읽은후-----");
		log.info(product);
		//product가방에 있는 데이터(코드)를 "product"변수에 넣어서 view.jsp로 전달
		model.addAttribute("product", product);
	}
	
	@GetMapping("/imgupload")
	public void imgupload(ProductVO product, Model model) {
		//view.jsp ImgWinOpen함수에서 get방식으로 넘긴 p_code를 product가방에 담고
		//product로 넘어온 p_code를 log또는 web browser에서 확인하자
		log.info(product);
		
		//model객체에 p_code를 담아서 imgupload.jsp 상품코드 value에 display될수 있도록 저달
		//코드만 필요하니까 product.getP_code 
		//나머지는 다 null이니까 imgupload.jsp로 가방전체를 넘길 필요가 없다 
		model.addAttribute("p_code", product.getP_code()); 
	}
	
	@PostMapping ("/imgupload")
	public void imgupload(HttpServletRequest request) {
		DiskFileUpload upload = new DiskFileUpload(); // 모든데이터(파일포함)전송컴포넌트객체 생성
		try {
			List items = upload.parseRequest(request); //웹브라우저 전송 객체 생성해서 업로드컴포넌트에 전달
			Iterator params = items.iterator() ; // 반복자 생성 
			//forEach를 쓰면 데이터가 없으면 넘길게 없는 경우는 null로 표시되니까 
			//Iterator는 존재하는거 다 받아내고 있으면 저장하고 없으면 저장하지 않고 그래서 
			//log.info(items.size()); // 파일을 선택하지 않아도 두개가 찍힌다. 상품코드 & 파일하나
			
			//파일 저장위치전
			String imgpath = "C:\\myWorkSpace\\learnJsp\\ShopAdmin\\src\\main\\webapp\\resources\\product";
			
			String p_code = ""; //item에 담겨있는 p_code를 else에서 p_code가 필요로하니까 전역변수로 
			//어떤순서로 넘어와도 처리할수 있도록 while루프
			
			while (params.hasNext()) { //form 객체가 있을 경우  .hasNest() 데이터 있다 없다 
				FileItem item = (FileItem)params.next(); //폼 형식 객체를 변수에 저장 .next() 반환
				
				if (item.isFormField()) { //파일형식이 아니라면 
					//log.info("상품코드");
					//String data = item.getString();
					//log.info(data);
					p_code = item.getString(); //파일보다 먼저 반환됨
				} else { //바이너리 파일이라면 
					log.info("이미지파일");
					//String data = item.getName();
					//log.info(data);
					File imgfile = new File(imgpath + "/" + p_code + ".jpg"); //파일객체 생성 (.jpg 파일만)
					item.write(imgfile); //해당 경로에 파일 저장
				}
			}
		} catch (Exception e) {
			System.out.print(e);
		}
	}
	
//	/*
//	 * @GetMapping("/delete") public String delete(ProductVO product) {
//	 * log.info("-----상품삭제-----"); service.delete(product); return
//	 * "redirect:/product/list"; }
//	 */
}
