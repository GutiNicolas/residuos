package negocio;

import javax.ejb.Remote;

@Remote
public interface CUsuarioRemote {

	public abstract int login(String mail, String pass);

	public abstract boolean altaUsuario(String mail, String pass, boolean isGestor);

	public abstract boolean registrarse(String mail, String pass, String apellido, String nombre);

	public abstract boolean altaGestor(String nombre, String apellido, String nickAdmin);

	public abstract boolean altaZonaGestor(String idZona, String colorZona, String mail);

}
