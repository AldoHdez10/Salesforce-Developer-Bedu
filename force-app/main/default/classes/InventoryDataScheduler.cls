public with sharing class InventoryDataScheduler implements Schedulable {
    public void execute(Schedulable context) {
        InventoryDataScheduler horario = new InventoryDataScheduler(); 
    String sch = '0 0 19 1/1 * ? *'; 
    String jobID = System.schedule('TareaProg', sch, horario);
    
    }
    public staticExternalLegacyConnection() {
        
    }
   
}
