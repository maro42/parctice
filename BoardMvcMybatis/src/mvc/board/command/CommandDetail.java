package mvc.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import mvc.board.model.BoardDao;
import mvc.board.model.Board;
import mvc.board.model.BoardException;

public class CommandDetail implements Command 
{
	private String next;

	public CommandDetail( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request ) throws CommandException{
		try{
			String bId = request.getParameter("bId");
			
			int article_id = 0;
			if( bId != null ) article_id = Integer.parseInt(bId);
			BoardDao dao = BoardDao.getInstance();
			Board rec = dao.selectById(article_id);		
			dao.increaseReadCount(bId);
			
			request.setAttribute("detail", rec);
		    

		}catch( BoardException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
