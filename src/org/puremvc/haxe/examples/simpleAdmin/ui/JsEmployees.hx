/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

#if haxe3
import haxe.ds.IntMap;
import js.html.Element;
#else
private typedef IntMap<T> = IntHash<T>;
import js.Dom;
private typedef Element = HtmlDom;
#end

class JsEmployees implements IEmployees
{
	//	the view
	public var _container: Element;
	
	/**
	 * Constructor.
	 */
	public function new( container: Element )
	{
		_container = container;
	}

	/**
	 * Removes all children in the view and creates the new ones.
	 */
	public	function updateList( map: IntMap<EmployeeVO> ): Void
	{
		_container.innerHTML = "";
		for( i in map.iterator() )
		{
			#if haxe3
			var a:Element = js.Browser.document.createElement( "A" );
			#else
			var a = js.Lib.document.createElement( "A" );
			#end
			a.setAttribute( "href", "#" + i.id );
			a.innerHTML = i.name + " " + i.lastname;
			_container.appendChild( a );
		}
	}
	
	/**
	 * Returns the view.
	 */
	public function getContainer(): Element
	{
		return _container;
	}

}