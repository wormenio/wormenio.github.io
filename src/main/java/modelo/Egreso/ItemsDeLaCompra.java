package modelo.Egreso;


public class ItemsDeLaCompra {

    Item item;
    Double monto;

    public ItemsDeLaCompra(Item item, Double monto){
        this.item = item;
        this.monto = monto;
    }

    public Item getItem(){
        return item;
    }

    public Double getMonto(){ return monto;}
}
