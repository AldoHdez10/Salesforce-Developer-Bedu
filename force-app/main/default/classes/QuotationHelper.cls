public with sharing class QuotationHelper {
    
   public static void initialConfig(){
    Account miCuenta = new Account();
    Account miCuenta2 = new Account();

    miCuenta.Name ='Compumundo';
    miCuenta2.Name = 'Compuworld';
    insert miCuenta;
    insert miCuenta2;
    }
    
    public static List<Inventario__c> searchContactsAndLeads(String a) {
        List<Inventario__c> lst = new List<Inventario__c>([SELECT Name,CodigoProd__c,Cantidad_dis__c,Cantidad_apart__c FROM Inventario__c]);    
        return lst;    

    }
    
}