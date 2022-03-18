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

        if(response.getStatusCode()==200){
            Map<String, Object> resultado = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

           List<Object> inventarioItems = (List<Object>) resultado.get('Inventory');
           
           for(Object Product2:inventarioItems){
               
            System.debug('Esto se recibe' +resultado); 
           }
          
        }
    }

}