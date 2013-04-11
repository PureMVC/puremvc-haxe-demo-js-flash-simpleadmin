/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

#if haxe3
import haxe.ds.IntMap;
#else
private typedef IntMap<T> = IntHash<T>;
#end

/**
 * Interface that must be implemented by js/fl9 emplyees views
 */
interface IEmployees
{
	function updateList( map: IntMap<EmployeeVO> ): Void;
}