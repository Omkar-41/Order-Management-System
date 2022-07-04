<?php
class Database     //database connection of admin 
{
	
	private $con;
	public function connect(){
		$this->con = new Mysqli("localhost", "root", "", "store_db");
		return $this->con;
	}
}

?>