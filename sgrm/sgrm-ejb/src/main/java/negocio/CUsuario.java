package negocio;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import persistencia.MemoryLocal;

/**
 * Session Bean implementation class CUsuario
 */
@Stateless
@LocalBean
public class CUsuario implements CUsuarioRemote, CUsuarioLocal {

	@EJB
	MemoryLocal mem;
	
    public CUsuario() {
        // TODO Auto-generated constructor stub
    }

    @Override
    public int login (String mail, String pass){
		/*
			0 no existe el usuario
			1 existe usuario con esa contraseña
				10 es usuario administrador
				11 es usuario final
			2 existe el usuario pero la contraseña es incorrecta
		 */
    	System.out.println("consulto a la base con el mail "+mail);
		Usuario usu = mem.findUsuario(mail);
		if (usu!=null) {
			if (usu.getPassword().equals(pass)) {
				if (usu instanceof Final) {
					return 11;
				} else return 10;
			} else {
				return 2;
			}
		} else {
			return 0;
		}
    }
    
    @Override
    public boolean registrarse (String mail, String pass, String nombre, String apellido) {
    	Final usuFinal = new Final(mail, pass, nombre, apellido);
    	boolean resultado = mem.registrarUsuarioFinal(usuFinal);
    	return resultado;
    }

	@Override
	public boolean altaUsuario(String mail, String pass, boolean isGestor) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
    public boolean altaGestor(String nombre, String apellido, String nickAdmin) {
    	return mem.altaGestor(nombre, apellido, nickAdmin);
    }
    
    @Override
    public boolean altaZonaGestor(long idZona, String colorZona, String mail) {
    	ZonaEstado zEstado = null;
		if (colorZona == "rojo") {
			zEstado = ZonaEstado.rojo;
		} else if (colorZona == "amarillo") {
			zEstado = ZonaEstado.amarillo;
		} else {
			zEstado = ZonaEstado.verde;
		}
    	return mem.altaZonaGestor(idZona, zEstado, mail);
    }
    
    
//    @Override
//    public boolean altaUsuario(String mail, String pass, boolean isGestor) {
//    	return mem.altaUsuario(mail, pass, isGestor);
//    }
}
