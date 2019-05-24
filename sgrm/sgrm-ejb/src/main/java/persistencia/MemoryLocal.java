package persistencia;

import javax.ejb.Local;

import negocio.Final;
import negocio.Usuario;

@Local
public interface MemoryLocal {
	public abstract Usuario encontrarUsuario(String mail);
//	public abstract boolean altaUsuario(String mail, String pass, String nombre, String apellido, boolean isGestor);
	public abstract boolean registrarUsuarioFinal(Final usuFinal);
}
