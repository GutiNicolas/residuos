package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CContenedoresyZonasRemote;
import negocio.ContenedorEstado;

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
		String retorno = "no_modificado";
		String estado = request.getParameter("estado");
		System.out.println("Llegó el estado: " + estado);
		int id = Integer.parseInt(request.getParameter("idcont"));
		System.out.println("Voy a actualizar el estado del contendor: " + id);
		ContenedorEstado  cestado = ContenedorEstado.disponible;
		switch (estado) {
		case "0": 
			cestado = ContenedorEstado.lleno;
			System.out.println("Entre al case 0");
			System.out.println("Y el cestado es: " + cestado);
			break;
		case "1":
			cestado = ContenedorEstado.roto;
			System.out.println("Entre al case 1");
			System.out.println("Y el cestado es: " + cestado);
			break;
		}
		try {
			retorno = con.modEstadoContenedor(id, cestado);
			System.out.println("El retorno es: >>>>>" + retorno);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("retorno", retorno);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		
		/*
		 * SETEAR EL RETORNO EN EL index.jsp PARA MOSTRAR MENSAJE
		 * 
		 * */
		
	}

}
