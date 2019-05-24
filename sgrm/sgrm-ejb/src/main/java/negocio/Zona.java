package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Zona implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private long idZona;
	private ZonaEstado zEstado;
	
	@OneToMany(mappedBy = "zona")
	private List<Contenedor> contenedor = new ArrayList<>();
	
	@OneToMany(mappedBy = "zona")
	private List<Camion> camiones = new ArrayList<>();
	
	@ManyToOne
	private Gestor gestor;

	public Zona() {
		super();
		this.idZona = 0;
		this.zEstado = null;
		this.contenedor = null;
		this.camiones = null;
		this.gestor = null;
	}
	
	public Zona(long idZona, ZonaEstado zEstado, List<Contenedor> contenedor, List<Camion> camiones, Gestor gestor) {
		super();
		this.idZona = idZona;
		this.zEstado = zEstado;
		this.contenedor = contenedor;
		this.camiones = camiones;
		this.gestor = gestor;
	}

	public long getIdZona() {
		return idZona;
	}

	public void setIdZona(long idZona) {
		this.idZona = idZona;
	}

	public ZonaEstado getzEstado() {
		return zEstado;
	}

	public void setzEstado(ZonaEstado zEstado) {
		this.zEstado = zEstado;
	}

	public List<Contenedor> getContenedor() {
		return contenedor;
	}

	public void setContenedor(List<Contenedor> contenedor) {
		this.contenedor = contenedor;
	}

	public List<Camion> getCamiones() {
		return camiones;
	}

	public void setCamiones(List<Camion> camiones) {
		this.camiones = camiones;
	}

	public Gestor getGestor() {
		return gestor;
	}

	public void setGestor(Gestor gestor) {
		this.gestor = gestor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
