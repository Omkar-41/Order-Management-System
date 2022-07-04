<?php
include('db.php');
session_start();
if(isset($_POST['change1'])){
$cemail=$_POST['txtn'];
$pwd=md5($_POST['txtp']);
$query="select *from user_info where email='$cemail'";
$result=mysqli_query($con,$query);
$num=mysqli_fetch_array($result);
if($num>0){
	mysqli_query($con,"update user_info set password='$pwd' where email='$cemail'");
	$_SESSION['email']=$cemail;
	echo"<script>alert('password updated successfully')</script>";
}else{
	echo'<script>alert("please provide correct email id")</script>';
}
}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sarode Distributors</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<script src="js/jquery2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="main.js"></script>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
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
			<div class="col-md-8" id="signup_msg">
				<!--Alert from signup form-->
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">Change Password</div>
					<div class="panel-body">
						<!--User Login Form-->
						<form action="" method="post">
							<label for="email">Email</label>
							<input type="email" class="form-control" name="txtn" id="email" required/>
							<label for="password"> New Password</label>
							<input type="password" id="password" name="txtp"class="form-control" required>
							<input type="submit" class="btn btn-success" style="float:right;" Value="change" name="change1">					
						</form>
				</div>
				<div class="panel-footer"><div id="e_msg"></div></div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
</body>
</html>




