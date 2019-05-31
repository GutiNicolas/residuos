package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import datatypes.DtZona;

@Entity
public class Zona implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private long idZona;
	private ZonaEstado zEstado;
	
	@OneToMany(mappedBy = "zona")
	private List<Contenedor> contenedor = new ArrayList<>();
	
	@OneToMany(mappedBy = "zona")
	private List<Camion> cuadrilla;
		
	@ManyToOne
	private Gestor gestor;

	public Zona() {
		super();
		this.zEstado = null;
		this.contenedor = null;
		this.cuadrilla = new ArrayList<>();
		this.gestor = null;
	}
	
	public Zona(long idZona, ZonaEstado zEstado, List<Contenedor> contenedor, List<Camion> cuadrilla, Gestor gestor) {
		super();
		this.idZona = idZona;
		this.zEstado = zEstado;
		this.contenedor = contenedor;
		this.cuadrilla = cuadrilla;
		this.gestor = gestor;
	}
	
	public Zona(long idZona2, ZonaEstado zEstado2, Gestor gestor) {
		this.idZona = idZona2;
		this.zEstado = zEstado2;
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

	public List<Camion> getCuadrilla() {
		return cuadrilla;
	}

	public void setCamiones(List<Camion> camiones) {
		this.cuadrilla = camiones;
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

	public DtZona obtenerDtZona() {
		// TODO Auto-generated method stub
		DtZona dtz = new DtZona(this.idZona, this.zEstado);
		return dtz;
	}
	
	public boolean agregarACuadrilla(Camion camion) {
		this.cuadrilla.add(camion);
		
		return true;
		
	}
}
