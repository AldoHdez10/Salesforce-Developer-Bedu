public  class InventoryDataScheduler implements Schedulable {
    
    public void execute(SchedulableContext sc) {
    InventoryDataScheduler horario = new InventoryDataScheduler(); 
    String sch = '0 0 19 1/1 * ? *'; 
    String jobID = System.schedule('TareaProg', sch, horario);
    
    }

    @InvocableMethod public static void ExternalLegacyConnection() {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://64bjp0q5wg.execute-api.us-east-2.amazonaws.com/Implement/');
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            /*
             * My Json Parser
			*/
            //Leemos el objeto por jerarquia hasta llegar a los registros
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> results2 = (Map<String, Object>) results.get('body');
            List<Object> listProducts = (List<Object>) results2.get('Inventory');
            //Armo una lista de Map con los registros
            List<Map<String, Object>> data = new List<Map<String, Object>>();
            //Recolectando todos los productos
            for(Object item:listProducts){
                data.add((Map<String, Object>)item);
            }
            //Lista del objeto inventario para almacenar los resultados del parseo
            List<Inventario__c> lstRestInv = new List<Inventario__c>();
            //Converor de Map a objeto sObject de Apex
            for(Map<String, Object> key:data) {
                Inventario__c inv = new Inventario__c();
                integer pos = 0;
                for(Object item:key.values()) {
                    if(pos == 0){
                        inv.Name = ''+item;
                    }else if(pos == 1){
                        inv.CodigoProd__c = ''+item;
                    }else if(pos == 2){
                        inv.Cantidad_dis__c = (Double) item;
                    }else if(pos == 3){
                        inv.Cantidad_apart__c = (Double) item;
                        //add item
                        pos = 0;
                        lstRestInv.add(inv);
                    }//end if
                    pos++;
                }//end for
            }//end for
            //Resultado de la conversion
            update lstRestInv ;
            System.debug('Productos leidos desde rest:'+lstRestInv);
            /*
             * END My Json Parser
             */
          }
          
		}

}