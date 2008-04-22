/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

import js.Dom;

class JsDetails implements IDetails
{
	//	the view
	private var _container: HtmlDom;
	
	/**
	 * Constructor.
	 */
	public function new( container: HtmlDom )
	{
		_container = container;
		
		newEmployee( 1 );
	}
	
	/**
	 * Empties the input fields for a new employee.
	 */
	public function newEmployee( id: Int ): Void
	{
		var em_id = js.Lib.document.getElementById( "em_id" );
		em_id.innerHTML = Std.string( id );		
		cast( js.Lib.document.getElementById( "em_name" ) ).value = "";
		cast( js.Lib.document.getElementById( "em_lastname" ) ).value = "";
		cast( js.Lib.document.getElementById( "em_role" ) ).value = "";
	}
	
	/**
	 * Returns input fields data as an [EmployeeVO].
	 */
	public function getDetails(): EmployeeVO
	{
		var vo = new EmployeeVO( Std.parseInt( js.Lib.document.getElementById( "em_id" ).innerHTML ) );
		vo.name = cast( js.Lib.document.getElementById( "em_name" ) ).value;
		vo.lastname = cast( js.Lib.document.getElementById( "em_lastname" ) ).value;
		vo.role = cast( js.Lib.document.getElementById( "em_role" ) ).value;
		return vo;
	}

	/**
	 * Fills input fields with the passed [EmpoyeeVO] data.
	 */
	public function setDetails( vo: EmployeeVO ): Void
	{
		js.Lib.document.getElementById( "em_id" ).innerHTML = Std.string( vo.id );
		if ( vo.name != null )
			cast( js.Lib.document.getElementById( "em_name" ) ).value = vo.name;
		if ( vo.lastname != null )
			cast( js.Lib.document.getElementById( "em_lastname" ) ).value = vo.lastname;
		if ( vo.role != null )
			cast( js.Lib.document.getElementById( "em_role" ) ).value = vo.role;
	}

}