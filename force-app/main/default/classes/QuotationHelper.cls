public with sharing class QuotationHelper {
    
   public void initialConfig(){
    Cuenta miCuenta = new Cuenta();
    Cuenta miCuenta2 = new Cuenta();

    miCuenta.Name = [Select id,Name from Cuenta where Name ='Compumundo' limit 1];
    miCuenta2.Name = [Select id,Name from Cuenta where Name ='Compuworld' limit 1];



    }

}