public with sharing class QuotationHelper {
    
   public static void initialConfig(){
    Account miCuenta = new Account();
    Account miCuenta2 = new Account();

    miCuenta.Name ='Compumundo';
    miCuenta2.Name = 'Compuworld';
    insert miCuenta;
    insert miCuenta2;
    }

    public static productsInInventory(){
        List<Inventario__c> lst = [SELECT FIELDS(ALL) FROM Inventario__c LIMIT 200];
        for(integer k = 0; k <= lst.size(); k++){
            System.debug('Result:'+lst);
            }
         return lst;   
    }
}