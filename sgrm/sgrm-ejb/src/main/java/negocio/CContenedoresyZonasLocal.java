package negocio;

import java.util.List;

import javax.ejb.Local;

import datatypes.DtZona;

@Local
public interface CContenedoresyZonasLocal {

	public List<DtZona> obtenerZonas();

	public String altaCamion(String matricula, long idZona);

}
