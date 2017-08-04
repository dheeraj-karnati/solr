<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">
	<xsl:output method="html"/>
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
	<xsl:template match="ead">
		<html>
			<head>
				<meta charset="utf-8"/>
  				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"/>
				<!--script type="text/javascript" src="http://library.marist.edu/archives/researchcart/js/eadBox.js"></script-->
				<link rel="stylesheet" href="../stylesheets/styles/boxbuilder.css" type="text/css"/>
				<!-- Bootstrap core CSS -->
   				<link href="http://library.marist.edu/css/bootstrap.css" rel="stylesheet"/>
   				
			</head>

			<body>
				<div class="container">
					<div class="header">
						<img src="https://www.empireadc.org/sites/www.empireadc.org/files/ead_logo.gif" class="img-rounded" width="250px"/>
					</div>
  					
  						<div class="row" style="margin-top: -220px; background: #ffffff; padding-bottom: 40px;">
  							<!--div id="shell" class="col-md-12"-->
    						<div class="col-md-12">
								<xsl:apply-templates select="control"/>
 								<xsl:apply-templates select="archdesc"/>
      						<!--div id="tblOptions">
								<a href="#" class="expand">Expand All</a>
								<a href="#" class="collapse">Collapse All</a>
							</div-->
      						</div>
      						<!--/div-->
    					</div>
  				</div>
  				<!--/div-->
			</body>
		</html>
	</xsl:template>

<xsl:template match="control">
 	<xsl:apply-templates select="filedesc/titlestmt/titleproper"/>
</xsl:template>
 
<xsl:template match="titleproper">
	<h2 class="heading">
		<xsl:value-of select="."/>
	</h2>
</xsl:template>

<xsl:template match="archdesc">
	<xsl:apply-templates select="did"/>
 	
</xsl:template>

<xsl:template match="did">
	
	<div id="descSummary">
		<p><label>Repository: </label><xsl:value-of select="./repository/corpname/part"/></p>
		<p><label>Creator: </label><xsl:value-of select="./origination/persname/part"/></p>
		<xsl:if test="./unitdatestructured/datesingle">
 			<label>Date: </label><p><xsl:value-of select="./unitdatestructured/datesingle"/></p>
 		</xsl:if>	
 		<xsl:if test="./unitdatestructured/daterange">
 			<label>Date range: </label>
 			<p><xsl:value-of select="./unitdatestructured/daterange/fromdate"/> - <xsl:value-of select="./unitdatestructured/daterange/todate"/></p>
 		</xsl:if>
		<label>Extent: </label><p><xsl:value-of select="./physdescstructured"/></p>
		<label>Language of the Materials: </label><p><xsl:value-of select="./langmaterial"/></p>
 		<label>Access Restrict: </label><p><xsl:value-of select="../accessrestrict"/></p>	
 		<label>Use Restrict: </label><p><xsl:value-of select="../userestrict"/></p>	
 		<xsl:if test="../scopecontent">
 			<label>Scope and Contents: </label>
 			<xsl:for-each select="../scopecontent/p">
 				<p><xsl:value-of select="."/></p>		
 			</xsl:for-each>
 		</xsl:if>	
 		<xsl:if test="../bioghist">
			<label>Biographical History: </label>
			<xsl:for-each select="../bioghist">
 				<p><xsl:value-of select="."/></p>		
 			</xsl:for-each>
		</xsl:if>
		<xsl:if test="../controlaccess">
			<label>Subjects: </label>
			<xsl:for-each select="../controlaccess/subject">
				<p><xsl:value-of select="./part"/></p>
			</xsl:for-each>
		</xsl:if>	
	</div>
		
</xsl:template>

</xsl:stylesheet>
