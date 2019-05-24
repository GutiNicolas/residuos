package negocio;

import javax.ejb.Remote;

@Remote
public interface CUsuarioRemote {

	public abstract int login(String mail, String pass);

	public abstract boolean altaUsuario(String mail, String pass, boolean isGestor);

	public abstract boolean registrarse(String mail, String pass, String apellido, String nombre);

}
