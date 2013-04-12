/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.view;

import org.puremvc.haxe.examples.simpleAdmin.ui.IMenu;
import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;
#if js
import org.puremvc.haxe.examples.simpleAdmin.ui.JsMenu;

#elseif flash9
import org.puremvc.haxe.examples.simpleAdmin.ui.Fl9Menu;
import flash.events.MouseEvent;
#else error
#end

import org.puremvc.haxe.patterns.mediator.Mediator;
import org.puremvc.haxe.interfaces.INotification;

class MenuMediator extends Mediator
{

	public static inline var NAME: String = "MenuMediator";

	/**
	 * Constructor.
	 * Initializes event listeners for the view
	 */
	public function new( viewComponent: IMenu )
	{
		super( viewComponent );
		
		#if js
		
		#if haxe3
		var document = js.Browser.document;
		#else
		var document = js.Lib.document;
		#end
		
		document.getElementById( "remove_e" ).onclick = onRemoveEmployee;
		document.getElementById( "new_e" ).onclick = onNewEmployee;
		document.getElementById( "save_e" ).onclick = onSaveEmployee;
		
		#elseif flash9
		cast(viewComponent).new_e.addEventListener( MouseEvent.CLICK, onNewEmployee );
		cast(viewComponent).remove_e.addEventListener( MouseEvent.CLICK, onRemoveEmployee );
		cast(viewComponent).save_e.addEventListener( MouseEvent.CLICK, onSaveEmployee );
		#else error
		#end
	}
	
	/*
	 * Click Handler for a new employee. Simply sends a notification
	 * to all registered observers.
	 */
	private function onNewEmployee( evt ): Void
	{
		facade.sendNotification( SimpleAdminFacade.NEW_EMPLOYEE );
	}

	/*
	 * Click Handler for saving an employee. Simply sends a notification
	 * to all registered observers.
	 */
	private function onSaveEmployee( evt ): Void
	{
		facade.sendNotification( SimpleAdminFacade.SAVE_EMPLOYEE );
	}

	/*
	 * Click Handler for removing an employee. Simply sends a notification
	 * to all registered observers.
	 */
	private function onRemoveEmployee( evt ): Void
	{
		facade.sendNotification( SimpleAdminFacade.REMOVE_EMPLOYEE );
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
	private function getMenu(): IMenu
	{
		return viewComponent;
	}		

}