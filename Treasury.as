package {

	public class Treasury {
		//var currentIncome = 0;
		
		/*public function Treasury(PlayerID:Number) {
			moneyTimer:Timer = new Timer(utils.MoneyTimer); 
             
            // designates listeners for the interval and completion events 
            //moneyTimer.addEventListener(TimerEvent.TIMER, onTick); 
            moneyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, CalculateMoney); 
             
            // starts the timer ticking 
            moneyTimer.start(); 
		}*/
		public static function getIncome(PlayerID)
		{
			var income = earnings.BasePerSec;
			var a = Utils.cityArray;
			for(var i = 0; i<Utils.cityArray.length;i+=2)
			{
				if(a[i].getOwner() == PlayerID)
				{ 
					if(i < 10)
					{
						//if big city
						income += earnings.LargeCityPerSec;
					}
					else
					{
						income += earnings.SmallCityPerSec;
					}
				}
			}
			return income;
		}
		
	}

}