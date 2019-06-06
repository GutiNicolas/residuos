package negocio;

import java.util.HashMap;
import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import persistencia.MemoryLocal;



/**
 * Session Bean implementation class CContenedoresyZonas
 * CONTROLADOR PARA ZONA CONTENEDORES Y GESTORES
 */
@Stateless
@LocalBean
public class CContenedoresyZonas implements CContenedoresyZonasRemote, CContenedoresyZonasLocal {

	@EJB
	MemoryLocal mem;
	
	private Map<Long,Zona> zonas = new HashMap<>();
	private Map<Long,Contenedor> contenedores = new HashMap<>();
    /**
     * Default constructor. 
     */
    public CContenedoresyZonas() {
        // TODO Auto-generated constructor stub
    }
	@Override
	public boolean existeContenedor(int id) {
		long clave= id;
		if(this.contenedores.containsKey(clave))
			return true;
		else
			return false;
	}
	
	@Override
	public String modEstadoContenedor(int id, ContenedorEstado cEstado) {
		String res;
		long clave = id;
		Contenedor cont = mem.findContenedor(clave);
		ContenedorEstado cestado = cEstado;
		System.out.println("Estoy dentro de modEstadoContenedor y cestado es: " + cestado);
		cont.setcEstado(cestado);
		System.out.println("Pase el setter");
		System.out.println("Luego de setear el estado del contenedor: " + cont.getcEstado());
		if(mem.modificarEstadoContenedor(cont)) {
			res = "modificado";
		}else {
			res = "no_modificado";
		}
		return res;
	}

}
