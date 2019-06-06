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
import negocio.CUsuarioRemote;

/**
 * Servlet implementation class altaGestor
 */
@WebServlet("/servletAltaGestor")
public class altaGestor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	CContenedoresyZonasLocal icz;
	
	@EJB
	CUsuarioRemote cur;
	
    public altaGestor() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		List<DtZona> zonas;
		System.out.println("estoy en el GET de zonas");
//		zonas = icz.obtenerZonas();
		zonas = null;
		request.setAttribute("lstZonas", zonas);			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/registroCamion.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("estoy en el servlet de login");
		String nombre= request.getParameter("email");
		String apellido = request.getParameter("pswd");
		String ci = request.getParameter("pwdd");
		String nickAdmin = "admin"; // ToDo: obtener el nickname del administrador logeado para pasarlo por parametro
		boolean exito = cur.altaGestor(ci, nombre, apellido, nickAdmin);
		System.out.println("exito:"+exito);
		RequestDispatcher rl;
		if (exito) {
			long idZona = 1; // ToDo: obtener id zona del mapa 
			String colorZona = "verde"; // ToDo: Obtener color zona del mapa
			boolean exitoZona = cur.altaZonaGestor(idZona, colorZona, ci);
			if (exitoZona) {
				rl = request.getRequestDispatcher("/inicio.html");
			} else {
				rl = request.getRequestDispatcher("/altaGestor.html");
			}
		} else {
			rl = request.getRequestDispatcher("/altaGestor.html");
		}
		rl.forward(request, response);
	}

}
