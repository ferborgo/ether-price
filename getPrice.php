<?php

	$url = 'https://ethereumprice.org/';
	$content = file_get_contents($url);
	libxml_use_internal_errors(true);
	$doc = new DOMDocument();
	$doc->loadHtml($content);

	$raised = explode("\n", trim($doc->getElementById('coin-price')->nodeValue))[0];

	echo $raised;
?>
