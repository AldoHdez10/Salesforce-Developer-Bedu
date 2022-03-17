public class QuotationHelper implements QuotationSync{


public void prueba1(CustomWebInventoryController controller){}

    public Integer ProductCode() {

    return ProductCode();  
    } 
     
    public static void initialConfig(){
    Account miCuenta = new Account();
    Account miCuenta2 = new Account();

    miCuenta.Name ='Compumundo';
    miCuenta2.Name = 'Compuworld';
    insert miCuenta;
    insert miCuenta2;
    }
    
    public static List<Inventario__c> productsInInventory() {
        List<Inventario__c> lst = new List<Inventario__c>([SELECT Name,CodigoProd__c,Cantidad_dis__c,Cantidad_apart__c FROM Inventario__c]);    
        return lst;    
    }

    public static Boolean confirmProductExistByCode(String x){
        Boolean status = false;
        List<Product2> pList = new List<Product2>([SELECT ProductCode From Product2]);
        for(Product2 a : pList ){
            if(a.ProductCode == x){
                status = true;  
            }
            else{
             status=false;
           }
        }
        return status;
    }

    public static Integer searchProductByCode(String x){
        String a = x;
        Integer b = 0;
        List<Inventario__c> pList = new List<Inventario__c>([SELECT Cantidad_dis__c From Inventario__c WHERE CodigoProd__c LIKE :a]);
        for(Inventario__c c : pList ){
            if(c.Cantidad_dis__c == 0){
              b=0;
            }
            else{
                b = (Integer) [SELECT Cantidad_dis__c From Inventario__c WHERE CodigoProd__c LIKE :a].Cantidad_dis__c;
           }
        }
        System.debug(b);
        return b;
    }

    public static void StockEmptyAlert() {
       List<Inventario__c> pList = new List<Inventario__c>(productsInInventory());
       for(Inventario__c l : pList ){
        if(l.Cantidad_dis__c == 0){
            FeedItem post = new FeedItem();
            post.Body = 'Existen productos en inventario sin existencia';
            insert post;
            Datetime tiemp = Datetime.now();
            String tiempo = tiemp.format();
        }     
       } 
    }
    
    
}