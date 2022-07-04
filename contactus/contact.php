<?php
include('database.inc.php');
$msg="";
if(isset($_POST['submit'])){
	$name=mysqli_real_escape_string($con,$_POST['name']);
	$email=mysqli_real_escape_string($con,$_POST['email']);
	$mobile=mysqli_real_escape_string($con,$_POST['mobile']);
	$message=mysqli_real_escape_string($con,$_POST['message']);
	
	mysqli_query($con,"insert into contact_us(name,email,mobile,message) values('$name','$email','$mobile','$message')");
	$msg="Thanks, You will receive reply for your email Soon... ";
	$html="<table><tr><td>Full Name</td><td>$name</td></tr><tr><td>Email</td><td>$email</td></tr><tr><td>Mobile</td><td>$mobile</td></tr><tr><td>message</td><td>$message</td></tr></table>";
	include('smtp/PHPMailerAutoload.php');
	$mail=new PHPMailer(true);
	$mail->isSMTP();
	$mail->Host="smtp.gmail.com";
	$mail->Port=587;
	$mail->SMTPSecure="tls";
	$mail->SMTPAuth=true;
	$mail->Username="studything41@gmail.com";
	$mail->Password="9987333274";
	$mail->SetFrom("studything41@gmail.com");
	$mail->addAddress("studything41@gmail.com");
	$mail->IsHTML(true);
	$mail->Subject="New Contact Us";
	$mail->Body=$html;
	$mail->SMTPOptions=array('ssl'=>array(
		'verify_peer'=>false,
		'verify_peer_name'=>false,
		'allow_self_signed'=>false
	));
	if($mail->send()){
		//echo "Mail send";
	}else{
		//echo "Error occur";
	}
}
?>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/>
		<meta name="viewport"content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		<title>Sarode Distributors</title>
		<link href="css/style.css"rel="stylesheet"type="text/css"/>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" crossorigin="anonymous">
	</head>
	<body>
		<div class="contact-wrap">
			<div class="contact-in">
				<h1>Contact Info</h1>
				<h2><i class="fa fa-phone" aria-hidden="true"></i> Phone</h2>
				<p>7083975936</p>
				<h2><i class="fa fa-envelope" aria-hidden="true"></i> Email</h2>
				<p>sarodedistributors@gmail.com</p>
				<h2><i class="fa fa-map-marker" aria-hidden="true"></i> Address</h2>
				<p>Plot No.14,1st Floor,Shree Krishna Nagar,Faizpur,Tal - Yawal,Dist - Jalgoan,Pin code: 4225503</p>
			</div>
			<div class="contact-in">
				<h1>Send a Message</h1>
				<form method="post" id="frmContactus">
					<input type="text" placeholder="Full Name" id="name"  name="name" class="contact-in-input" required>
					<input type="text" placeholder="Email" id="email" name="email" class="contact-in-input" required>
					<input type="text" placeholder="Mobile" id="mobile" name="mobile" class="contact-in-input" required>
					<textarea placeholder="Message" id="message" name="message" class="contact-in-textarea" required></textarea>
					<button type="submit" class="contact-in-btn" name="submit" id="submit">Submit</button>
					<span style="color:green;"><?php echo $msg?></span>
				</form>
			</div>
			<div class="contact-in">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3720.727149219805!2d75.85182151440958!3d21.163254088550275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd9ad1d2f393d35%3A0x2123f46198566a1f!2sSARODE%20DISTRIBUTORS!5e0!3m2!1sen!2sin!4v1635349918609!5m2!1sen!2sin" width="100%" height="auto" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
		</div>
      <script>
	  if(window.history.replaceState){
		  window.history.replaceState(null,null,location.href);
	  }
	  </script>
	</body>
</html>