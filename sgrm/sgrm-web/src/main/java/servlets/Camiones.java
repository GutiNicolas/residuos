package servlets;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtZona;
import negocio.CContenedoresyZonasLocal;


/**
 * Servlet implementation class Camiones
 */
//@WebServlet("/Camiones")
@WebServlet ("/Camiones")
public class Camiones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	CContenedoresyZonasLocal icz;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Camiones() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<DtZona> zonas;
		System.out.println("estoy en el GET de camiones");
		zonas = icz.obtenerZonas();
		request.setAttribute("lstZonas", zonas);			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/registroCamion.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		//viene del formulario registroCamion.jsp
		System.out.println("Estoy en el post de Camiones");
		String id = request.getParameter("idZona");
		String mat = request.getParameter("mat");
		long idZona = Long.parseLong(id);
		System.out.println("llamo altaCamion ");
		icz.altaCamion(mat, idZona);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		
	}

}
