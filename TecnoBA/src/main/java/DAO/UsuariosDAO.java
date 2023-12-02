package DAO;


import java.sql.*;
import java.util.ArrayList;

import Entidad.Articulos;
import Entidad.Usuarios;
import Utilidades.ConexionDB;

public class UsuariosDAO {
	
	
	public void insertar(Usuarios usuario) {

		try {
			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("INSERT INTO usuarios (usuarios_id,user,pass,fotoPerfil) VALUES (?,?,?,?)");
			psta.setInt(1, usuario.getidUsuario());
			psta.setString(2, usuario.getUsuario());
			psta.setString(3, usuario.getPassword());
			psta.setString(4, usuario.getFotoPerfil());
	
		
			psta.executeUpdate();

			psta.close();
			cnx.close();
		} catch (Exception e) {
		}

	}
	
	public ArrayList<Usuarios> listarUsuario() {

		ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("select * from usuarios");
			ResultSet rs = psta.executeQuery();
			while (rs.next()) {
				Usuarios em = new Usuarios(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4));
				lista.add(em);
			}

			psta.close();
			cnx.close();
		} catch (Exception e) {

			System.out.println("" + e.toString());
		}

		return lista;
	}
	
	public void eliminar(Usuarios usuario) {

		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx.prepareStatement("delete from usuarios where usuarios_id=?");
			psta.setInt(1, usuario.getidUsuario());
			psta.executeUpdate();
			psta.close();
			cnx.close();

		} catch (Exception e) {
		}

	}
	
	
	public void actualizarUsuario(Usuarios usuario) {

		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("UPDATE usuarios SET user =?,pass=?,fotoPerfil=? where usuarios_id =?");
			
			psta.setString(1, usuario.getUsuario());
			psta.setString(2, usuario.getPassword());
		    psta.setString(3, usuario.getFotoPerfil());
			psta.setInt(4, usuario.getidUsuario());
			
			
			psta.executeUpdate();

			psta.close();
			cnx.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}
	
	public Usuarios buscarUsuario(int codigo) {

		Usuarios bean = null;
		try {

			Connection cnx = ConexionDB.getConexion();
			PreparedStatement psta = cnx
					.prepareStatement("select * from usuarios where usuarios_id='"+ codigo + "'");
			ResultSet rs = psta.executeQuery();
			while (rs.next()) {
				bean = new Usuarios(rs.getInt(1), rs.getString(2),
						rs.getString(3),rs.getString(4));
			}
			rs.close();
			psta.close();
			cnx.close();
		} catch (Exception e) {

			System.out.println("" + e.toString());
		}

		return bean;
	}
	
	
}

