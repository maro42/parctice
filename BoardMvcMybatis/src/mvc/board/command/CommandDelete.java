package mvc.board.command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;

public class CommandDelete implements Command {
	private String next;

	public CommandDelete( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request) throws CommandException {
		// TODO Auto-generated method stub
		try{
			// DB delete
			String bId = request.getParameter("bId");
			String password = request.getParameter("password");
			int article_id = 0;
			if( bId!=null ) article_id = Integer.parseInt( bId );
			int result = BoardDao.getInstance().delete(article_id, password);
			
			request.setAttribute("result", result);
			
		}catch( BoardException ex ){
			throw new CommandException("CommandDelete.java < 삭제시 > " + ex.toString() ); 
		}
		
		return next;			
	}

}
