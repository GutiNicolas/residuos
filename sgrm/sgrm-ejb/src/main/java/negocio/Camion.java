package negocio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Camion implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idCamion;
	private String matricula;
	
	
	@ManyToOne
	private Zona zona;
	
//	@OneToOne
//	private Ruta ruta;

	public Camion() {
		super();
	}
	
	public Camion(int idCamion, String matricula) {
		super();
		this.idCamion = idCamion;
		this.matricula = matricula;
	}
	
	public Camion(String matricula) {
		super();
		this.matricula = matricula;
	}

	public int getIdCamion() {
		return idCamion;
	}

	public void setIdCamion(int idCamion) {
		this.idCamion = idCamion;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	
	public Zona getZona() {
		return zona;
	}

	public void setZona(Zona zona) {
		this.zona = zona;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
