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
import negocio.Zona;

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
		List<DtZona> res;
		System.out.println("estoy en el GET de gestor");
		res = icz.obtenerZonas();
		zonas = icz.getZonas(res);
		request.setAttribute("lstZonas", zonas);			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/altaGestor.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("estoy en el servlet alta gestor");
		String adminEmail = (String) request.getSession().getAttribute("usulogueado");
		String nombre= request.getParameter("email");
		String apellido = request.getParameter("pswd");
		String ci = request.getParameter("pwdd");
		System.out.println("ci es -----------------------------------------------> " + ci);
		String idZona = request.getParameter("cat");
		long idZon = Long.parseLong(idZona);
		System.out.println("id zona es -----------------------------------------------> " + idZona);
		boolean exito = cur.altaGestor(ci, nombre, apellido, adminEmail);
		System.out.println("exito:"+exito);
		RequestDispatcher rl;
		if (exito) { 
			System.out.println("antes de persistir la zona ");
			boolean exitoZona = cur.altaZonaGestor(idZon, null, ci);
			System.out.println("exito:"+exitoZona);
			if (exitoZona) {
				rl = request.getRequestDispatcher("/index.jsp");
				rl.forward(request, response);
			} else {
				rl = request.getRequestDispatcher("/altaGestor.jsp");
				rl.forward(request, response);
			}
		} else {
			rl = request.getRequestDispatcher("/altaGestor.jsp");
			rl.forward(request, response);
		}
	}

}
