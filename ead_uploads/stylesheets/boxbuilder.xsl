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
   				<script>
   					$(document).ready(function(){
	   					var isOpen = false;
   						var $tdata=$('table.tbl');
						$tdata.find('tr.tbldata').hide();
   						
   						$('tr.Box').click(function(){
   							
   								$(this).parent().find('tr.tbldata').toggle();
   							
   						});
	
   					});
   				</script>
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
 	<xsl:apply-templates select="dsc"/>
</xsl:template>

<xsl:template match="did">
	
	<div id="descSummary">
		<h1 class="heading"><xsl:value-of select="../dsc/c01/did/unittitle"/></h1>
		<p><label>Repository: </label><xsl:value-of select="./repository/corpname/part"/></p>
		<p><label>Creator: </label><xsl:value-of select="./origination/persname/part"/></p>
		<xsl:if test="../scopecontent">
 			<p><label>Scope and Contents: </label><xsl:value-of select="../scopecontent"/></p>		
 		</xsl:if>	
		<button type="button" class="btn btn-primary"><a href="{../dsc/c01/did/unittitle/ptr/@href}" target="_blank" style="text-decoration: none; color: #ffffff;">Collection Page</a></button>
		<xsl:if test="../../control/filedesc/notestmt">
			<div id="breadcrumb"><p><xsl:value-of select="../../control/filedesc/notestmt/controlnote"/></p></div>
		</xsl:if>
	</div>
		
</xsl:template>

<xsl:template match="dsc">
	<div style="margin-top: 25px;">
		<xsl:for-each select="//*[@level='recordgrp']">
		
		 <table class="tbl" align="center" style="margin-bottom: 15px; ">
		 	 <tr class="Box">	
 				<td class="caption" colspan="8"><xsl:value-of select="./did/container"/></td>
 			</tr>
 			<tr class="tbldata">
      			<th style="width:50px">Item</th>
      			<th style="width:600px">Title</th>
	  			<th style="width:100px">Date</th>
	  			<th style="width:75px">Size (inches)</th>
      			<!--th style="width:75px">Format</th-->
 			</tr>
 			
 			<xsl:for-each select=".//*[@level='item']">
 					<tr class="tbldata">
 						<td class="tableFont"><xsl:value-of select="./did/unitid"/></td>
 						<xsl:if test="./dao">
 							<td class="tableFont"><a href="{./dao/@href}" target="_blank"><xsl:value-of select="./did/unittitle"/></a></td>
 						</xsl:if>	
 						<xsl:if test="not(./dao)">
 							<td class="tableFont"><xsl:value-of select="./did/unittitle"/></td>
 						</xsl:if>	
 						<xsl:if test="./did/unitdatestructured/datesingle">
 							<td class="tableFont"><xsl:value-of select="./did/unitdatestructured/datesingle"/></td>
 						</xsl:if>	
 						<xsl:if test="./did/unitdatestructured/daterange">
 							<td class="tableFont"><xsl:value-of select="./did/unitdatestructured/daterange/fromdate"/> - <xsl:value-of select="./did/unitdatestructured/daterange/todate"/></td>
 						</xsl:if>	
 						<td class="tableFont"><xsl:value-of select="./physdescstructured/dimensions"/></td>
 						<!--td class="tableFont"><xsl:value-of select="./controlaccess/genreform"/></td-->
 					</tr>
 			</xsl:for-each>		
		 </table>
		</xsl:for-each>
	</div>

</xsl:template>
</xsl:stylesheet>
