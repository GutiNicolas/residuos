package persistencia;

import javax.ejb.Remote;

import negocio.Final;
import negocio.Usuario;

@Remote
public interface MemoryRemote {
	public abstract Usuario encontrarUsuario(String mail);
	public abstract boolean registrarUsuarioFinal(Final usuFinal);
//	public abstract boolean altaUsuario(String mail, String pass, String nombre, String apellido, boolean isGestor);
}
