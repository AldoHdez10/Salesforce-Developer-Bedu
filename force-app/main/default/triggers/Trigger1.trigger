trigger Disparador1 on Cotizacion__c (after update) {
    if(Trigger.isBefore) 
    {
      if (Trigger.isUpdate)
       {
         for(Cotizacion__c  cot: trigger.new)
           {
            //Declaracion QUERY de la Cantidad Apartada y del Codigo del Producto de la nueva cotizacion en objeto Cotizacion//
            //Declaracion QUERY de la Cantidad Apartada en el Inventario//
            //Suma de las Queris//

              QuotationHelper.searchProductByCode(Trigger.new);
             
             }
         }
      }
  }