package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Administrador extends Usuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy = "administrador")
	private List<Gestor> gestores = new ArrayList<>();
	
	public Administrador() {
		super();
		this.gestores = null;
	}

	public Administrador(String mail, String password, String nombre, String apellido, List<Gestor> gestor) {
		super(mail, password, nombre, apellido);
		this.gestores = gestor;
	}

	public List<Gestor> getGestor() {
		return gestores;
	}

	public void setGestor(List<Gestor> gestor) {
		this.gestores = gestor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
