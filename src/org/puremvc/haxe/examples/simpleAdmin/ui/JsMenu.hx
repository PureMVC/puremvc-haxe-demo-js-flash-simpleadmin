/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import js.Dom;

class JsMenu implements IMenu
{
	//	the view
	private var _container: HtmlDom;
	
	/**
	 * Constructor.
	 */
	public function new( container: HtmlDom )
	{
		_container = container;
	}
	
}