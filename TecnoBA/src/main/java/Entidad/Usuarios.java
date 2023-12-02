package Entidad;

public class Usuarios {
	
	private int idUsuarios;
    private String usuario;
    private String password;
    private String fotoPerfil;
  

    public Usuarios(){
    	
    }
    public Usuarios(int idUsuarios, String usuario, String password, String fotoPerfil) {
        this.idUsuarios = idUsuarios;
        this.usuario = usuario;
        this.password = password;
        this.fotoPerfil = fotoPerfil;
      
    }

    public int getidUsuario() {
        return idUsuarios;
    }

    public void setidUsuario(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

}
