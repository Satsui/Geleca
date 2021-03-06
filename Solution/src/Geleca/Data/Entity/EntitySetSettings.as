package Geleca.Data.Entity 
{
	import Geleca.Data.DataTable;
	/**
	 * ...
	 * @author 
	 */
	public class EntitySetSettings
	{
		private var _entityClass	:Class;
		private var _dataTable		:DataTable;
		private var _map			:Object;
		
		public function EntitySetSettings(entityClass:Class, dataTable:DataTable, map:Object) 
		{
			_entityClass 	= entityClass;
			_dataTable 		= dataTable;
			_map 			= map;
		}
		
		public function get map()			:Object 	{ return _map; }
		public function get dataTable()		:DataTable 	{ return _dataTable; }
		public function get entityClass()	:Class 		{ return _entityClass; }
		
	}

}