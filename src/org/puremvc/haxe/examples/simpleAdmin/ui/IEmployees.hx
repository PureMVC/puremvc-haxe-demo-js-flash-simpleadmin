/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

/**
 * Interface that must be implemented by js/fl9 emplyees views
 */
interface IEmployees
{
	function updateList( map: IntHash<EmployeeVO> ): Void;
}