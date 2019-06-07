package negocio;


import java.util.List;

import java.util.ArrayList;

import javax.ejb.Local;

import datatypes.DtZona;

@Local
public interface CContenedoresyZonasLocal {


	public List<DtZona> obtenerZonas();

	public String altaCamion(String matricula, long idZona);


//	public ArrayList<Zona> getZonas();

}
