package negocio;

import java.util.HashMap;
import java.util.Map;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;



/**
 * Session Bean implementation class CContenedoresyZonas
 * CONTROLADOR PARA ZONA CONTENEDORES Y GESTORES
 */
@Stateless
@LocalBean
public class CContenedoresyZonas implements CContenedoresyZonasRemote, CContenedoresyZonasLocal {

	
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

}
