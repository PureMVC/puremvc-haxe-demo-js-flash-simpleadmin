/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

#if haxe3
import js.html.Element;
#else
import js.Dom;
private typedef Element = HtmlDom;
#end

class JsDetails implements IDetails
{
	//	the view
	private var _container: Element;
	
	/**
	 * Constructor.
	 */
	public function new( container: Element )
	{
		_container = container;
		
		newEmployee( 1 );
	}
	
	/**
	 * Empties the input fields for a new employee.
	 */
	public function newEmployee( id: Int ): Void
	{
		#if haxe3
		var document = js.Browser.document;
		#else
		var document = js.Lib.document;
		#end
		
		var em_id = document.getElementById( "em_id" );
		em_id.innerHTML = Std.string( id );		
		cast( document.getElementById( "em_name" ) ).value = "";
		cast( document.getElementById( "em_lastname" ) ).value = "";
		cast( document.getElementById( "em_role" ) ).value = "";
	}
	
	/**
	 * Returns input fields data as an [EmployeeVO].
	 */
	public function getDetails(): EmployeeVO
	{
		#if haxe3
		var document = js.Browser.document;
		#else
		var document = js.Lib.document;
		#end
		
		var vo = new EmployeeVO( Std.parseInt( document.getElementById( "em_id" ).innerHTML ) );
		vo.name = cast( document.getElementById( "em_name" ) ).value;
		vo.lastname = cast( document.getElementById( "em_lastname" ) ).value;
		vo.role = cast( document.getElementById( "em_role" ) ).value;
		return vo;
	}

	/**
	 * Fills input fields with the passed [EmpoyeeVO] data.
	 */
	public function setDetails( vo: EmployeeVO ): Void
	{
		#if haxe3
		var document = js.Browser.document;
		#else
		var document = js.Lib.document;
		#end
		
		document.getElementById( "em_id" ).innerHTML = Std.string( vo.id );
		if ( vo.name != null )
			cast( document.getElementById( "em_name" ) ).value = vo.name;
		if ( vo.lastname != null )
			cast( document.getElementById( "em_lastname" ) ).value = vo.lastname;
		if ( vo.role != null )
			cast( document.getElementById( "em_role" ) ).value = vo.role;
	}

}