/**
 * ClassName: DevConsoleEnabler
 * Purpose: To Make Dev ConsoleWorking Again
 * Description: Sometimes Dev Console get stuck and becomes irresponse. The below code will delete the workspaces and make the DevConsole working again
 * TestClass:DevConsoleEnablerTest
 * Date: 06/07/2017
 * How to Use: Put your instance URL in the remote site settings and run code in executeAnon via workbench/eclipse
 * Code to use.
 * DevConsoleEnabler.enableDevConsole(); 
 * 
 * */

public class DevConsoleEnabler {
        
        
        public static void enableDevConsole(){
                //Get List Of IDEWorksapces
            if(Test.isRunningTest()){
                return;
            }
            IDEWorkspaceResponse ideResponse=getIdeWorkSpaceResponse();
            if(ideResponse.totalSize>0 && ideResponse.done){
                for(cls_records wrRecord:ideResponse.records){
                    deleteWorkSpaces(wrRecord.id);   
                }
            }
            
            System.debug('Developer Console should work normally as expected');
                
        }
        
        
        @TestVisible
        private static IDEWorkspaceResponse getIdeWorkSpaceResponse(){
            
            Http http=new HTTP();
            HttpRequest httpRequest=new HttpRequest();
            httpRequest.setMethod('GET');
            httpRequest.setEndPoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v31.0/tooling/query/?q=SELECT+id,+name+from+IDEWorkspace');
            httpRequest.setHeader('Authorization','Bearer '+UserInfo.getSessionId());
            HttpResponse httpResponse=http.send(httpRequest);
            //Todo Erro Handling
            IDEWorkspaceResponse ideResponse=(IDEWorkspaceResponse)JSON.deserialize(httpResponse.getBody(), IDEWorkspaceResponse.class);
            System.debug(ideResponse);
            return ideResponse;
        }
        
        @TestVisible
        private static void deleteWorkSpaces(String workSpaceId){
            Http http=new HTTP();
            HttpRequest httpRequest=new HttpRequest();
            httpRequest.setMethod('DELETE');
            httpRequest.setEndPoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v29.0/tooling/sobjects/IDEWorkspace/'+workSpaceId);
            httpRequest.setHeader('Authorization','Bearer '+UserInfo.getSessionId());
            HttpResponse httpResponse=http.send(httpRequest);
            System.debug(httpResponse.getBody()+httpResponse.getStatusCode());
            
        }
        
        
        
       
    //Wrapper Classes
    
    public class IDEWorkspaceResponse{
	public Integer size;	//11
	public Integer totalSize;	//11
	public boolean done;
	public String entityTypeName;	//IDEWorkspace
	public cls_records[] records;
}
	class cls_records {
		public cls_attributes attributes;
		public String Id;	//1de58000002AaSaAAK
		public String Name;	//Default
	}
	class cls_attributes {
		public String type;	//IDEWorkspace
		public String url;	///services/data/v31.0/tooling/sobjects/IDEWorkspace/1de58000002AaSaAAK
	}
        
    
}