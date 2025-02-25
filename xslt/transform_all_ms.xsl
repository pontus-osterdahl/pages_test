<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">

<xsl:template name="parse_ms">
   <xsl:param name="file"/>

   <xsl:copy-of select="$file/TEI/node()"/>

</xsl:template>

	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="mystyle.css"></link>
				<link rel="import" href="import.html"/>
				<script src="jquery-3.7.1.min.js"></script>
				<script src="utils.js"></script>
			</head>
			<body>
				<div class="dummyHeader">
						<xsl:copy-of select="document(document('doc-list.xml')//file/@src)/TEI/node()"/>
					 							
                            <xsl:with-param name="file" select = "." />
                        </xsl:call-template>
                    </xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
	</xsl:stylesheet>










