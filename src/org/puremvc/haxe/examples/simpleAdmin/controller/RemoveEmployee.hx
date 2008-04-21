/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.controller;

import org.puremvc.haxe.examples.simpleAdmin.view.DetailsMediator;
import org.puremvc.haxe.examples.simpleAdmin.model.EmployeesProxy;
import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;

import org.puremvc.haxe.patterns.command.SimpleCommand;
import org.puremvc.haxe.interfaces.INotification;

class RemoveEmployee extends SimpleCommand
{

	/**
	 * Retrieves from the mediator the id of the employee to delete.
	 * Removes the emplyee from proxy and sends a notification to update list
	 * and to remove text from the detail view
	 */
	override public function execute( note: INotification ): Void
	{
		var mediator = cast( facade.retrieveMediator( DetailsMediator.NAME ), DetailsMediator );
		var id = mediator.getEmployeeDetails().id;
		
		var proxy = cast( facade.retrieveProxy( EmployeesProxy.NAME ), EmployeesProxy );
		proxy.removeEmployee( id );
		
		var d_mediator = cast( facade.retrieveMediator( DetailsMediator.NAME ), DetailsMediator );
		
		sendNotification( SimpleAdminFacade.UPDATE_LIST );
		sendNotification( SimpleAdminFacade.CLEANUP_DETAILS );
	}
}