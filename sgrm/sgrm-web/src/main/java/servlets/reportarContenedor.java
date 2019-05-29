package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CContenedoresyZonasRemote;

/**
 * Servlet implementation class reportarContenedor
 */
@WebServlet(description = "Se encarga de la operacion reportar Contenedor para los Usuarios", urlPatterns = { "/reportarContenedor" })
public class reportarContenedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	@EJB
	CContenedoresyZonasRemote con;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportarContenedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id= Integer.parseInt(request.getParameter("id"));
		if(true) { //con.existeContenedor(id)
			request.setAttribute("idareportar", id);
			request.getRequestDispatcher("/reportarContenedor.jsp").forward(request, response);
		} else {
			//Que lo mande a algun error o algo
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
