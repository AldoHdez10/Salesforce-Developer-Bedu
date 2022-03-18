trigger Trigger1 on QuoteLineItem (after update) {
      if(trigger.isUpdate){
       Quote qt = trigger.New[0];
       Quote qt2 = [SELECT Id, Name,(Select Id,Quantity,Product2 FROM QuoteLineItem)FROM Quote WHERE id= :qt.Id];
      
      List<Product2> p2l = new List<Product2>();

      for (QuoteLineItem item:qt2.QuoteLineItem) {
       p2l.add([SELECT ProductCode, Externalid FROM Product2 WHERE id=: item.Product2]);            
      }
      QuotationHelper qth = new QuotationHelper();

      List<Inventario__c> inv = new List<Inventario__c>();

      for(Pricebook2 p: p2l){
         try{
            if(qth.confirmProductExistByCode(p.ExternalId)){
                  Inventario__c inv2 = [SELECT Id,Cantidad_Apart FROM Inventario__c WHERE CodigoProd__c =:p.ProductCode];
                  QuoteLineItem qli = [SELECT Quantity FROM QuoteLineItem WHERE Product2Id=:p.Id];
                 Double cantidadActualizar = qli.Quantity;
                inv2.Cantidad_apart__c += cantidadActualizar;
                inv.add(in2);
            } 
         }  catch(Exception err){

         } 
      }

      update inv;
      }
 }
  