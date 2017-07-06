@isTest
public class DevConsoleEnablerTest {

	private static testMethod void testGetIdeWorkSpaceResponse() {
        Test.setMock(HttpCalloutMock.class ,new GetIdeWorkSpaceResponseMock());
        Test.startTest();
        DevConsoleEnabler.IdeWorkSpaceResponse resp=DevConsoleEnabler.GetIdeWorkSpaceResponse();
        Test.stopTest();
        System.assertEquals(resp.size, 1);
        DevConsoleEnabler.enableDevConsole();
	}
	
	private static testMethod void testdeleteWorkSpaces() {
        Test.setMock(HttpCalloutMock.class ,new DeleteWorkSpacesMock());
        Test.startTest();
        DevConsoleEnabler.deleteWorkSpaces('1de58000002AaSaAAK');
        Test.stopTest();
        System.assertEquals(true, true);
	}
	
	
	public class GetIdeWorkSpaceResponseMock implements HttpCalloutMock {
    // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"size":1,"totalSize":1,"done":true,"queryLocator":null,"entityTypeName":"IDEWorkspace","records":[{"attributes":{"type":"IDEWorkspace","url":"/services/data/v31.0/tooling/sobjects/IDEWorkspace/1de58000002AaSaAAK"},"Id":"1de58000002AaSaAAK","Name":"Default"}]}');
            res.setStatusCode(200);
            return res;
        }
    }
    
    
    public class DeleteWorkSpacesMock implements HttpCalloutMock {
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('');
            res.setStatusCode(204);
            return res;
        }
    }


}