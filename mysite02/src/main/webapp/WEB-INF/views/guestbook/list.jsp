<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="com.bitacademy.mysite.vo.GuestbookVo"%>
<%@ page import="com.bitacademy.mysite.repository.GuestbookRepository"%>

<%
	request.setCharacterEncoding("utf-8");
	List<GuestbookVo> list = (List<GuestbookVo>) (request.getAttribute("list"));
%>

<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/assets/css/user.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="guestbook">

				<form action="<%=request.getContextPath()%>/guestbook" method="post">
					<input type="hidden" name="a" value="add">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"></td>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>

				<ul>
					<li>
						<%
							int count = list.size();
							int index = 0;
							for (GuestbookVo vo : list) {
						%>
						<table width=510 border=1>
							<tr>
								<td>[<%=count - index++%>]
								</td>
								<td><%=vo.getName()%></td>
								<td><%=vo.getRegDate()%></td>
								<td><a
									href="<%=request.getContextPath()%>/gb?a=deleteform&no=<%=vo.getNo()%>">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4><%=vo.getMessage().replaceAll("\n", "<br/>")%></td>
								<!-- 클라이언트에서 바꾸기! -->
							</tr>
						</table> 
						<%
 							}
						%>
						 <br>
					</li>
				</ul>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/navigation.jsp" />
		<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>