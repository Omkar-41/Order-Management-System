<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Order Success</title>
</head>
<body>
</body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
</html>
<?php
require 'phpmailer/PHPMailer.php';
require 'phpmailer/Exception.php';
require 'phpmailer/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

session_start();
if(!isset($_SESSION["uid"])){
	header("location:index.php");
}

		include_once("db.php");
		$sql = "SELECT p_id,qty FROM cart WHERE user_id = '".$_SESSION["uid"]."'";
		$query = mysqli_query($con,$sql);
		$tq=0;
		



		if (mysqli_num_rows($query) > 0) {
			# code...
			while ($row=mysqli_fetch_array($query)) {
			$product_id[] = $row["p_id"];
			$qty[] = $row["qty"];
			}
			$p_st = "placed";
			for ($i=0; $i < count($product_id); $i++) { 
				$sql00 = "SELECT product_price FROM products WHERE product_id = ".$product_id[$i]."";
				$query00 = mysqli_query($con,$sql00);
				if (mysqli_num_rows($query00) > 0) {
					while ($row00=mysqli_fetch_array($query00)) {
						$amnt = $row00['product_price']*$qty[$i];
					}
				}
			$date = date("y-m-d");
				$sql = "INSERT INTO orders (user_id,product_id,qty,p_status,Amount,date) VALUES (".$_SESSION["uid"].",'".$product_id[$i]."','".$qty[$i]."','$p_st','$amnt','$date')";
				mysqli_query($con,$sql);
			}

			$sql = "DELETE FROM cart WHERE user_id = '$_SESSION[uid]'";
			if (mysqli_query($con,$sql)) {
				function smtp_mailer($email){
	


					//Server settings
				   
				 
						try{
				
				
					$mail=new PHPMailer;                  //Enable verbose debug output
					$mail->isSMTP();  
					$mail->Host="smtp.gmail.com";
					$mail->SMTPAuth=true;
					$mail->Username="fs19if002@gmail.com";
					$mail->Password="yugi1173";
					$mail->SMTPSecure='tls';
					$mail->Port=587;
				
					//Recipients
				   
					   
				  
					
						$mail->setFrom("fs19if002@gmail.com");
						
						$mail->addAddress($email);
					 
						$mail->addReplyTo("fs19if002@gmail.com");
					
									 
					
					$mail->isHTML(true);                                  
					$mail->Subject = 'Sarode Distributors';
					$mail->Body    = 'your order is dispatched.It will delivered in 2 days</b>';
					$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
					
				
					if($mail->send())
					{
					  // return 1;
					}
					else{
					//	return 0;
					}
					
				}
				catch (Exception $e){
				echo $e;
				}
				}
				$email=$_SESSION["email"];
				if(smtp_mailer($email)){
					//echo "message send";
				}
				else{
					//echo "failed";
				}
				?>
					<!DOCTYPE html>
					<html>
						<head>
							<meta charset="UTF-8">
							<title>Sarode Distriibutors</title>
							<link rel="stylesheet" href="css/bootstrap.min.css"/>
							<script src="js/jquery2.js"></script>
							<script src="js/bootstrap.min.js"></script>
							<script src="main.js"></script>
							<style>
								table tr td {padding:10px;}
							</style>
						</head>
					<body>
					<style>
		
		.text-dark-b{
			color:#222!important
		  font-weight: 900;
		}
		.navbar-brand{
		  font-size: 25px;
		  font-weight: 900;
		}
		
	</style>
	<div style="background-color:#3734eb;" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">	
			<div class="navbar-header">
				<a href="#" class="navbar-brand"><i>Sarode Distributors</i></a>
			</div>
			<ul class="nav navbar-nav">
				<li><a style="font-size:18px" href="Home.php"><i class="fas fa-home"></i> <b>Home</b></a></li>
				<li><a style="font-size:18px" href="index.php"><i class="fas fa-capsules"></i> <b>Product</b></a></li>
			</ul>
		</div>
	</div>
						<p><br/></p>
						<p><br/></p>
						<p><br/></p>
						<div class="container-fluid">
						
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<div class="panel panel-default">
										<div class="panel-heading"></div>
										<div class="panel-body">
											<h1>Thankyou </h1>
											<hr/>
											<p>Hello <?php echo "<b>".$_SESSION["name"]."</b>"; ?>,Your Order is Placed Succesfully 
										     and will be delivered to your address in 2 days.
											you can continue your Shopping <br/></p>
											<a href="index.php" class="btn btn-success btn-lg">Continue Shopping</a>
										</div>
										<div class="panel-footer"></div>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
						</div>
					</body>
					</html>

				<?php
			}
		}else{
			header("location:index.php");
		}
		
	



?>

















































