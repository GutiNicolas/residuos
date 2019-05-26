package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;

@Entity
public class Final extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@ManyToMany
	private List<Contenedor> contenedores = new ArrayList<>();

	public Final() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Final(String mail, String password, String nombre, String apellido, List<Contenedor> contenedores) {
		super(mail, password, nombre, apellido);
		this.contenedores = contenedores;
	}

	public Final(String mail, String password, String nombre, String apellido) {
		super(mail, password, nombre, apellido);
		this.contenedores = new ArrayList<Contenedor>();
	}

}
