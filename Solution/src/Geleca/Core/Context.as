package Geleca.Core 
{
	import flash.system.System;
	import flash.utils.Dictionary;
	
	public class Context
	{
		private var _objects	:Dictionary = new Dictionary();
		private var _length		:uint = 0;
		
		public function Context() 
		{
			
		}
		
		public function add(name:String, obj:*):void 
		{
			_objects[name] = obj;
			
			_length ++;
		}
		
		public function remove(name:String):void 
		{
			_objects[name] = null;
			delete _objects[name];
			
			System.gc();
			
			_length --;
		}
		
		public function removeAll():void 
		{
			for (var key:String in _objects) 
			{
				remove(key);
			}
		}
		
		public function getByName(name:String):*
		{
			return _objects[name];
		}
		
		public function getByType(type:Class):Array
		{
			var objects:Array = [];
			var object:*;
			
			for (var key:String in _objects) 
			{
				object = _objects[key];
				
				if(object is type)
					objects.push(object);
			}
			
			return objects;
		}
		
		public function get length():uint { return _length; }
		
	}

}