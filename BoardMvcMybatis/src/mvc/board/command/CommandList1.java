package mvc.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
 
import mvc.board.model.Board;
import mvc.board.model.BoardException;

public class CommandList1 implements Command 
{
	private String next;

	public CommandList1( String _next ){
		next = _next;
	}
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수

	public String execute( HttpServletRequest request ) throws CommandException{
		try{
//			String pageNo = request.getParameter("pageNo");
//			
//		    totalRecCount = mvc.board.model.BoardDao.getInstance().getTotalCount();
//		    
//		    //페이지 수 구하기
//		    pageTotalCount = totalRecCount/countPerPage;
//		    if(totalRecCount%countPerPage!=0){
//		    	pageTotalCount++;
//		    }
//		    request.setAttribute("pageTotalCount", pageTotalCount);
		    
			
//		    //페이지 당 출력할 레코드
//		    int pageNum=1;
//		    if(pageNo != null)
//		    	pageNum = Integer.parseInt(pageNo);
//		    
//		    int endRow = pageNum * countPerPage;
//		    int startRow = endRow-(countPerPage-1);
		    
		    List <Board> mList = mvc.board.model.BoardDao.getInstance().selectList(1, 13);	
		    request.setAttribute("param", mList );
		    

		}catch( BoardException ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
