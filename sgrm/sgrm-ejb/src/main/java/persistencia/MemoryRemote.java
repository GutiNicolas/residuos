package persistencia;

import java.util.List;

import javax.ejb.Remote;

import negocio.Camion;
import negocio.Final;
import negocio.Usuario;
import negocio.Zona;

@Remote
public interface MemoryRemote {
	public abstract Usuario encontrarUsuario(String mail);
	public abstract boolean registrarUsuarioFinal(Final usuFinal);
//	public abstract boolean altaUsuario(String mail, String pass, String nombre, String apellido, boolean isGestor);
	public abstract Usuario findUsuario(String mail);
	public void altaCamion(Camion camion);
	public abstract Zona buscarZona(long idZona);
	public abstract List<Zona> getAllZonas();
}
