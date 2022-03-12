public with sharing class QuotationHelper {
    
   public void initialConfig(){
    Cuenta inv = new Cuenta();
    Cuenta inv1 = new Cuenta();
    

    Cuenta inv = [Select id,Name from Cuenta where Name ='Compumundo' limit 1];
    Cuenta inv1 = [Select id,Name from Cuenta where Name ='Compuworld' limit 1];


    }

}