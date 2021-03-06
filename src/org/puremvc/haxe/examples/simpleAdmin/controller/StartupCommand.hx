/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.controller;

import org.puremvc.haxe.examples.simpleAdmin.view.MenuMediator;
import org.puremvc.haxe.examples.simpleAdmin.view.EmployeesMediator;
import org.puremvc.haxe.examples.simpleAdmin.view.DetailsMediator;
import org.puremvc.haxe.examples.simpleAdmin.model.EmployeesProxy;

import org.puremvc.haxe.patterns.command.SimpleCommand;
import org.puremvc.haxe.interfaces.INotification;
#if js
import org.puremvc.haxe.examples.simpleAdmin.ui.JsMenu;
import org.puremvc.haxe.examples.simpleAdmin.ui.JsEmployees;
import org.puremvc.haxe.examples.simpleAdmin.ui.JsDetails;
#elseif flash9
import org.puremvc.haxe.examples.simpleAdmin.ui.Fl9Menu;
import org.puremvc.haxe.examples.simpleAdmin.ui.Fl9Employees;
import org.puremvc.haxe.examples.simpleAdmin.ui.Fl9Details;
import flash.display.Sprite;
#end

class StartupCommand extends SimpleCommand
{

	/**
	 * Registers proxies and creates application views (and their mediators).
	 */
	override public function execute( note: INotification ): Void
	{

		facade.registerProxy( new EmployeesProxy() );
		
		var menu;
		var menu_container;
		#if js
		
		#if haxe3
		var document = js.Browser.document;
		#else
		var document = js.Lib.document;
		#end
		
		menu_container = document.getElementById( "menu" );
		menu = new JsMenu( menu_container );
		#elseif flash9
		menu_container = new Sprite();
		flash.Lib.current.addChild( menu_container );
		menu = new Fl9Menu( menu_container );
		#else error
		#end
		facade.registerMediator( new MenuMediator( menu ) );

		var employees;
		var employees_container;
		#if js
		employees_container = document.getElementById( "employees" );
		employees = new JsEmployees( employees_container );
		#elseif flash9
		employees_container = new Sprite();
		employees_container.y = menu_container.height + 5;
		employees_container.x = 200;
		flash.Lib.current.addChild( employees_container );
		employees = new Fl9Employees( employees_container );
		#else error
		#end
		facade.registerMediator( new EmployeesMediator( employees ) );

		var details;
		var details_container;
		#if js
		details_container = document.getElementById( "details" );
		details = new JsDetails( details_container );
		#elseif flash9
		details_container = new Sprite();
		details_container.y = menu_container.height + 5;
		flash.Lib.current.addChild( details_container );
		details = new Fl9Details( details_container );
		#else error
		#end
		facade.registerMediator( new DetailsMediator( details ) );
	}
}