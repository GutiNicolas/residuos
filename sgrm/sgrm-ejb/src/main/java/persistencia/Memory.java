package persistencia;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import negocio.Administrador;
import negocio.Final;
import negocio.Gestor;
import negocio.Usuario;
import negocio.Zona;
import negocio.ZonaEstado;

/**
 * Session Bean implementation class Memory
 */
@Singleton
@Startup
@LocalBean
@TransactionAttribute(TransactionAttributeType.SUPPORTS)
public class Memory implements MemoryRemote, MemoryLocal {
	
	@PersistenceContext(unitName= "sgrm-pu")
	private EntityManager manager;
	private List<Usuario> usuarios;
	private List<Gestor> gestores;
	
	public Memory() {
		// TODO Auto-generated constructor stub
	}

	public void agregarUsuario(Usuario usu) {
		manager.persist(usu);
	}
	
	@Override
	public Usuario encontrarUsuario(String mail) {
		Final usuFinal = (Final) manager.find(Usuario.class, mail);
		if (usuFinal==null) {
			Administrador usuGestor = (Administrador) manager.find(Usuario.class, mail);
			return usuGestor;
		} else {
			return usuFinal;
		}
	}
	
//	@Override
//	public boolean altaUsuario (String mail, String pass, String nombre, String apellido, boolean isGestor) {
//		Usuario usu = encontrarUsuario(mail);
//		if (usu!= null) {
//			return false;
//		} else {
//			if (isGestor) {
//				usuarios.add(new Gestor(mail, pass, nombre, apellido, null, null));
//			} else {
//				usuarios.add(new Final(mail, pass, nombre, apellido));
//			}
//			return true;
//		}
//	}

	@Override
	public boolean registrarUsuarioFinal(Final usuFinal) {
		Usuario usu = manager.find(Usuario.class, usuFinal.getMail());
		if (usu!=null) {
			//el usuario ya existe
			return false;
		} else {
			//registro al usuario
			manager.persist(usuFinal);		
			return true;
		}
	}
	
	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	@Override
	public boolean altaGestor(String nombre, String apellido, String nickAdmin) {
		boolean res = false;
		Administrador admin = manager.find(Administrador.class, nickAdmin);
		Gestor usu = new Gestor(nombre, apellido, admin);
		manager.persist(usu);
		if (manager.find(Gestor.class, nombre) != null) {
			res = true;
		}
		return res;
	}

	@Override
	public boolean altaZonaGestor(String idZona, ZonaEstado zEstado, String mail) {
		boolean res = false;
		Gestor usuGestor = manager.find(Gestor.class, mail);
		Zona zonaGestor = new Zona(idZona, zEstado, usuGestor);
		manager.persist(zonaGestor);
		if (manager.find(Zona.class, idZona) != null) {
			res = true;
		}
		return res;
	}

}
