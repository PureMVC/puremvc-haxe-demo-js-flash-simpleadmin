/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

#if haxe3
import js.html.Element;
#else
import js.Dom;
typedef Element = HtmlDom;
#end

class JsMenu implements IMenu
{
	//	the view
	private var _container: Element;
	
	/**
	 * Constructor.
	 */
	public function new( container: Element )
	{
		_container = container;
	}
	
}