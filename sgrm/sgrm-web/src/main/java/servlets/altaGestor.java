package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CUsuarioRemote;

/**
 * Servlet implementation class altaGestor
 */
@WebServlet("/servletAltaGestor")
public class altaGestor extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	@EJB
	CUsuarioRemote cur;
	
    public altaGestor() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("estoy en el servlet de login");
		String mail= request.getParameter("email");
		String pass = request.getParameter("pswd");
		String nickAdmin = "admin"; // ToDo: obtener el nickname del administrador logeado para pasarlo por parametro
		boolean exito = cur.altaGestor(mail, pass, nickAdmin);
		System.out.println("exito:"+exito);
		RequestDispatcher rl;
		if (exito) {
			String idZona = "probando"; // ToDo: obtener id zona del mapa 
			String colorZona = "verde"; // ToDo: Obtener color zona del mapa
			boolean exitoZona = cur.altaZonaGestor(idZona, colorZona, mail);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
