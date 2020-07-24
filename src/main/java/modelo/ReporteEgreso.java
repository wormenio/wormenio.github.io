package modelo;
import java.util.List;

public class ReporteEgreso {	
    int anio;
    int mes;
    EtiquetaEgreso etiquetaEgreso;
    float monto;
    RepositorioCompras repoCompras;
    
   public List<CompraConPresupuesto> VerReporteEgreso(int mes, int anio, int etiqueta){            
      return (List<CompraConPresupuesto>)repoCompras.listadoCompras().stream().filter(
              x -> x.getEtiqueta() == etiqueta 
              && x.getAnio() == anio 
              && x.getMes() == mes
      );
    }
	
	
	
	
}