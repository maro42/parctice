package mvc.board.command;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import mvc.board.model.Board;
import mvc.board.model.BoardException;

public class CommandModify implements Command {
	private String next;

	public CommandModify( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		try{
			
			String bId = request.getParameter("bId");
			Board rec = new Board();
			rec.setArticleId(Integer.parseInt(bId));
			rec.setTitle(request.getParameter("title"));
			rec.setContent(request.getParameter("content"));
			rec.setPassword(request.getParameter("password"));
			
			int result = mvc.board.model.BoardDao.getInstance().update(rec);
			request.setAttribute("result", result);
			
		}catch( BoardException ex ){
			throw new CommandException("CommandInput.java < 수정 시> " + ex.toString() ); 
		}
		return next;
	}

}
