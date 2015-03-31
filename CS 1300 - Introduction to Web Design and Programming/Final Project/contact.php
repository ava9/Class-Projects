<!DOCTYPE html>
<html>
	<head>
		<?php require 'phpfiles/headerStyles.php' ?>
		<title>Growing Together - Contact</title>
	</head>
	<body>
		<?php 
			$currentPage = basename($_SERVER['PHP_SELF']);
			require 'phpfiles/menu.php';
			$name = $gender = $email = $phone = $message = $comments = "";
			$nameerror = $gendererror = $emailerror = $phoneerror = $messageerror = "";
			$headermessage="<h3>Submit a form to reach me directly!</h3>";
		?>
		<div class="content">
			<div class="body-text">	
				<?php
					$name = $gender = $email = $phone = $message = "";
					$nameerror = $gendererror = $emailerror = $phoneerror = $messageerror = "";
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
					    if (empty($message)){
					    	$messageerror = "<div class='error'>*Message is missing</div>";
					    }
					    if (strlen($message) > 500 ){
					     	$messageerror = "<div class='error'>*Message is not less than 500 characters</div>";
					    }
					    if (empty($nameerror) && empty($gendererror) && empty($emailerror) && empty($phoneerror) && empty($messageerror)) {
							$headermessage = "<h3>
								Thanks for submitting, $name! </h3>
								<p><br>Submitted Information:
									<br>Name: $name
									<br>Gender: $gender
									<br>Email: $email
									<br>Phone: $phone
									<br>Message: $message</p>";
							$name="";
							$gender="";
							$email="";
							$phone="";
					        $message="";
						}
						else{
							$headermessage	 = "<h3>Please correct form errors</h3>";
						}
					}
				?>
				<?php echo $headermessage ?>
				<br>
				<form action="contact.php" method="POST">
					<div>
						<label for="name">Name:</label>
						<input id="name" type="text" placeholder="enter your name!" name="name" required value="<?php echo $name ?>"/>
						<?php echo $nameerror ?>
					</div>
					<br>
					<div>
						<label for="gender">Gender of child:</label>
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
						<input id="phone" pattern="[0-9-]*" placeholder="012-345-6789" title="Numbers and daashes only" name="phone" required value="<?php echo $phone ?>"/>
						<?php echo $phoneerror ?>
					</div>
					<br>
					<div>
						<label for="message">Message:</label>
						<textarea id="message" name="message" rows="10" cols="50" required placeholder="Please enter your message here." ><?php echo $message ?></textarea>
						<?php echo $messageerror ?>
					</div>
					<br>
					<div class="button">
						<button type="submit" name="submit">Send your message</button>
					</div>
				</form>
			</div>
		</div>
		<?php require 'phpfiles/footer.php' ?>
	</body>
</html>