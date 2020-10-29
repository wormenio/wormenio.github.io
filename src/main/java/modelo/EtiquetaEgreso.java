package modelo;

import dao.EtiquetaDao;
import entities.EtiquetaEntity;

import java.util.List;
import java.util.Map;

public class EtiquetaEgreso {

	private String nombre;

	public  EtiquetaEgreso( String nombre){
		this.nombre = nombre;
	}

	EtiquetaDao etiquetaDao = new EtiquetaDao();

	public String getNombre(){
		return nombre;
	}

}


