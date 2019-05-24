package negocio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Ruta implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private long idRuta;
	
	@OneToOne
	private Camion camion;
	
	public Ruta() {
		super();
		this.idRuta = 0;
		this.camion = null;
	}

	public Ruta(long idRuta, Camion camion) {
		super();
		this.idRuta = idRuta;
		this.camion = camion;
	}

	public long getIdRuta() {
		return idRuta;
	}

	public void setIdRuta(long idRuta) {
		this.idRuta = idRuta;
	}

	public Camion getCamion() {
		return camion;
	}

	public void setCamion(Camion camion) {
		this.camion = camion;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
