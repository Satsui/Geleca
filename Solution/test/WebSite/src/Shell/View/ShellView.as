package Shell.View 
{
	import Asset.ShellAsset;
	import Geleca.View.View;
	import Pages.Contact.View.ContactView;
	import Pages.Products.View.ProductsView;
	import flash.display.Sprite;
	import Shell.Controller.ShellController;
	import Shell.View.Button.PageButton;
	
	public class ShellView extends View
	{
		public var btn_contact			:PageButton;
		public var btn_products			:PageButton;
		
		private var _asset				:ShellAsset = new ShellAsset();
		
		public var contactView			:ContactView;
		public var productsView			:ProductsView;
		
		private var _controller			:ShellController;
		
		public function ShellView() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			addChild(_asset);
		}
		
		override protected function setViews():void 
		{
			super.setViews();
			
			contactView = addView(new ContactView()) as ContactView;
			productsView = addView(new ProductsView()) as ProductsView;
		}
		
		override protected function setComponents():void 
		{
			super.setComponents();
			
			btn_contact 	= addComponent(new PageButton(_asset.btn_contact)) as PageButton;
			btn_products 	= addComponent(new PageButton(_asset.btn_products)) as PageButton;
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			_controller = new ShellController(this);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_controller.initializeController();
		}
		
	}

}