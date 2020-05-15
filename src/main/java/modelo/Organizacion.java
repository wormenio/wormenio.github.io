package modelo;

import java.util.ArrayList;

public class Organizacion {
	TipoOrganizacion tipo;
	ArrayList<Organizacion> entidades = new ArrayList<Organizacion>();
	ArrayList<Operacion> operaciones = new ArrayList<Operacion>();
	
	static ArrayList<Usuario> usuarios= new ArrayList<Usuario>();


	public void registrarse(String usuario , String contrasenia, RolUsuario rol) {
		Usuario nuevoUsuario = new Usuario(usuario,rol);
		if( nuevoUsuario.nombreValido(usuario)  &&  nuevoUsuario.contraseniaValida(contrasenia))
		{
			usuarios.add(nuevoUsuario);
			return;
		}
		
	}
}
