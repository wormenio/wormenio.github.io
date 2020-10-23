package modelo.Egreso;

import modelo.*;

import java.time.LocalDate;
import java.util.*;

public class CompraConPresupuesto extends Compra {
	/*public CompraConPresupuesto(BuzonMensajes buzon) {
	
	}*/

	private Integer cantidadPresupuestosRequeridos = 2;
	Criterio criterio;
	Set<Presupuesto> presupuestos = new HashSet<>();
	Presupuesto presupuestoAsignado;
	List<Usuario> usuariosHabilitados = new ArrayList<>();
	Boolean compraValidada;
	LocalDate fechaValidacion;

	public CompraConPresupuesto(LocalDate fechaCompra, Proveedor proveedor, Moneda moneda, Entidad entidad,Integer cantidadPresupuestos) {
		super(fechaCompra, proveedor, moneda, entidad);
		this.cantidadPresupuestosRequeridos = cantidadPresupuestos;
	}

	public void setPresupuestoAsignado(Presupuesto presupuesto){
		this.presupuestoAsignado = presupuesto;
	}

	/**
	 * Permite actualizar la cantidad de presupuestos requeridos
	 * @param cantidad
	 */
	public void setCantidadPresupuestosRequeridos(Integer cantidad){
		this.cantidadPresupuestosRequeridos = cantidad;
	}

	public boolean esRevisor(Usuario usuario) {
		 return this.usuariosHabilitados.contains(usuario);
	 }
	 
	public List<Usuario> usuariosHabilitados(){
		return usuariosHabilitados;
	}

	 public void hacerRevisor(Usuario usuario) {
		 this.usuariosHabilitados.add(usuario);
	 }

	 public boolean validarCompra(){		 

		 return this.validarCantidadDePresupuestos()  
				&& this.validarPresupuestoAsignadoContenidoEnElListado() 
				&& this.validarPorCriterioDeMenorValor();
		 
	 }
	 
	 public int getCantidadPresupuestoRequeridos() {
		 return cantidadPresupuestosRequeridos;
	 }

	 public Boolean validarCantidadDePresupuestos() {
		 return this.presupuestos.size() == this.cantidadPresupuestosRequeridos;		 
	 }
	 
	 public boolean validarPresupuestoAsignadoContenidoEnElListado() {
		 return this.presupuestos.contains(this.presupuestoAsignado);		 
	 }
	 
	 public Boolean validarPorCriterioDeMenorValor() {
//		TODO -> tiene un "return false" al final!
		 if(this.criterio == Criterio.MENOR_VALOR) {			
	
			    Presupuesto minPresupuesto = this.presupuestos
			      .stream()
			      .min(Comparator.comparing(Presupuesto::getTotal))
			      .orElseThrow(null);
			 				 
			    return minPresupuesto == this.presupuestoAsignado;
		 }
		 
		 return false;
		 
	 }

	 public Set<Presupuesto> getPresupuestos(){
		return presupuestos;
	 }
	 
	public void agregarPresupuesto(Presupuesto presupuesto)
	 {
		 this.presupuestos.add(presupuesto);
		 
	 }

	 public Boolean seCorrespondeConAlMenosUnPresupuesto(){
//		TODO comparar los items comprados con todos los presupuestos
		return true;
	 }

	 public void setCompraValidada(){
		compraValidada=true;
		fechaValidacion= LocalDate.now();
	 }
         
//        public int getEtiqueta(){
//         return this.etiqueta;
//        }
        
  /*      public int getAnio(){
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(this.fechaCompra);
            return calendar.get(Calendar.YEAR);            
        }
        
        public int getMes(){
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(this.fechaCompra);
            return calendar.get(Calendar.MONTH);
        }*/
}
