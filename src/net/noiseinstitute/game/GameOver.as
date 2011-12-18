package net.noiseinstitute.game
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	public class GameOver extends Entity
	{
		[Embed(source = '../../../../Art bits/Electrolize-Regular.ttf', embedAsCFF="false", fontFamily = 'Electrolize')]
		private const ELECTROLIZE:Class;
		
		private var gameOverText:Text;
		
		public function GameOver(x:Number, y:Number)
		{
			this.x = x;
			this.y = y;
			
			gameOverText = new Text("You failed to reach Delta Station\nThe President is most disappointed");
			gameOverText.scale = 2;
			gameOverText.visible = false;
			gameOverText.scrollX = 0;
			gameOverText.scrollY = 0;
			gameOverText.centerOrigin();
			//gameOverText.font = "Electrolize";
			
			graphic = gameOverText;
		}
		
		public function setTextVisible(visible:Boolean=true):void {
			gameOverText.visible = visible;
		}
	}
}