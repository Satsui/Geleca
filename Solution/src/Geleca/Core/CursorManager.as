﻿package Geleca.Core 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.System;
	import flash.ui.Mouse;
	import flash.utils.Dictionary;
	import Geleca.Exception.CursorManagerException;
	import Geleca.Util.DepthUtil;
	import Geleca.Component.Cursor.CustomCursor;
	
	public class CursorManager implements IDestroyable
	{
		private var _cursors					:Dictionary 	= new Dictionary();
		private var _stage                      :Stage 			= null;
		private var _cursor                     :CustomCursor 	= null; //atual cursor selecionado
		
		public function CursorManager(stage:Stage=null)
		{
			this.stage = stage;
		}
		
		public function registerCursor(name:String, cursor:CustomCursor):void 
		{
			_cursors[name] = cursor;
		}
		
		public function removeCursor(name:String):void 
		{
			CustomCursor(_cursors[name]).destroy();
			
			_cursors[name] = null;
			delete _cursors[name];
			
			System.gc();
		}
		
		public function set cursor(name:String):void 
		{
			if (_cursor != null)
				_cursor.hide();
				
			if (_cursors[name] != null)
				_cursor = _cursors[name];
			
			//Posiciona o cursor
			stage_mouseMove(null);
			
			_cursor.show();
		}
		
		private function stage_mouseMove(e:MouseEvent):void 
		{
			if (_cursor != null)
			{
				_cursor.move(stage.mouseX, stage.mouseY);
			}
		}
		
		public function set stage(value:Stage):void 
		{
			if (value != _stage)
			{
				_stage = value;
				_stage.addEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMove);
			}
		}
		
		public function get stage():Stage { return _stage; }
		
		/**Retorna o atual cursor Selecionado.*/
		public function getCursor():CustomCursor
		{
			return _cursor;
		}
		
		public function destroy():void 
		{
			for (var name:String in _cursors) 
			{
				CustomCursor(_cursors[name]).destroy();
				delete _cursors[name];
			}
			
			System.gc();
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMove);
			
			_cursors 	= null;
			_cursor 	= null;
			_stage 		= null;
		}
		
	}

}