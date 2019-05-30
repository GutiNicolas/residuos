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
	
    public List<DtZona> obtenerZonas(){
    	List<Zona> zonas = mem.getAllZonas();
    	List <DtZona> dtzonas= new ArrayList<DtZona>();
		for (Zona z: zonas) {
			DtZona dtz = z.obtenerDtZona();
			dtzonas.add(dtz);
		}
		return dtzonas;
    }
    
    public String altaCamion(String matricula, long idZona) {
		Camion camion = new Camion(matricula);
		Zona zona = mem.buscarZona(idZona);
		zona.agregarACuadrilla(camion);
		mem.altaCamion(camion);
    	return "Se agrego el camion " + camion.getIdCamion() +" a la cuadrilla de la zona "+ zona.getIdZona();
    	
    }

}
