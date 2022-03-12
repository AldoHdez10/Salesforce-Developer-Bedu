public with sharing class QuotationHelper {
    
   public static void initialConfig(){
    Account miCuenta = new Account();
    Account miCuenta2 = new Account();

    miCuenta.Name ='Compumundo';
    miCuenta2.Name = 'Compuworld';
    insert miCuenta;
    insert miCuenta2;



    }

}