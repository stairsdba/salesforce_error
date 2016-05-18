public with sharing class ErrorLogger {

	private List<Error_Log__c> errorList;
	
	/*
	*	Method : Constructor
	*	Description : Instantiates the logger list and necessary variables.
	*/
	public ErrorLogger() {
		errorList = new List<Error_Log__c>();
	}
	
	/*
	*	Method : add
	*	Descriotion : Adds the error with the details
	*/
	public void add( string errDescription ) {
	
		// create an error log message
		Error_Log__c errorMsg = new Error_Log__c();
		
		errorMsg.Message__c = errDescription;
		
		errorList.add( errorMsg );
	}
	
	/*
	*	Method : add
	*	Description : Adds the error with the details, includes the record id to link it to
	*/
	public void add( string errDescription, string recordId ) {
	
		// create an error log message
		Error_Log__c errorMsg = new Error_Log__c();
		
		errorMsg.Message__c = errDescription;
		errorMsg.Record_id__c = recordId;
		
		errorList.add( errorMsg );
	}
	
	/*
	*	Method : commitError
	*	Description : Saves the errors and restarts the message queue
	*/
	public void commitError() 
	{
		insert( errorList );
		
		errorList = new List<Error_Log__c>();
	}
	
	/*
	*	Method : size()
	*	Description : Returns the number of uncommited error messages
	*/
	public Integer size()
	{
		// create the size
		return errorList.size();
	}
}