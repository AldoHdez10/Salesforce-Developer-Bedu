public  class InventoryDataScheduler implements Schedulable {
    
    public void execute(SchedulableContext sc) {
    InventoryDataScheduler horario = new InventoryDataScheduler(); 
    String sch = '0 0 19 1/1 * ? *'; 
    String jobID = System.schedule('TareaProg', sch, horario);
    
    }

    @InvocableMethod public static void ExternalLegacyConnection() {
        
    }

}
