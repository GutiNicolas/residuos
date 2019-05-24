package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Gestor extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy = "gestor")
	private List<Zona> zona = new ArrayList<>();
	
	@ManyToOne
	private Administrador administrador;

	public Gestor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Gestor(String mail, String password, String nombre, String apellido, List<Zona> zona,
			Administrador administrador) {
		super(mail, password, nombre, apellido);
		this.zona = zona;
		this.administrador = administrador;
	}

}
