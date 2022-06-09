<%@page import="kr.co.sist.user.vo.UserBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.dao.UserBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head> 
        <!-- /.website title -->
        <title>게시판</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <meta charset="UTF-8" />
        <!-- CSS Files -->
        <link href="/sist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/sist/css/font-awesome.min.css" rel="stylesheet">
        <link href="/sist/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="/sist/css/animate.css" rel="stylesheet" media="screen">
        <link href="/sist/css/owl.theme.css" rel="stylesheet">
        <link href="/sist/css/owl.carousel.css" rel="stylesheet">
        <link href="/sist/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

        <!-- Colors -->
        <!-- <link href="css/css-index-blue.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
        <link href="css/stacktable.css" rel="stylesheet" media="screen">
        <link href="css/css-index-yellow.css" rel="stylesheet" media="screen"> 

        <!-- Google Fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

    </head>
           <script src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#Exhibition").change(function(){
		$("#boardcat").submit();
	});
	$("#searchBtn").click(function(){
		$("#search").submit();
	})
});//ready

</script>
    <body data-spy="scroll" data-target="#navbar-scroll">
        <!-- /.preloader -->
        <div id="preloader"></div>
        <div id="top"></div>


        <!-- /.parallax full screen background image -->
        <div class="fullscreen landing parallax blog-page" style="background-image:url('images/bg-baner.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">

            <div class="overlay">
                <div class="container">
                    <div class="col-md-10 col-md-offset-1 text-center">

                        <!-- /.logo -->
                        <div class="logo wow fadeInDown" style="margin-top: 50px"> 
                            <a href="index.jsp">Exhibition</a>
                        </div>

                       

                    </div>
                </div> 
            </div> 
        </div>
        
        
              <!-- NAVIGATION -->
        <div id="menu">
               <div class="container"> 
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand site-name" href="index.jsp">Exhibition</a>
                    </div>

                    <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
                        <ul class="nav navbar-nav">
                               <li><a href="list.jsp">전체 전시 보기</a></li>
                            <li><a href="loc.jsp">지역별 전시 보기</a></li>
                            <li><a href="reservation.jsp">예약하기</a></li>
                                    <li><a href="board.jsp">게시판</a></li>
                        
                        </ul>
                    </div>
                 </div>  
        </div>

        <!-- /.pricing section -->
        <div id="myaccount">
            <div class="container">
                <div class="text-center ">
                    <!-- /.pricing title -->
                    <h2 class="wow fadeInLeft">게시판</h2>
                    <div class="title-line wow fadeInRight"></div>
                </div>
   <%
   String catNum=request.getParameter("Exhibition");
   if(catNum == null){
   	catNum="5";
   }
   pageContext.setAttribute("catNum", catNum);
   String search=request.getParameter("searchDescription");
   %>
      <div >
      <form class="d-flex" id="search" name="search" action="board.jsp" method="get">
        <input class="btn btn-outline-success" type="button" style="float: right; height: 50px" value="검색" id="searchBtn"/>
        <input type="hidden" name="Exhibition" value="${catNum }"/>
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="float: right; width: 200px" name="searchDescription">
      </form>
</div>
                <div class="row account-details">

                    <!-- /.account-control -->
                    <div class="col-sm-3 account-control padding-b-50 padding-t-50">
                        <div class="panel panel-default sidebar-menu wow  fadeInLeft animated">
                            <div class="panel-heading">
                                <h3 class="panel-title">Menu</h3>
                            </div>
                            <form action="board.jsp" method="get" id="boardcat" name="boardcat">
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                            <%
                                            
                                        
								UserBoardDAO bDAO=UserBoardDAO.getInstance();
								List<BoardrV> catList=bDAO.selectCategory();
								
								pageContext.setAttribute("catList", catList);
								
								%>
                                    <li class="active" >  <select class="form-control input-lg" name="Exhibition" id="Exhibition">
								<c:forEach var="catList" items="${pageScope.catList }">
								<option value="${ catList.cat_num}" ${catList.cat_num eq param.Exhibition?" selected='selected'":""}><c:out value="${catList.cat_name }"/></option>
								</c:forEach>
                                            </select></li>
                                    
                                    
                                </ul>
                            </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-sm-9 account-data padding-b-50 padding-t-50">
                        <div id="tab2" class="box-old-booking box-section animated fadeInUp">
                            <a href="boardWrite.jsp"><input type="button"  class="btn btn-warning btn-block btn-lg" value="글 작성" style="width: 100px; float: right;"></a> <br/><br/>

                            <table  class="table booking-list stacktable large-only">
                                <tbody>
                                    <tr>
                                        <th>번호</th>
                                        <th style="width:350px; text-align: center;">제목</th> 
                                        <th>작성자</th> 
                                        <th>작성일</th> 
                                        <th>댓글 수</th> 
                                        <th>조회
                                        </th> 
                                        
                                        
                                    </tr>
                             <%
                             
                             
                             BoardrVO bVO=new BoardrVO();
                             bVO.setCat_num(Integer.parseInt(catNum));
                             String pageNum=request.getParameter("pageNum");
                             if(pageNum ==null){
                            	 pageNum="1";
                             }
                             if(search != null){
                            bVO.setUserid(search);
                             bVO.setTitle(search);
                             }
                             bVO.setPageNum(Integer.parseInt(pageNum));
								List<BoardrVO> boardList=bDAO.selectBoard(bVO);
								
								pageContext.setAttribute("boardList", boardList);
								%>
							
								<c:forEach var="boardList" items="${pageScope.boardList }">
								
                                    <tr>
                                        <td>${boardList.rownum }</td>
								
                                     <td style="text-align: center;">	<a href="boardDetail.jsp?value=${boardList.bd_id }" > <c:out value="${boardList.title }"/></a></td>
                                        <td><c:out value="${boardList.userid }"/></td>
                                        <td>
                                            <c:out value="${boardList.input_date }"/>
                                        </td>
                                        <td><c:out value="${boardList.recommend }"/></td>
                                        <td><c:out value="${boardList.views }"/></td> 
                                    </tr> 
                                </c:forEach>
                                </tbody>
                            </table>
                            <% 
                            	int total=bDAO.selectTotalBoard(Integer.parseInt(catNum));
                            	int end=total/10;
                            	pageContext.setAttribute("end", end);
                            %>
                            
<div class="text-center">
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a href="board.jsp?pageNum=${1}&Exhibition=${catNum}"><c:out value="${1 }"/></a></li>
  <c:forEach var="i" begin="1" end="${end }" step="1">
    <li class="page-item"><a href="board.jsp?pageNum=${i*10+1}&Exhibition=${catNum}"><c:out value="${i+1 }"/></a></li>
    </c:forEach>
  </ul>
</nav>


                        </div>
                    </div>
                </div>
            </div>
        </div>

 </div>     
        
     <!-- /.footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="">
                        <div class="col-md-4 col-sm-6">
                            <h4>고객 센터</h4>
                            <p><strong>3조</strong>
                                <br>전화 번호 :081) 123-1234  
                                <br>상담 가능 시간: AM 10:00~PM 05:00
                                <br>관련 이메일: exhibition@naver.com
                            </p>
                            <hr class="hidden-md hidden-lg">
                        </div> 

                        
                        <!-- /.col-md-4 -->
                        
                        <div class="col-md-4 col-sm-6">
                            <h4>사업자 등록번호</h4>
                            <div class="newsletter-box">
                                <div class="newsletter">  
                                    <div class="newsletter-content"> 
                                        <p>123-1234-1234</p>
                                    </div> 
                                    
                                    <div class="clear"> </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-md-4 -->

                    </div>
                    </div>
                    </div>
                    </footer>


        

        <!-- /.javascript files -->
 
        <script src="/sist/js/bootstrap.min.js"></script>
        <script src="/sist/js/bootstrap-datetimepicker.min.js"></script>
        <script src="/sist/js/custom.js"></script>
        <script src="/sist/js/jquery.sticky.js"></script>
        <script src="/sist/js/wow.min.js"></script>
        <script src="/sist/js/owl.carousel.min.js"></script> 
            <script src="/sist/js/jquery.validate.min.js"></script> 

        <script>
            new WOW().init();
        </script>
      

    </body>
</html>