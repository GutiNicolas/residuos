package persistencia;

import javax.ejb.Local;

import negocio.Contenedor;
import negocio.Final;
import negocio.Usuario;
import negocio.ZonaEstado;

@Local
public interface MemoryLocal {
	public abstract Usuario encontrarUsuario(String mail);
//	public abstract boolean altaUsuario(String mail, String pass, String nombre, String apellido, boolean isGestor);
	public abstract boolean registrarUsuarioFinal(Final usuFinal);
	public abstract boolean altaGestor(String nombre, String apellido, String nickAdmin);
	public abstract boolean altaZonaGestor(long idZona, ZonaEstado zEstado, String mail);
	public abstract Usuario findUsuario(String mail);
	public abstract boolean modificarEstadoContenedor(Contenedor cont);
	public Contenedor findContenedor(long id);
}
