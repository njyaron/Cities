package {

	import flash.display.MovieClip;
    import flash.events.TimerEvent; 
    import flash.utils.Timer; 

	public class User extends MovieClip {

		public static var dest: Number;
		private const ID: Number;
		private var money: Number = earnings.BaseMoney;
		private var moneyTimer:Timer;
		
		
		public function User(ID:Number) {
			dest = ID;
			moneyTimer:Timer = new Timer(Utils.moneyTimer); 
             
            // designates listeners for the interval and completion events 
            //moneyTimer.addEventListener(TimerEvent.TIMER, onTick); 
            moneyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, addMoney); 
             
            // starts the timer ticking 
            moneyTimer.start(); 
		}
		public function addMoney(e)
		{
			money += Treasury.getIncome(this.ID);
			
		}
		public function setDestnation(d:Number)
		{
			this.dest = d;
		}
		public function getDestination()
		{
			return this.dest;
		}
		public function removeMoney(amount:Number)
		{
			money -= amount;
		}
	}

}