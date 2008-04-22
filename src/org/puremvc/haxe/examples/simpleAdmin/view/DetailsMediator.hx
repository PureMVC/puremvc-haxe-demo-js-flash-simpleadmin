/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.view;

import org.puremvc.haxe.examples.simpleAdmin.ui.IDetails;
import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;
import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;
import org.puremvc.haxe.examples.simpleAdmin.model.EmployeesProxy;

import org.puremvc.haxe.patterns.mediator.Mediator;
import org.puremvc.haxe.interfaces.INotification;

class DetailsMediator extends Mediator
{
	private var employeesProxy: EmployeesProxy;

	public static inline var NAME: String = "DetailsMediator";

	/**
	 * Constructor.
	 */
	public function new( viewComponent: IDetails )
	{
		super( viewComponent );
		
		employeesProxy = cast( facade.retrieveProxy( EmployeesProxy.NAME ), EmployeesProxy );
	}

	/**
	 * Handle [INotification]s.
	 */ 
	override public function handleNotification( notification: INotification ): Void
	{
		switch( notification.getName() )
		{
			case SimpleAdminFacade.EMPLOYEE_SELECTED:
				viewComponent.setDetails( employeesProxy.getEmployee( notification.getBody() ) );
			case SimpleAdminFacade.CLEANUP_DETAILS:
				viewComponent.newEmployee( employeesProxy.newEmployeeId() );
		}	
	}
	
	/**
	 * List the [INotification] names this
	 * [Mediator] is interested in being notified of.
	 */
	override public function listNotificationInterests(): Array<String>
	{
		return [
			SimpleAdminFacade.EMPLOYEE_SELECTED,
			SimpleAdminFacade.CLEANUP_DETAILS
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
	private function getMenu(): IDetails
	{
		return viewComponent;
	}
	
	/*
	 * Tells the view to refresh, showing the newly created employee
	 */
	public function newEmployee( id: Int ): Void
	{
		viewComponent.newEmployee( id );
	}
	
	/*
	 * Returns employee data contained in the view
	 */
	public function getEmployeeDetails(): EmployeeVO
	{
		return viewComponent.getDetails();
	}	

}