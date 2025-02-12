<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
	<xsl:variable name="xml_id" select="//@xml:id"/>
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="mystyle.css"></link>
				<link rel="import" href="import.html"/>
				<script src="jquery-3.7.1.min.js"></script>
				<script src="utils.js"></script>
			</head>
			<body>
				<div class="dummyHeader"></div>
				<!--<xsl:apply-templates select="//tei:titlePart" mode="header"/>-->
				<div class="title">
				<xsl:apply-templates select="//tei:titleStmt/tei:title" mode="header"/>
				</div>
				<!--<input id="transcription-checkbox" type="checkbox">Greek text</input>
				<input id="diplomatic-checkbox" type="checkbox">English translation</input>-->
				<xsl:apply-templates select="node()|@*"/>
			</body>
		</html>


<!--        <xsl:variable translation select="document('translation')"/>-->
ååara
	</xsl:template>


    

	<!--<xsl:template match="tei:titlePart" mode="header">
		<h3>
		<xsl:value-of select="concat($xml_id, 'hejhej')"/>
			<xsl:value-of select="."/>
		</h3>
	</xsl:template>-->
	<xsl:template match="//tei:titleStmt/tei:title" mode="header">
		<h2>
			<xsl:value-of select="."/>
		</h2>

        <xsl:variable name="witli" select="document(concat(substring-before($xml_id, '01'), '_App.xml'))//tei:listWit"/>
            <h3>Manuscripts</h3>
		<xsl:for-each select="$witli/tei:witness">

		    <xsl:element name="abbreviation">
                <xsl:value-of select="./@xml:id"/>
			</xsl:element>
			:
			<xsl:element name="manuscript">
                <xsl:value-of select="."/>
			</xsl:element>
			<br/>
		</xsl:for-each>

	</xsl:template>
	<xsl:template match="//tei:div/tei:div">
		<xsl:apply-templates select="tei:ab"/>
	</xsl:template>
	<xsl:template match="tei:fileDesc"/>
	<xsl:template match="tei:pb">
		<xsl:value-of select="concat('[','Page ',./@n,']')"/>
	</xsl:template>
	<xsl:template match="//tei:ab">
		<!--<h3>-->
		<!--<xsl:value-of select="substring(./@xml:id,1,string-length(./@xml:id)-2)"/>-->
		<!--<xsl:value-of select="."/></h3>-->
		<xsl:for-each select="tei:seg">
			<xsl:variable name="id">
								<xsl:value-of select="./@xml:id"/>
							</xsl:variable>
<!--			<xsl:choose>
				<xsl:when test="@type='descriptiveItem'">
					<div class="headerBlock">
						<div class="innerTextBlock">
							<xsl:apply-templates/>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>-->
					<div class="popup textBlock"><!-- onclick="show(this)">
						<div class="innerTextBlock">-->
							<xsl:apply-templates/>
						
							<span class="popuptext">
								<h2>Relations</h2>
								<xsl:for-each select="//tei:relation[@active=$id]">
Is related to

									<xsl:value-of select="@passive"/>
									<br/>
								</xsl:for-each>
							</span>
						</div>
					<!--</div>-->
<!--				</xsl:otherwise>
			</xsl:choose>-->
			<!--<xsl:variable name="witnesses" select="document('C:\Users\pontu\GNOMIKA\xslt\sawsEdGr.E-Apophthegmata.sawsEd_App.xml')//tei:listWit"/>-->
			<div class="apparat_wrapper">
			<xsl:variable name="appara" select="document(concat(substring-before($xml_id, '01'), '_App.xml'))//tei:app[@loc=concat('sawsCTS:greekLit:sawsEdGr.E-Apophthegmata.sawsEd01:',$id)]"/>
			<xsl:for-each select="$appara">
			    
				<xsl:element name="lemma">
				<xsl:value-of select="./tei:lem"/>	
				</xsl:element>
				
					<xsl:variable name="arr" select="tokenize(./tei:lem/@wit, ' ')"/>
			        <xsl:for-each select="$arr">
					<xsl:element name="wit">
					 <xsl:value-of select="substring-after(., '#')"/>
					 <!--<xsl:value-of select="BU"/>-->
					 <!--<xsl:variable name="witloc" select="substring-after(., '#')"/>
						<xsl:value-of select="document('C:\Users\pontu\GNOMIKA\xslt\sawsEdGr.E-Apophthegmata.sawsEd_App.xml')//tei:listWit/tei:witness[@xml:id=$witloc]"/>-->
				    </xsl:element>
					</xsl:for-each>	
					<xsl:if test="./tei:rdg or ./tei:note">:</xsl:if>
				<xsl:for-each select="./tei:rdg">
			    	<xsl:element name="rdg">
				        <xsl:value-of select="."/>
			        </xsl:element>
			        
					<xsl:variable name="arr" select="tokenize(./@wit, ' ')"/>
			        <xsl:for-each select="$arr">
					<xsl:element name="wit">
					 <xsl:value-of select="substring-after(., '#')"/>
					 <!--<xsl:value-of select="BU"/>-->
					 <!--<xsl:variable name="witloc" select="substring-after(., '#')"/>
						<xsl:value-of select="document('C:\Users\pontu\GNOMIKA\xslt\sawsEdGr.E-Apophthegmata.sawsEd_App.xml')//tei:listWit/tei:witness[@xml:id=$witloc]"/>-->
				    </xsl:element>
					</xsl:for-each>	
			    </xsl:for-each>
				
			  <xsl:for-each select="./tei:note">
			    <xsl:element name="note">
				<xsl:value-of select="."/>	
				</xsl:element>
				<br/>
			  </xsl:for-each>
			 
			


            

			

			<!-- 
			
			 <app loc="sawsCTS:greekLit:sawsEdGr.E-Apophthegmata.sawsEd01:div1.Epaminondas.ci3">
                                <lem wit="#GV">Ὁ αὐτὸς</lem>
                                <rdg wit="#GV">Ὁ αὐτὸς (post Epaminondam)</rdg>
                                <rdg wit="#ApG_Par #ApG_Vat #ApG_Laur">Ὁ αὐτὸς (post Theophrastum)</rdg>
                                <rdg wit="#FC #FV #FL #FM">Θεόφραστος</rdg>
                                <note/>
                            </app>
			
			 -->
		</xsl:for-each>
		</div>
		</xsl:for-each>
	</xsl:template>

    

    <xsl:template match="tei:w | tei:name">
        <xsl:value-of select="."/>
        <xsl:if test="following-sibling::node()[1][normalize-space(self::text()) = '']">
        <xsl:value-of select="' '"/>
        </xsl:if>

    </xsl:template>
	<xsl:template match="tei:supplied">
	    <xsl:value-of select="concat('[', ., ']')"/>
	</xsl:template>
	<xsl:template match="tei:lb">
	    <br/>
	</xsl:template>
	<xsl:template match="tei:choice">
		<xsl:variable name="transcription">
			<xsl:value-of select="tei:orig/text()"/>
		</xsl:variable>
		<!-- <xsl:variable name="diplomatic"><xsl:value-of select="tei:reg/text()"/></xsl:variable> -->
		<xsl:if test="$transcription">
			<div class="editionWrapper">
				<div class="transcription">
					<xsl:value-of select="tei:orig"/>
					<xsl:apply-templates select="tei:note"/>
				</div>
			</div>
		</xsl:if>
		<xsl:apply-templates select="tei:reg"/>
	</xsl:template>
	<xsl:template match="tei:orig">
		<div class="editionWrapper">
			<div class="transcription">
				<xsl:value-of select="normalize-space()"/>
			</div>
		</div>
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
		<xsl:choose>
			<xsl:when test=". = ''"/>
			<xsl:otherwise>
				<button onclick="event.stopPropagation(); myFunction(this);">*</button>
				<div class="hide">
					<xsl:value-of select="."/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>