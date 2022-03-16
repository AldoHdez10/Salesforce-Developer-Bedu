trigger Disparador1 on Quote (after update) {
    if(Trigger.isBefore) 
    {
      if (Trigger.isUpdate)
       {
         for(Quote cot: trigger.new)
           {
            List <QuoteLineItem> qli = [SELECT Quantity,(SELECT ProductCode FROM Product2) From QuoteLineItem WHERE QuoteId = :cot.Id];
            List <Inventario__c> inv = new List<Inventario__c>();
            for(QuoteLineItem li :qli){

            Inventario__c inv2 =  [SELECT Cantidad_apart__c From Inventario__c WHERE CodigoProd__c = 343];
            }
            //Declaracion QUERY de la Cantidad Apartada y del Codigo del Producto de la nueva cotizacion en objeto Cotizacion//
            //Declaracion QUERY de la Cantidad Apartada en el Inventario//
            //Suma de las Queris//
            //acutalizar inventario cantidad apartada
              QuotationHelper.searchProductByCode(Trigger.new);
             
             }
         }
      }
  }