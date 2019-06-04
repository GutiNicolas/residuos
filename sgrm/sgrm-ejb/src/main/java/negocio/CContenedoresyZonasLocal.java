package negocio;

import java.util.ArrayList;

import javax.ejb.Local;

@Local
public interface CContenedoresyZonasLocal {
	public ArrayList<Zona> getZonas();
}
