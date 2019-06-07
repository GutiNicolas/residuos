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
 * Servlet implementation class login
 */
//@WebServlet("/servletLogin")
@WebServlet ("/servletLogin")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	CUsuarioRemote cur;
	
    public login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("estoy en el servlet de login");
		String mail= request.getParameter("email");
		System.out.println("mail ingresado: "+mail);
		
		String pass = request.getParameter("pass");
		int exito = cur.login(mail, pass);
		System.out.println("exito:"+exito);
		RequestDispatcher rl;
		if (exito == 11) {
			request.getSession().setAttribute("usulogueado", mail);
			request.getSession().setAttribute("rol", "final");
			rl = request.getRequestDispatcher("/index.jsp");
			rl.forward(request, response);
			
		} 
		if (exito == 10) {
			rl = request.getRequestDispatcher("/inicio.jsp");
			request.getSession().setAttribute("usulogueado", mail);
			request.getSession().setAttribute("rol", "admin");
			rl = request.getRequestDispatcher("/index.jsp");
//			rl = request.getRequestDispatcher("/registrarcontenedor.html");
			rl.forward(request, response);
			
		} 
		if (exito == 0) {
			request.setAttribute("codigo", "67");
			request.setAttribute("mensaje", mail + ", no está registrado!");
			rl = request.getRequestDispatcher("/registrarse.jsp");
			rl.forward(request, response);
		}
		if (exito == 2) {
			request.setAttribute("codigo", "2");
			request.setAttribute("mensaje","Contraseña incorrecta!");
			rl = request.getRequestDispatcher("/login.jsp");
			rl.forward(request, response);
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
