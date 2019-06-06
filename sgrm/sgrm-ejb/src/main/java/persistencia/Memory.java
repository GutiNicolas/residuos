package persistencia;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
//import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import javax.persistence.Query;
import javax.persistence.criteria.Root;


import negocio.Administrador;
import negocio.Contenedor;
import negocio.Camion;
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
	
//	@PersistenceContext(unitName= "sgrm-pu")
//	private EntityManager manager;
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("sgrm-pu");
//	EntityManager manager = emf.createEntityManager();
	@PersistenceContext(unitName= "sgrm-pu")
	private EntityManager mng;
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("sgrm-pu");
	EntityManager manager = emf.createEntityManager();
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
	
	@Override
	public Usuario findUsuario(String mail) {
		System.out.println("el mail por el que busco es:" +mail);
		Usuario usu = manager.find(Usuario.class, mail);
		return usu;
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
			usu = usuFinal;
			//manager.persist(usu);	
		//	manager = emf.createEntityManager();
	//		manager = emf.createEntityManager();
			manager.getTransaction().begin();
			usu = manager.merge(usu);
			manager.getTransaction().commit();	
			System.out.println("usuario registrado");
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
	public boolean altaZonaGestor(long idZona, ZonaEstado zEstado, String mail) {
		boolean res = false;
		Gestor usuGestor = manager.find(Gestor.class, mail);
		Zona zonaGestor = new Zona(idZona, zEstado, usuGestor);
		manager.persist(zonaGestor);
		if (manager.find(Zona.class, idZona) != null) {
			res = true;
		}
		return res;
	}
	
	public boolean modificarEstadoContenedor(Contenedor cont) {
		try {
			mng.merge(cont);
			return true;
		}catch (Exception e) {
			System.out.println("Error Modificando el estado: " + e);
			return false;
		}
	}
	
	@Override
	public Contenedor findContenedor(long id) {
		
		Contenedor cont = manager.find(Contenedor.class, id);
		
		return cont;
	}
	@Override
	public void altaCamion(Camion camion) {
		// TODO Auto-generated method stub
		manager.getTransaction().begin();
		
		
		manager.persist(camion);
		
		manager.getTransaction().commit();	
		Camion c2 = manager.find(Camion.class, camion.getIdCamion());
		if (c2 != null) {
			System.out.println("persistio bien el camion " + c2.getIdCamion());;
		}else {
			System.out.println("no persistio nada");
		}
	}
	@Override
	public Zona buscarZona(long idZona){
		Zona zona = manager.find(Zona.class, idZona);
		return zona;
	}
	
	@Override
	public void editZona(Zona zona) {
		manager.getTransaction().begin();
		manager.merge(zona);
		manager.getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Zona> getAllZonas() {
		System.out.println("obteniendo las zonas de la base");
//		long idd = 1;
//		Zona zz = manager.find(Zona.class, idd);
		
//		System.out.println("la zona obtenida es: "+ zz.getIdZona());
		
		
		//String hql = "Select z.idZona, z.zEstado, z.gestor FROM Zona z";
		String hql = "SELECT z FROM Zona z";
		
		
		//String hql = "FROM Zona";
		System.out.println("creada el texto de la consulta: " + hql);
		
		Query query = manager.createQuery(hql, Zona.class);
		//Query query = manager.createQuery(hql);
		System.out.println("creada la query ");
		
//		javax.persistence.criteria.CriteriaQuery cq = mng.getCriteriaBuilder().createQuery();
//        Root<Zona> root = cq.from(Zona.class);
//        cq.select(root);
//        List<Zona> zonas =  mng.createQuery(cq).getResultList();
        
		
		List<Zona> zonas = (List<Zona>) query.getResultList();
		System.out.println("Casteado a zonas");
		//manager.createQuery("Select z.Id, z.zestado, z.gestor_nombre FROM Zona z", Zona.class).getResultList();
		System.out.println("obtube las zonas y el tamaño del array es "+ zonas.size());
		System.out.println("listo las zonas: ");
		for(Zona z : zonas) {
			System.out.println("zona: "+ z.getIdZona());
		}
		
		
		return zonas;
	}

	@Override
	public void editCamion(Camion camion) {
		// TODO Auto-generated method stub
		manager.getTransaction().begin();
		manager.merge(camion);
		manager.getTransaction().commit();
		if (manager.find(Camion.class, camion.getIdCamion()) != null) {
			System.out.println("edito bien el camion "+ camion.getIdCamion());;
		}else {
			System.out.println("no edito nada");
		}
		
	}

//	public ArrayList<Zona> getZonas() {
//		return (ArrayList<Zona>) manager.createNamedQuery("Zona.findAll").getResultList();
//	}
	
	



}
