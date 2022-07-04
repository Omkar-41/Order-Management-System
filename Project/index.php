<?php
require "config/constants.php";
session_start();
if(isset($_SESSION["uid"])){
	header("location:profile.php");
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
		
		<style></style>
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
<div class="wait overlay">
	<div class="loader"></div>
</div>
	<div style="background-color:#3734eb;" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">	
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse" aria-expanded="false">
					<span class="sr-only">navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand text-dark-b"><i>Sarode Distributors</i></a>
			</div>
		<div style="background-color:#3734eb;" class="collapse navbar-collapse" id="collapse">
			<ul class="nav navbar-nav">
				<li><a style="font-size:18px" class="text-dark-b" href="Home.php"><i class="fas fa-home"></i> <b>Home</b></a></li>
				<li><a style="font-size:18px" class="text-dark-b" href="index.php"><i class="fas fa-capsules"></i> <b>Product</b></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" style="font-size:18px" class="dropdown-toggle text-dark-b" data-toggle="dropdown"><i class="fas fa-shopping-cart"></i> <b>Cart</b><span class="badge">0</span></a>
					<div class="dropdown-menu" style="width:400px;">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="row">
									<div class="col-md-3">Sl.No</div>
									<div class="col-md-3">Product Image </div>
									<div class="col-md-3">Product Name</div>
									<div class="col-md-3">Price in <?php echo CURRENCY; ?></div>
								</div>
							</div>
							<div class="panel-body">
								<div id="cart_product">
								
								</div>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</li>
				<li><a href="#" style="font-size:18px" class="dropdown-toggle text-dark-b" data-toggle="dropdown"><i class="fas fa-sign-in-alt"></i> <b>SignIn</b></a>
					<ul style="background-color:#3734eb;" class="dropdown-menu">
						<div style="width:300px;">
							<div class="panel panel-primary ">
								<div style="background-color:#3734eb;" class="panel-heading">Login</div>
								<div style="background-color:#3734eb;" class="panel-heading">
									<form style="background-color:#3734eb;" onsubmit="return false" id="login">
										<label style="background-color:#3734eb;" for="email">Email</label>
										<input type="email" class="form-control" name="email" id="email" required/>
										<label for="email">Password</label>
										<input type="password" class="form-control" name="password" id="password" required/>
										<p><br/></p>
										<a href="forgot-password.php" style="color:white; list-style:none;">Forgotten Password</a><input type="submit" class="btn btn-success" style="float:right;">
									</form>
								</div>
								<div class="panel-footer" id="e_msg"></div>
							</div>
						</div>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>	
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-xs-12">
				<div id="get_category">
				</div>
				
				<div id="get_brand">
				</div>
				
			</div>
			<div class="col-md-8 col-xs-12">
				<div class="row">
					<div class="col-md-12 col-xs-12" id="product_msg">
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">Products</div>
					<div class="panel-body">
						<div id="get_product">
							<!--Here we get product jquery Ajax Request-->
						</div>
						
					</div>
					<div class="panel-footer">&copy; 2021</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>
















































