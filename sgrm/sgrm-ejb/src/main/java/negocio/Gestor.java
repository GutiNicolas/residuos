package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Gestor implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idGestor;
	private String ci;
	private String nombre;
	private String apellido;	
	
	@OneToMany(mappedBy = "gestor")
	private List<Zona> zona = new ArrayList<>();
	
	@ManyToOne
	private Administrador administrador;

	public Gestor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Gestor(String ci, String nombre, String apellido, Administrador administrador) {
		super();
		this.ci = ci;
		this.nombre = nombre;
		this.apellido = apellido;
		this.administrador = administrador;
	}

	public Gestor(String ci, String nombre, String apellido, List<Zona> zona, Administrador administrador) {
		super();
		this.ci = ci;
		this.nombre = nombre;
		this.apellido = apellido;
		this.zona = zona;
		this.administrador = administrador;
	}

	public String getCi() {
		return ci;
	}
	
	public void setCi(String ci) {
		this.ci = ci;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public List<Zona> getZona() {
		return zona;
	}

	public void setZona(List<Zona> zona) {
		this.zona = zona;
	}

	public Administrador getAdministrador() {
		return administrador;
	}

	public void setAdministrador(Administrador administrador) {
		this.administrador = administrador;
	}
}
