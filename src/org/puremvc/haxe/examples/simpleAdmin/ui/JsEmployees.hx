/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

import js.Dom;

class JsEmployees implements IEmployees
{
	//	the view
	public var _container: HtmlDom;
	
	/**
	 * Constructor.
	 */
	public function new( container: HtmlDom )
	{
		_container = container;
	}

	/**
	 * Removes all children in the view and creates the new ones.
	 */
	public	function updateList( map: IntHash<EmployeeVO> ): Void
	{
		_container.innerHTML = "";
		for( i in map.iterator() )
		{
			var a = js.Lib.document.createElement( "A" );
			a.setAttribute( "href", "#" + i.id );
			a.innerHTML = i.name + " " + i.lastname;
			_container.appendChild( a );
		}
	}
	
	/**
	 * Returns the view.
	 */
	public function getContainer(): HtmlDom
	{
		return _container;
	}

}