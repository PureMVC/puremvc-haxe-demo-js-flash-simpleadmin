/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.view;

import org.puremvc.haxe.examples.simpleAdmin.ui.IEmployees;
import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;
import org.puremvc.haxe.examples.simpleAdmin.model.EmployeesProxy;

import org.puremvc.haxe.patterns.mediator.Mediator;
import org.puremvc.haxe.interfaces.INotification;

#if flash9
import flash.events.MouseEvent;
#end

class EmployeesMediator extends Mediator
{
	private var employeesProxy: EmployeesProxy;
	
	public static inline var NAME: String = "EmployeesMediator";

	/**
	 * Constructor.
	 * Initializes event listeners for the view
	 */
	public function new( viewComponent: IEmployees )
	{
		super( viewComponent );
		
		#if js
		
		#if haxe3
		js.Browser.document.getElementById( "employees" ).onclick = onEmployeeClick;
		#else
		js.Lib.document.getElementById( "employees" ).onclick = onEmployeeClick;
		#end
		
		#elseif flash9
		cast( viewComponent ).getContainer().addEventListener( MouseEvent.CLICK, onEmployeeClick );
		#else error
		#end
		
		employeesProxy = cast( facade.retrieveProxy( EmployeesProxy.NAME ), EmployeesProxy );
	}
	
	/*
	 * Handler for a clicked employee from the list
	 * Retrieves the employee id and sends a notification with the id as the body
	 */
	#if (js && haxe3)
	private function onEmployeeClick( evt: js.html.Event  ): Void
	#else
	private function onEmployeeClick( evt  ): Void
	#end
	{
		var id;
		#if js
		id = untyped evt.target.getAttribute( "href" ).split( "#" )[ 1 ];
		#elseif flash9
		id = evt.target.id;
		#else error
		#end
		sendNotification( SimpleAdminFacade.EMPLOYEE_SELECTED, id );
	}

	/**
	 * Handle [INotification]s.
	 */ 
	override public function handleNotification( notification: INotification ): Void
	{
		switch( notification.getName() )
		{
			case SimpleAdminFacade.UPDATE_LIST:
				updateList();
		}
	}
	
	/**
	 * List the [INotification] names this
	 * [Mediator] is interested in being notified of.
	 */
	override public function listNotificationInterests(): Array<String>
	{
		return [
			SimpleAdminFacade.UPDATE_LIST
		];
	}
	
	/*
	 * Returns the name of the mediator
	 */
	override public function getMediatorName(): String
	{
		return NAME;	
	}
	
	/*
	 * Returns the view object
	 */
	private function getEmployees(): IEmployees
	{
		return viewComponent;
	}
	
	/*
	 * Tells the view to update his elements
	 */
	public function updateList(): Void
	{
		getEmployees().updateList( employeesProxy.getEmployees() );
	}

}