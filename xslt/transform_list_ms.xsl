<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
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

                <div class="dropdown">
				<button class="dropbtn">Text witnesses</button>
				<div class="dropdown-content">
				<xsl:for-each select="//tei:TEI">
                                                <button>
								    <xsl:attribute name="class">toggleButton</xsl:attribute>
						    <xsl:attribute name="value">
						        <xsl:value-of select="@xml:id"/>
						    </xsl:attribute>
							<xsl:value-of select=".//tei:titleStmt/tei:title"/>
						</button>
					    </xsl:for-each>
                </div>
			</div>   
				<div class="main_b">
<!--				<div class="title">-->
				<!--<xsl:apply-templates select="//tei:titleStmt/tei:title" mode="header"/>-->
				<!--<input id="transcription-checkbox" type="checkbox">Diplomatic</input>
				<input id="diplomatic-checkbox" type="checkbox">Transcription</input>-->
				<!--</div>-->
				<!--<xsl:apply-templates select="node()|@*"/>-->
					
					<xsl:apply-templates select="//tei:TEI"/>
			    </div>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="tei:TEI/@*"/>
	
	<xsl:template match="tei:TEI">
		<div class="flex-container display-none">
		<xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
		</xsl:attribute>
<xsl:apply-templates select="node()|@*"/>
		</div>
	</xsl:template>
	<xsl:template match="tei:titlePart">
		<h3>
			<xsl:value-of select="."/>
		</h3>
	</xsl:template>
	<xsl:template match="//tei:titleStmt/tei:title" mode="header">
		<h2>
			<xsl:value-of select="."/>
		</h2>
	</xsl:template>
	<xsl:template match="//tei:div/tei:div">
		<xsl:apply-templates select="tei:ab"/>
	</xsl:template>
	<xsl:template match="tei:fileDesc"/>
	<xsl:template match="tei:pb">
		<xsl:value-of select="concat('[','Page ',./@n,']')"/>
	</xsl:template>
	<xsl:template match="//tei:ab">
		<!--<xsl:value-of select="."/></h3>-->
		<xsl:for-each select="tei:seg">
		    <xsl:variable name="id">
<!--		        <xsl:value-of select="concat('#', ./@xml:id)"/> -->
                <xsl:value-of select="./@xml:id"/>
		    </xsl:variable>
			<!-- fetch related links-->
			<!-- <xsl:for-each select="//tei:relationnPart02.Ô01.Orion01.ci2 -->
			<xsl:choose>
				<xsl:when test="@type='descriptiveItem'">
					<div class="headerBlock">
						<div class="innerTextBlock">
						    <xsl:attribute name="id">
							    <xsl:value-of select="$id"/>
							</xsl:attribute>
							<xsl:apply-templates/>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="popup textBlock" onclick="show(this)">
						<div class="innerTextBlock">
						    <xsl:attribute name="id">
							    <xsl:value-of select="$id"/>
							</xsl:attribute>
							<xsl:apply-templates/>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="tei:choice">
		<xsl:apply-templates select="tei:reg"/>
	</xsl:template>
	<xsl:template match="tei:reg">
		<div class="editionWrapper">
			<div class="diplomatic">
				<xsl:value-of select="normalize-space()"/>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="tei:hi">
		<b>
			<xsl:value-of select="."/>
		</b>
	</xsl:template>
	<xsl:template match="tei:expan">
(

		<xsl:value-of select="text()[1]"/>
)

		<xsl:apply-templates select="tei:ex"/>
(

		<xsl:value-of select="text()[2]"/>
)

	</xsl:template>
	<xsl:template match="tei:ex">
		<xsl:value-of select="."/>
	</xsl:template>
	<!--<xsl:template match="tei:lb"><xsl:value-of select="concat(' [',./@n,'] ')"/></xsl:template>-->
	<xsl:template match="text()">
		<xsl:value-of select="normalize-space()"/>
	</xsl:template>
	<xsl:template match="tei:note">
	<!--	<xsl:choose>
			<xsl:when test=". = ''"/>
			<xsl:otherwise>
				<button onclick="event.stopPropagation(); myFunction(this);">*</button>
				<div class="hide">
					<xsl:value-of select="."/>
				</div>
			</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>

	<xsl:template name="correct_link">
        <xsl:param name="id"/>
		<xsl:variable name="text" select="replace($id,'sawsCTS:greekLit:','')"/>
		<xsl:variable name="manuscript_file" select="substring-before($text, '.')"/>
        <xsl:variable name="local_id" select="substring-after($text, ':')"/>
        <xsl:value-of select="concat(concat($manuscript_file, '.html'), concat('#',$local_id))"/>





















































		
		
		
		
		
		
		

	</xsl:template>
</xsl:stylesheet>
