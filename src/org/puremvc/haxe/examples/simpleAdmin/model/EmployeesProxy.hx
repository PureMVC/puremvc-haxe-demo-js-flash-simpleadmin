/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.model;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;
import org.puremvc.haxe.patterns.proxy.Proxy;

#if haxe3
import haxe.ds.IntMap;
#else
private typedef IntMap<T> = IntHash<T>;
#end

class EmployeesProxy extends Proxy
{

	/**
	 * Proxy name
	 */
	public static inline var NAME: String = "EmployeesProxy";
	
	/**
	 * Constructor.
	 */
	public function new()
	{
		super( NAME, new IntMap<EmployeeVO>() );
	}

	/**
	 * Getter method for proxy data.
	 */
	public function getEmployees(): IntMap<EmployeeVO>
	{
		return data;
	}
	
	/**
	 * Returns the next available id for a new employee.
	 */
	public function newEmployeeId(): Int
	{
		return getNewID();
	}
	
	/**
	 * Getter method for a single employee value object from the data.
	 */
	public function getEmployee( id: Int ): EmployeeVO
	{
		return getEmployees().get( id );
	}
	
	/**
	 * Removes an employee value object from the data.
	 */
	public function removeEmployee( id: Int ): Void
	{
		getEmployees().remove( id );
	}
	
	/**
	 * Adds an employee value object to the data.
	 */
	public function saveEmployee( vo: EmployeeVO ): Void
	{
		getEmployees().set( vo.id, vo );
	}
	
	/**
	 * Returns the next highest id.
	 */
	private function getNewID(): Int
	{
		var id: Int = 1;
		for ( i in getEmployees().keys() )
		{
			if ( i >= id )
			{
				id = i;
				id++;
			}
		}
		return id;
	}
}