/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

interface IDetails
{
	function newEmployee( id: Int ): Void;
	function getDetails(): EmployeeVO;
	function setDetails( vo: EmployeeVO ): Void;
}