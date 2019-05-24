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


@WebServlet("/servletRegistrarse")
public class sRegistrarse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	CUsuarioRemote cur;
	
    public sRegistrarse() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("estoy en el servlet de registro");
		String mail= request.getParameter("email");
		System.out.println("Mail: "+mail);
		String pass = request.getParameter("pass");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		boolean resultado = cur.registrarse(mail, pass, nombre, apellido);
		RequestDispatcher rl;
		if (resultado==true) {
			//Registro el nuevo usuario
			request.setAttribute("codigo", "1");
			int codigo = (int) request.getAttribute("codigo");
			System.out.println("El codigo es:"+codigo);
			request.setAttribute("mensaje", nombre + ", bienvenido!");
			rl = request.getRequestDispatcher("/inicio.html");
		} else {
			//Usuario ya en uso
			request.setAttribute("codigo", "0");
			request.setAttribute("mensaje", mail + ", ya se encuentra registrado!");
			rl = request.getRequestDispatcher("/login.jsp");
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
