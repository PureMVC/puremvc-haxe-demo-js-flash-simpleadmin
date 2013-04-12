/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.model.vo;

/**
 * Stores a single employee data
 */
class EmployeeVO
{
	//	employee data
	#if haxe3
	public var id( get, null ): Int;
	#else
	public var id( get_id, null ): Int;
	#end
	
	public var name( default, default ): String;
	public var lastname( default, default ): String;
	public var role( default, default ): String;
	
	private var _id: Int;
	
	public function new( id: Int )
	{
		_id = id;
	}
	
	private function getId()
	{
		return get_id();
	}
	
	private function get_id()
	{
		return _id;
	}

}