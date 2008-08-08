/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.ui;

import org.puremvc.haxe.examples.simpleAdmin.model.vo.EmployeeVO;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextFieldAutoSize;

class Fl9Details implements IDetails
{
	//	the view
	private var _container: Sprite;

	private var det_id: DetailsInput;
	private var name: DetailsInput;
	private var lastname: DetailsInput;
	private var role: DetailsInput;
	
	/**
	 * Constructor.
	 */
	public function new( container: Sprite )
	{
		_container = container;
		
		initGraphics();

		newEmployee( 1 );
	}
	
	/**
	 * Creates view components.
	 */
	private function initGraphics(): Void
	{
		det_id = new DetailsInput( "id:", TextFieldType.DYNAMIC );
		_container.addChild( det_id );
		name = new DetailsInput( "name:", TextFieldType.INPUT );
		name.y = det_id.height + det_id.y + 5;
		_container.addChild( name );
		lastname = new DetailsInput( "lastname:", TextFieldType.INPUT );
		lastname.y = name.height + name.y + 5;
		_container.addChild( lastname );
		role = new DetailsInput( "role:", TextFieldType.INPUT );
		role.y = lastname.height + lastname.y + 5;
		_container.addChild( role );
	}

	/**
	 * Empties the input fields for a new employee.
	 */
	public function newEmployee( id: Int ): Void
	{
		det_id.value.text = Std.string( id );
		name.value.text = "";
		lastname.value.text = "";
		role.value.text = "";
	}

	/**
	 * Returns input fields data as an [EmployeeVO].
	 */
	public function getDetails(): EmployeeVO
	{
		var vo = new EmployeeVO( Std.parseInt( det_id.value.text ) );
		vo.name = name.value.text;
		vo.lastname = lastname.value.text;
		vo.role = role.value.text;
		return vo;
	}
	
	/**
	 * Fills input fields with the passed [EmpoyeeVO] data.
	 */
	public function setDetails( vo: EmployeeVO ): Void
	{
		det_id.value.text = Std.string( vo.id );
		if ( vo.name != null )
			name.value.text = vo.name;
		if ( vo.lastname != null )
			lastname.value.text = vo.lastname;
		if ( vo.role != null )
			role.value.text = vo.role;
	}

}

/**
 * Teh details component.
 */
class DetailsInput extends Sprite
{
	public var value( default, default ): TextField;

	public function new( label: String, type )
	{
		super();

		var tf: TextFormat = new TextFormat();
		tf.font = "Arial";
		tf.size = 14;
		
		var t: TextField = new TextField();
		t.text = label;
		t.selectable = false;
		t.autoSize = TextFieldAutoSize.LEFT;
		t.setTextFormat( tf );
		addChild( t );
		
		value = new TextField();
		if( type == TextFieldType.INPUT )
		{
			value.border = true;
			value.borderColor = 0x999999;
		}
		value.y = t.height + 3;
		value.height = 16;
		value.width = 150;
		value.type = type;
		addChild( value );					
	}
}