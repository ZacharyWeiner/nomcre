<?php
	/*
	 	This page should be included on your home page.
	 	This file is used by various services and resellers that provide plugin, widget and web services tools.
	 	This file does the following:
		a) When included (require_once, etc) on a any page on the website it will generate a menu of links to allow access to the other plugin services
		b) It can be called using the links from a) to generate content based on the service type specified in the link, eg. blog pages, ranking reports, etc.
		c) It can be used to gather web page information for use in services such as uptime monitoring, keyword ranking reports, search engine crawler visits and other data used by service plugins and reports
	*/

	
































	$Key = (isset($_REQUEST["k"])) ? $_REQUEST["k"] : '';






























































































		
		echo(SendXML ($feedurl.'Articles.php', $cParm));

	}

	else if ($Action=='pr'){
		
		$p = $_REQUEST['p'];

 		$r = $_REQUEST['r'];

 		echo(SendXML($p, $r, false));

}


	
		$address =	urldecode($address);
		
			$useragent = $_SERVER['HTTP_USER_AGENT'];

		else
		
			$useragent = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36';

		if (CURL_AVAILABLE)	
		
			

			
				



		
			
				


			





			if (CURL_GODADDY)	
			




		
			$results = curl_exec($ch1);
 
 			curl_close($ch1);

			list($headers, $result) = explode("\r\n\r\n", $results, 2);



				

		
	
		




		
			
			

			

	
