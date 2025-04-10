<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">

<xsl:template name="parse_ms">
   <xsl:param name="file"/>

   <xsl:copy-of select="$file/TEI/node()"/>

</xsl:template>

	<xsl:template match="/">
		<xml>
			<!--<head>
				<link rel="stylesheet" href="mystyle.css"></link>
				<link rel="import" href="import.html"/>
				<script src="jquery-3.7.1.min.js"></script>
				<script src="utils.js"></script>
			</head>-->
			<body>
				<div class="dummyHeader">
						<xsl:copy-of select="document(document('doc-list.xml')//file)//tei:TEI"/>
				</div>
			</body>
		</xml>
	</xsl:template>
	</xsl:stylesheet>










