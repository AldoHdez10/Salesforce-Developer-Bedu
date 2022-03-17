public class CustomWebInventoryController {  
public String productCode{get;set;}
public String productName{get;set;} 
public Integer productPrice{get;set;} 
public String productExtID{get;set;} 
public Integer productQuantity{get;set;} 
public Integer productInStock{get;set;} 
public List<Product__c> pro {get;set;}
public List<Inventario__c> pList {get;set;}
public String p;
public CustomWebInventoryController ac;

public void prueb(CustomWebInventoryController ac){ this.ac = ac;}

        
        public void doSubmit(){
        pList =	[SELECT Cantidad_dis__c From Inventario__c WHERE CodigoProd__c LIKE :productCode];          
        for(Inventario__c pList2 : pList){
		p  = string.valueof(pList2.Cantidad_dis__c);
	    }
        if(String.isEmpty(p)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Producto No Encontrado'));
        }
        else{
		pro=[SELECT Name,Precio__c,IDExternoProduct__c	 From Product__c WHERE ProductCode__c LIKE :productCode];
        }
    }
    
     
    
   
}