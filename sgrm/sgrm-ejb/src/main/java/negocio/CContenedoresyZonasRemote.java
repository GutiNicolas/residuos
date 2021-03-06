package negocio;

import java.util.List;

import javax.ejb.Remote;

import datatypes.DtZona;

@Remote
public interface CContenedoresyZonasRemote {
	
	public boolean existeContenedor(int id);
	
	public String modEstadoContenedor(int id, ContenedorEstado cEstado);
	public List<DtZona> obtenerZonas();

	public String altaCamion(String matricula, long idZona);

}
