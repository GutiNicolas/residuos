package negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Administrador implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	private String nickname;
	private String password;
	
	@OneToMany(mappedBy = "administrador")
	private List<Gestor> gestores = new ArrayList<>();
	
	public Administrador() {
		super();
		this.nickname = null;
		this.password = null;
		this.gestores = null;
	}

	public Administrador(String nickname, String password, List<Gestor> gestor) {
		super();
		this.nickname = nickname;
		this.password = password;
		this.gestores = gestor;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
