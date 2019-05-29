package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
public class Contenedor  implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private long idContenedor;
	
	private TipoResiduos tResiduos;
	
	private ContenedorEstado cEstado;
	
	@ManyToMany
	private List<Final> finales = new ArrayList<>();
	
	@ManyToOne
	private Zona zona;
	
	public Contenedor() {
		super();
		this.idContenedor = 0;
		this.tResiduos = null;
		this.cEstado = null;
		this.finales = null;
		this.zona = null;
	}

	public Contenedor(long idContenedor, TipoResiduos tResiduos, ContenedorEstado cEstado, List<Final> finales,
			Zona zona) {
		super();
		this.idContenedor = idContenedor;
		this.tResiduos = tResiduos;
		this.cEstado = cEstado;
		this.finales = finales;
		this.zona = zona;
	}

	public long getIdContenedor() {
		return idContenedor;
	}

	public void setIdContenedor(long idContenedor) {
		this.idContenedor = idContenedor;
	}

	public TipoResiduos gettResiduos() {
		return tResiduos;
	}

	public void settResiduos(TipoResiduos tResiduos) {
		this.tResiduos = tResiduos;
	}

	public ContenedorEstado getcEstado() {
		return cEstado;
	}

	public void setcEstado(ContenedorEstado cEstado) {
		this.cEstado = cEstado;
	}

	public List<Final> getFinales() {
		return finales;
	}

	public void setFinales(List<Final> finales) {
		this.finales = finales;
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
