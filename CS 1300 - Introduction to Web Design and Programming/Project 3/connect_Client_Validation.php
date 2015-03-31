<?php
	$name = $gender = $email = $phone = $org = $intent = $message = "";
	$nameerror = $gendererror = $emailerror = $phoneerror = $orgerror = $intenterror = $messageerror = "";
	$headermessage="<h3>Submit a form to reach me directly!</h3>";
	$regex = "/^(\d[\s-]?)?[\(\[\s-]{0,2}?\d{3}[\)\]\s-]{0,2}?\d{3}[\s-]?\d{4}$/i";

	if (isset($_POST['submit'])){
		if (isset($_POST['name'])){
			$name = htmlspecialchars($_POST['name']);	
		}
		if (isset($_POST['gender'])){
			$gender = htmlspecialchars($_POST['gender']);	
		}
		if (isset($_POST['email'])){
			$email = htmlspecialchars($_POST['email']);	
		}
		if (isset($_POST['phone'])){
			$phone = htmlspecialchars($_POST['phone']);	
		}
		if (isset($_POST['org'])){
			$org = htmlspecialchars($_POST['org']);	
		}
		if (isset($_POST['intent'])){
			$intent = htmlspecialchars($_POST['intent']);	
		}
		if (isset($_POST['message'])){
			$message = htmlspecialchars($_POST['message']);	
		}
	    if (empty($name)){
	    	$nameerror = "<div class='error'>*Name is missing</div>";
	    }
	    if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
	    	$nameerror = "<div class='error'>*Only letters and white space allowed</div>";
	    }
	    if (empty($gender)){
	   		$gendererror = "<div class='error'>*Gender is missing</div>";
	   	}
	    if (empty($email)){
	        $emailerror = "<div class='error'>*Email is missing</div>";
	    }
		if (!filter_var($email,FILTER_VALIDATE_EMAIL)){
	        $emailerror = "<div class='error'>*Email is not valid</div>";
	    }
	    if (empty($phone)){
	    	$phoneerror = "<div class='error'>*Phone number is missing</div>";
	    }
	    if (!preg_match($regex, $phone)){
	    	$phoneerror = "<div class='error'>*Phone number should be 10 digits</div>";
	    }
	    if (empty($org)){
	    	$orgerror = "<div class='error'>*Organization URL is missing</div>";
	    }
	    if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$org)) {
	    	$orgerror = "<div class='error'>*Not a valid URL</div>";
	    }
	    if (empty($intent)){
	    	$intenterror = "<div class='error'>*Intent is missing</div>";
	    }
	    if (empty($message)){
	    	$messageerror = "<div class='error'>*Message is missing</div>";
	    }
	    if (strlen($message) > 500 ){
	     	$messageerror = "<div class='error'>*Message is not less than 500 characters</div>";
	    }
	    if (empty($nameerror) && empty($gendererror) && empty($emailerror) && empty($phoneerror) && empty($orgerror) && empty($intenterror) && empty($messageerror)) {
			$headermessage = "<h3>
				Thanks for submitting, $name! </h3>
				<p><br>Submitted Information:
					<br>Name: $name
					<br>Gender: $gender
					<br>Email: $email
					<br>Phone: $phone
					<br>Organization: $org
					<br>Intent: $intent
					<br>Message: $message</p>";
			$name="";
			$gender="";
			$email="";
			$phone="";
			$org="";
			$intent="";
	        $message="";
		}
		else{
			$headermessage	 = "<h3>Please correct form errors</h3>";
		}
	}
?>


<!DOCTYPE HTML>

<html>
	<head>
		<meta charset="UTF-8">
		<title>My Work</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body class="body">
		 <div class="menu">
		 <?php include 'menu.php'; ?>
		</div>
		<br />
		<section id="about">
		<h2 id="networking">Networking</h2>
		<ul class="networkPara">	
			<li>
				I welcome anyone I may have networked with or who share similar career interests to join my 
				<a href="https://www.linkedin.com/in/adityaagashe">LinkedIn</a> network.  	
			</li>
			<li>
				I encourage conversation and/or resume requests through <a>ava9@cornell.edu</a>	
			</li>
		</ul>
		</section>
		<?php echo $headermessage ?>
		<br>
		<form action="connect.php" method="POST">
	  		<div>
	    		<label for="name">Name:</label>
	    		<input id="name" type="text" name="name" required value="<?php echo $name ?>"/>
	    		<?php echo $nameerror ?>
	  		</div>
	  		<br>
	  		<div>
	    		<label for="gender">Gender:</label>
	    		<input id="gender" type="radio" name="gender" <?php if (isset($gender) && $gender=="male") echo "checked";?> value="male" required>Male
				<input id="gender" type="radio" name="gender" <?php if (isset($gender) && $gender=="female") echo "checked";?> value="female" required>Female
	    		<?php echo $gendererror ?>
	  		</div>
	  		<br>
			<div>
				<label for="mail">E-mail:</label>
				<input id="mail" type="email" name="email" required placeholder="name@email.com" value="<?php echo $email ?>"/>
				<?php echo $emailerror ?>
			</div>
			<br>
			<div>
				<label for="phone">Phone:</label>
				<input id="phone" type="tel" name="phone" required value="<?php echo $phone ?>"/>
				<?php echo $phoneerror ?>
			</div>
			<br>
			<div>
				<label for="org">Organization:</label>
				<input id="org" type="url" name="org" required pattern="https?://.+" placeholder="https://www.example.com" value="<?php echo $org ?>"/>
				<?php echo $orgerror ?>
			</div>
			<br>
			<div>
				<label for="intent">Intent:</label>
				<input id="intent" type="radio" name="intent" value="Recruiting" required
					<?php if (isset($intent) && $intent=="Recruiting") echo "checked";?>>Recruiting
				<input id="intent" type="radio" name="intent" value="Project Question" required
						<?php if (isset($intent) && $intent=="Project Question") echo "checked";?>>Project Question
				<input id="intent" type="radio" name="intent" value="General Inquiry" required
						<?php if (isset($intent) && $intent=="General Inquiry") echo "checked";?>>General Inquiry
				<?php echo $intenterror ?>
			</div>
			<br>
	  		<div>
	    		<label for="message">Message:</label>
	    		<textarea id="message" name="message" rows="5" cols="40" required placeholder="Please enter your message here." ><?php echo $message ?></textarea>
	     		<?php echo $messageerror ?>
	  		</div>
	  		<br>
  			<div class="button">
    			<button type="submit" name="submit">Send your message</button>
  			</div>
		</form>
	</body>
</html>
