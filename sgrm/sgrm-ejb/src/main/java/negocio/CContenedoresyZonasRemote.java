package negocio;

import javax.ejb.Remote;

@Remote
public interface CContenedoresyZonasRemote {
	
	public boolean existeContenedor(int id);
	
	public String modEstadoContenedor(int id, ContenedorEstado cEstado);

}
