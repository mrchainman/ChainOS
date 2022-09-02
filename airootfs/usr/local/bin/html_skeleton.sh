#!/bin/sh
workdir=$(echo $PWD)
mkdir $workdir/css
mkdir $workdir/js
echo """
<!DOCTYPE html>
<html>
<head>
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
<title><++></title>
<link rel=\"stylesheet\" href=\"css/style.css\">
<script src=\"js/script.js\"></script>
</head>
<body>
""" > setup.php
echo """
<?php include 'setup.php';?>
<?php include 'main.php';?>
</body>
</html>
""" > index.php
echo """
<!--
 The main page
-->
""" > main.php
echo """
/*
 * Main CSS file
*/
""" > css/style.css
echo """
/*
 * Main JS file
*/
""" > js/script.js
