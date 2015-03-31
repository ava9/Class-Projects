<!DOCTYPE html>
<!-- DO I MAKE MYSELF CLEAR?! -->
<html>
	<head>
		<title>Growing Together - Contact</title>
		<?php require 'headerStylesContact.php' ?>
	</head>
	<body>
		<?php require 'menuContact.php' ?>
		<div class="content">
			<div class="body-text">
				Thank you for sending us feedback! We appreciate you taking the time to give us your thoughts on the festival.<br><br>
				<table class="contact-form">					
					<tr>
						<td>				 
							Name
						</td>
						<td>
							<?php echo $name; ?>
						</td>
					</tr>
					<tr>
						<td>
							Gender
						</td>
						<td>				 
							<?php echo $gender; ?>
						</td>				 
					</tr>
					<tr>
						<td>
							Email
						</td>
						<td>
							<?php echo $email; ?>
						</td>
					</tr>
					<tr>
						<td>
							Phone Number 
						</td>
						<td>
							<?php echo $phone; ?>
						</td>
					</tr>
					<tr>
						<td>
							Message 
						</td>
						<td>
							<?php echo $message; ?>
						</td>
					</tr>
				</table><br>
				If any of this information is inaccurate, please feel free to resubmit the form or send us a direct email, at <a href="mailto:sheabelsky@gmail.com">sheabelsky@gmail.com</a>.<br>
			</div>
		</div>
	</body>
</html>