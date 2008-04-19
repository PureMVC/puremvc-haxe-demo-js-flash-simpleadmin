/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;

class SimpleAdmin
{

	function new()
	{
		var facade = SimpleAdminFacade.getInstance();
		facade.sendNotification( SimpleAdminFacade.STARTUP, this );
	}

	public static function main(): Void
	{
		var app: SimpleAdmin = new SimpleAdmin();
	}
}