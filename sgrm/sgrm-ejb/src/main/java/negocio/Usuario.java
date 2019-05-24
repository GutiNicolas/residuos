package negocio;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;


@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Usuario implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    @Id  
    @Column
    private String mail;
    
    @Column
    private String password;
    
    @Column
    private String nombre;
    
    @Column
    private String apellido;

    

	
	public Usuario(String mail, String password, String nombre, String apellido) {
		super();
		this.mail = mail;
		this.password = password;
		this.nombre = nombre;
		this.apellido = apellido;
	}


	public Usuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    

}
