package datatypes;

import java.io.Serializable;

import negocio.ZonaEstado;

public class DtZona implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long id;
		
	private ZonaEstado estado;

	public DtZona(long id, ZonaEstado estado) {
		super();
		this.id = id;
		this.estado = estado;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public ZonaEstado getEstado() {
		return estado;
	}

	public void setEstado(ZonaEstado estado) {
		this.estado = estado;
	}
	
	
}
