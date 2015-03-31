<?php
	$aboutActive = 	$contactActive = $directionsActive = $indexActive = $servicesActive = $testimonialsActive = '';
	$mobileAboutActive = 	$mobileContactActive = $mobileDirectionsActive = $mobileIndexActive = $mobileServicesActive = $mobileTestimonialsActive = '';
	if ($currentPage == 'about.php') {
		$aboutActive = 'active';
		$mobileAboutActive = 'mobile-active';
	}
	if ($currentPage == 'contact.php') {
		$contactActive = 'active';
		$mobileContactActive = 'mobile-active';
	}
	if ($currentPage == 'directions.php') {
		$directionsActive = 'active';
		$mobileDirectionsActive = 'mobile-active';
	}
	if ($currentPage == 'index.php') {
		$indexActive = 'active';
		$mobileIndexActive = 'mobile-active';
	}
	if ($currentPage == 'services.php') {
		$servicesActive = 'active';
		$mobileServicesActive = 'mobile-active';
	}
	if ($currentPage == 'testimonials.php') {
		$testimonialsActive = 'active';
		$mobileTestimonialsActive = 'mobile-active';
	}
	print ("<div class='logo'>
			<img src='img/feliciaLogo.jpg' class='logo-img' alt='' />
		</div>
		<div class='menu-container'>
			<div class='menu'>
				<nav>
					<ul class='menuJS'>
						<li>
							<div class='menu-btn home-btn'>
								<a href='index.php' class='menu-link $indexActive'>Home</a>
							</div>
						</li>
						<li>
							<div class='menu-btn serv-btn'>
								<a href='services.php' class='menu-link $servicesActive'>Services</a>
							</div>
						</li>
						<li>
							<div class='menu-btn about-btn'>
								<a href='about.php' class='menu-link $aboutActive'>About Me</a>
							</div>
						</li>
						<li>
							<div class='menu-btn testim-btn'>
								<a href='testimonials.php' class='menu-link $testimonialsActive'>Testimonials</a>
							</div>
						</li>
						<li>
							<div class='menu-btn direct-btn'>
								<a href='directions.php' class='menu-link $directionsActive'>Getting Here</a>
							</div>
						</li>
						<li>
							<div class='menu-btn contact-btn'>
								<a href='contact.php' class='menu-link $contactActive'>Contact</a>
							</div>
						</li>
					</ul>
				</div>
				<div class='mobile-menu'>
					<ul>
						<li><a href='index.php' class='mobile-link $mobileIndexActive'>Home</a> | </li>
						<li><a href='services.php' class='mobile-link $mobileServicesActive'>Services</a> | </li>
						<li><a href='about.php' class='mobile-link $mobileAboutActive'>About Me</strong></a> | </li>
						<li><a href='testimonials.php' class='mobile-link $mobileTestimonialsActive'>Testimonials</a> | </li>
						<li><a href='directions.php' class='mobile-link $mobileDirectionsActive'>Getting Here</a> | </li>
						<li><a href='contact.php' class='mobile-link $mobileContactActive'>Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
		");
?>