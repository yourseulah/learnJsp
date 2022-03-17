<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   <c:forEach items="${list}" var="product"> 
                   <!-- Controller에서 넘어온 넘어온 list배열로부터 product변수에 각각 저장하고 forEach 반복구문으로 뽑아온다 -->
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="http://localhost:8081/resources/product/${product.p_code}.jpg" 
                             height="300" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product.p_name}</h5>
                                    <!-- Product price-->
                                    <fmt:formatNumber value="${product.p_price}"/>
                                </div>
                            </div>
                            
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                <form method="post" action="/shop/cart">
                                	<input type="hidden" name="p_code" value="${product.p_code}">
                                	<select name="cs_cnt">
                                		<c:forEach var="count" begin="1" end="10" step="1">
                                			<option value="${count}">${count}개</option>
                                		</c:forEach>
                                	</select>
                                		<input type="submit" class="btn btn-outline-dark mt-auto" 
                                		value="Add to cart">
                                </form>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                   </c:forEach>
                
                </div>
            </div>
        </section>

<%@include file="../include/footer.jsp"%>