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
	public var id( getId, null ): Int;
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
		return _id;
	}

}