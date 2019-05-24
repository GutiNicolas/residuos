package negocio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Camion implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private long idCamion;
	private TipoResiduos tResiduos;
	private ContenedorEstado tEstado;
	
	@ManyToOne
	private Zona zona;
	
	@OneToOne
	private Ruta ruta;

	public Camion() {
		super();
		this.idCamion = 0;
		this.tResiduos = null;
		this.tEstado = null;
		this.zona = null;
		this.ruta = null;
	}
	
	public Camion(long idCamion, TipoResiduos tResiduos, ContenedorEstado tEstado, Zona zona, Ruta ruta) {
		super();
		this.idCamion = idCamion;
		this.tResiduos = tResiduos;
		this.tEstado = tEstado;
		this.zona = zona;
		this.ruta = ruta;
	}

	public long getIdCamion() {
		return idCamion;
	}

	public void setIdCamion(long idCamion) {
		this.idCamion = idCamion;
	}

	public TipoResiduos gettResiduos() {
		return tResiduos;
	}

	public void settResiduos(TipoResiduos tResiduos) {
		this.tResiduos = tResiduos;
	}

	public ContenedorEstado gettEstado() {
		return tEstado;
	}

	public void settEstado(ContenedorEstado tEstado) {
		this.tEstado = tEstado;
	}

	public Zona getZona() {
		return zona;
	}

	public void setZona(Zona zona) {
		this.zona = zona;
	}

	public Ruta getRuta() {
		return ruta;
	}

	public void setRuta(Ruta ruta) {
		this.ruta = ruta;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
