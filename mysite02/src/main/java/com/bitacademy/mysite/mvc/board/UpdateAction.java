package com.bitacademy.mysite.mvc.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitacademy.mysite.repository.BoardRepository;
import com.bitacademy.mysite.vo.BoardVo;
import com.bitacademy.mysite.vo.UserVo;
import com.bitacademy.web.mvc.Action;
import com.bitacademy.web.util.WebUtil;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		if (authUser != null) {
			//업데이트용
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			//확인용
			String userName = request.getParameter("name");
			long no = Long.parseLong(request.getParameter("no"));
			
			BoardVo vo = new BoardVo();
			vo.setTitle(title);
			vo.setContents(content);
			vo.setUserName(userName);
			vo.setNo(no);
			
//			new BoardRepository();
			
		}
		WebUtil.redirect(request, response, request.getContextPath() + "/board");
		

	}

}
