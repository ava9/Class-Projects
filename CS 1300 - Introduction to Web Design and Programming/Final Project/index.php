<!DOCTYPE html>
<html>
	<head>
		<?php require 'phpfiles/headerStyles.php' ?>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/expandHeadings.js"></script>
		<script src="js/responsiveslides.js"></script>
		<script>
		// You can also use "$(window).load(function() {"
		$(function () {
		  // Slideshow 1
		  $("#slider1").responsiveSlides({
			auto: true,             // Boolean: Animate automatically, true or false
			speed: 500,            // Integer: Speed of the transition, in milliseconds
			timeout: 4000,          // Integer: Time between slide transitions, in milliseconds
			pager: false,           // Boolean: Show pager, true or false
			nav: false,             // Boolean: Show navigation, true or false
		  });
		});
		</script>
		<title>Growing Together - Home</title>
	</head>
	<body>
		<?php 
			$currentPage = basename($_SERVER['PHP_SELF']);
			require 'phpfiles/menu.php';
		?>
		<div class="content">
			<div class="body-text">
				<ul class="rslides" id="slider1">
					<li><img src="img/new1.jpg" alt=""></li>
					<li><img src="img/new2.jpg" alt=""></li>
					<li><img src="img/new4.jpg" alt=""></li>
					<li><img src="img/new5.jpg" alt=""></li>
					<li><img src="img/new9.png" alt=""></li>
					<li><img src="img/8.jpg" alt=""></li>
				</ul>
				<strong>Growing Together</strong> is a speech and language therapy center specializing in treating children and young adults with speech, language and communication difficulties and disorders. Felicia Fera is the founder and head speech language pathologist in the practice. Beyond treating children with receptive and expressive speech and language delays, Growing Together specializes in treating clients with autism spectrum disorders and apraxia of speech. A small kitchen and bathroom set up are available on-site to help support clients' language abilities while performing functional life skills. 
				<div class="static-header">
					<div class="static-h2">
						<h2>Fun</h2>
					</div>
					<div class="static-content">
						<p>Therapy will be conducted in play-based activities. Therapy will be embedded within sensory and gross motor play as needed. In addition to a traditional therapy office, a separate play room is on-site for dyads to engage in supervised play together.</p>
					</div>
				</div>
				<div class="static-header">
					<div class="static-h2">
						<h2>Meaningful</h2>
					</div>
					<div class="static-content">
						<p>Your child's therapy goals will be programmed according to developmental norms and with special attention to words and concepts that are meaningful to your child and family. Your child's personal interests will be used as the context for learning.</p>
					</div>
				</div>
				<div class="static-header">
					<div class="static-h2">
						<h2>Functional</h2>
					</div>
					<div class="static-content">
						<p>Therapy goals will be taught within a functional home setting. A small kitchen and bathroom are available on-site. The neighborhood allows for the safe development of community life and language skills to develop.</p>
					</div>
				</div>
				
			</div>
		</div>
		<?php require 'phpfiles/footer.php' ?>
	</body>
</html>