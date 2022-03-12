public class HelloWorld {
 	  
    String test;
    
    void hello(){
        System.debug('Hola Mundo');
        String str;
        Integer i = 0;
         this.test = 'Adios';
        
        if(i>0){
            this.test = 'es mayor';
        }else{
            this.test='es cero o menor';}
        
    Account acc = new Account();
    Inventario__c inv = new Inventario__c();
    
        inv.Name = 'Test';
        inv.Cantidad_apart__c = 3;
        
        List<sObject> lst = new List<sObject>();
        lst.add(inv);
        lst.add(acc);
  
        String nameInv = 'Test';
        Inventario__c inv2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
        sObject inv3 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
  		List<sObject> lst2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInV LIMIT 1];
        //Inventario__c inv = [Select id,Name from Inventario__c where Name ='Test' limit 1];

        //Test
        for(integer k = 0; k <= lst2.size(); k++){
            System.debug('Result:'+lst2);
            Inventario__c inv4 = (Inventario__c)lst2[k];
            System.debug('Result:'+inv4.Name);
        }


    }
     
    public void Hello2(){
    this.test='hola';
	}	   
}