package mvc.board.command;

import javax.servlet.http.HttpServletRequest;

public interface Command {
	public String execute( HttpServletRequest request ) throws CommandException;
}
