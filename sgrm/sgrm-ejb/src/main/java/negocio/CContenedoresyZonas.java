package negocio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import datatypes.DtZona;
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

	@Override
    	public List<DtZona> obtenerZonas(){
    	List<Zona> zonas = mem.getAllZonas();
    	List <DtZona> dtzonas= new ArrayList<DtZona>();
		for (Zona z: zonas) {
			DtZona dtz = z.obtenerDtZona();
			dtzonas.add(dtz);
		}
		return dtzonas;
   	}

    	@Override
    	public String altaCamion(String matricula, long idZona) {
    	System.out.println("estoy en alta camion");
		Camion camion = new Camion(matricula);
		System.out.println("creo la instancia del camion");
		Zona zona = mem.buscarZona(idZona);
		System.out.println("obtube la zona "+ zona.getIdZona());
		
		System.out.println("agregue el camion a la cuadrilla y llamo a la persistencia");
		mem.altaCamion(camion);
		//zona.agregarACuadrilla(camion);
		camion.setZona(zona);
		
//		mem.editZona(zona);
		mem.editCamion(camion);
		System.out.println("agregado a la base");
    	return "Se agrego el camion " + camion.getIdCamion() +" a la cuadrilla de la zona "+ zona.getIdZona();
    	
    	}
//	@Override
//	public ArrayList<Zona> getZonas() {
//		// TODO Auto-generated method stub
//		return mem.getZonas();
//	}

}
