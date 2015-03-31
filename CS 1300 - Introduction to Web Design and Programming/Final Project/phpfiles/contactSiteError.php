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
				<?php
					echo "There seems to be an error or two with your feedback form.<br><br>";
					echo "Please correct the errors that appear below, and resubmit your form.<br><br>"; 
					echo $error."<br>";
					echo "Thank you!<br>";
				?>
			</div>
		</div>
	</body>
</html>
