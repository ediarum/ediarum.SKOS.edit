<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:user="http://tempuri.org/msxsl"
	xmlns:telota="http://www.telota.de" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//DE" indent="yes"/>
	<xsl:param name="framework"/>
	<xsl:variable name="ediarum_project_name"/>
	<xsl:key name="broaderByObject" match="skos:broader" use="@rdf:resource"/>

	
	<xsl:template match="/">
		<xsl:result-document href="{$framework}/resources/website.html" method="html">
			<html lang="de">
				<head>
					<meta charset="utf-8"/>
						<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
							<title><xsl:value-of select="//skos:ConceptScheme/skos:prefLabel[1]/text()"/></title>
				</head>
				<body><div style="margin: 20px;">
						<div>
							<h1><xsl:value-of select="//skos:ConceptScheme/skos:prefLabel[1]/text()"/></h1>
							<p><xsl:value-of select="count(//skos:Concept/@rdf:about)"/> Einträge</p>
						</div>
						<div
							style="display:flex;">
							<div
								style="width:70%;">
								<xsl:call-template name="all_concepts"></xsl:call-template>
							</div>
							<div>
								<xsl:call-template name="tabs"></xsl:call-template>
							</div>
						</div>
				</div>
				</body>
			</html>
		</xsl:result-document>
	</xsl:template>
	<xsl:template name="all_concepts">
		<xsl:for-each select="//skos:Concept">
			<xsl:variable name="title" select="./skos:prefLabel[1]/text()"/>
			<xsl:variable name="id" select="@rdf:about"/>
			<xsl:variable name="label_de" select="./skos:prefLabel[@xml:lang = 'de' and text()]"/>
			<xsl:variable name="label_notde" select="./skos:prefLabel[@xml:lang != 'de' and text()]"/>
			<xsl:variable name="altlabel" select="./skos:altLabel[text()]"/>
			<xsl:variable name="definition" select="./skos:definition[text()]"/>
			<xsl:variable name="groupMembership" select="./ancestor::rdf:RDF//skos:Collection//*[not(self::rdf:type) and matches(@rdf:resource, $id)]/skos:prefLabel[1]/text()"/>
			<div class="concept"
				style="margin-bottom:15px;">
				<hr class="clear"/>
				<h2 id="{$id}"><xsl:value-of select="$title"/></h2>
				<table
					class="concept"
					style="margin: 5px 5px 5px 0;text-align:left;">
					<xsl:if test="$label_de != ''">
						<tr><th>
							Bevorzugte Bezeichnung</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#prefLabel">skos:prefLabel</a></td>
							<td>
								<xsl:value-of select="$label_de/text()"/></td></tr>
					</xsl:if>
					<xsl:if test="$definition != ''">
						<tr><th>
							Definition</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#definition">skos:definition</a></td>
							<td>
								<xsl:value-of select="$definition/text()"/></td></tr>
					</xsl:if>
					<xsl:if test="$label_notde">
						<tr><th>
							Andere Sprachen</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#prefLabel">skos:prefLabel</a></td>
							<td>
								<xsl:for-each select="$label_notde">
								<p><xsl:value-of select="./text()"/> (<xsl:value-of select="@xml:lang"/>)</p>
								</xsl:for-each>
							</td></tr>
					</xsl:if>
					<xsl:if test="$altlabel">
						<tr><th>
							Alternative Bezeichnungen</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#altLabel">skos:altLabel</a></td>
							<td>
								<xsl:for-each select="$altlabel">
									<p><xsl:value-of select="./text()"/> (<xsl:value-of select="@xml:lang"/>)</p>
								</xsl:for-each>
							</td></tr>
					</xsl:if>
					<xsl:if test="./skos:narrower">
						<tr><th>
								Untergeordnete Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#narrower">skos:narrower</a></td>
								<td>
									<xsl:for-each select="./skos:narrower">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="ancestor::rdf:RDF//skos:Concept[@rdf:about = $relation]/skos:prefLabel[1]/text()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
					<xsl:if test="./skos:broader">
						<tr><th>
							Übergeordnete Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#broader">skos:broader</a></td>
							<td>
									<xsl:for-each select="./skos:broader">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="ancestor::rdf:RDF//skos:Concept[@rdf:about = $relation]/skos:prefLabel[1]/text()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
				
					<xsl:if test="./skos:related">
						<tr><th>
								Untergeordnete Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#narrower">skos:narrower</a></td>
								<td>
									<xsl:for-each select="./skos:related">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="ancestor::rdf:RDF//skos:Concept[@rdf:about = $relation]/skos:prefLabel[1]/text()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
					
					<xsl:if test="$groupMembership != ''">
						<tr><th>
							Gruppe</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#Collection">skos:Collection</a></td>
							<td>
								<xsl:value-of select="$groupMembership"/></td></tr>
					</xsl:if>
				
					<xsl:if test="./skos:closeMatch">
						<tr><th>
							Nahezu identische Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#closeMatch">skos:closeMatch</a></td>
							<td>
								<xsl:for-each select="./skos:closeMatch">
									<xsl:variable name="relation" select="@rdf:resource"/>
									<p><a href="{$relation}"><xsl:value-of select="$relation/data()"/></a></p>
								</xsl:for-each>
							</td></tr>
					</xsl:if>
					
				
					<xsl:if test="./skos:exactMatch">
						<tr><th>
							Identische Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#exactMatch">skos:exactMatch</a></td>
							<td>
									<xsl:for-each select="./skos:exactMatch">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="$relation/data()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
				
					
					<xsl:if test="./skos:broadMatch">
						<tr><th>
							Übergeordnete passende Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#broadMatch">skos:broadMatch</a></td>
							<td>
									<xsl:for-each select="./skos:broadMatch">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="$relation/data()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
				
					<xsl:if test="./skos:narrowMatch">
						<tr><th>
							Untergeordnete passende Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#narrowMatch">skos:narrowMatch</a></td>
							<td>
								<xsl:for-each select="./skos:narrowMatch">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="$relation/data()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
				
					<xsl:if test="./skos:relatedMatch">
						<tr><th>
							Passende Konzepte</th>
							<td><a target="_blank" href="http://www.w3.org/2004/02/skos/core#relatedMatch">skos:relatedMatch</a></td>
							<td>
									<xsl:for-each select="./skos:relatedMatch">
										<xsl:variable name="relation" select="@rdf:resource"/>
										<p><a href="{$relation}"><xsl:value-of select="$relation/data()"/></a></p>
									</xsl:for-each>
								</td></tr>
					</xsl:if>
					<tr><th> URL</th>
						<td></td>
						<td>
							<a href="website.html#{$id}"><xsl:value-of select="$id/data()"/></a>
						</td></tr>
				</table>
			</div>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="tabs">
		<div style="margin:0 100px 0 100px;position:fixed;">
			<h2>Zu Konzept springen</h2>
			<!-- Tab content -->
			<details style="margin-bottom:10px;">
				<summary>Alphabetisch</summary>
				<p><div
					id="alpha"
					class="tabcontent"
					style="margin-left:10px;display:block;">
					<xsl:call-template name="filter_Concepts_alphabetical"></xsl:call-template>
				</div></p>
			</details>
			<details style="margin-bottom:10px;">
				<summary>Hierarchisch</summary>
				<p><div
					id="hira"
					class="tabcontent"
					style="margin-left:10px;display:block;">
					<xsl:call-template name="filter_Concepts_hierachical"></xsl:call-template>
				</div></p>
			</details>
			<details style="margin-bottom:10px;">
				<summary>Gruppiert</summary>
				<p><div
					id="groups"
					class="tabcontent"
					style="margin-left:10px;display:block;">
					<xsl:call-template name="filter_Concepts_groups"></xsl:call-template>
				</div>
				</p>
			</details>
			
		</div>
		
	</xsl:template>
	<xsl:template name="filter_Concepts_alphabetical">
		<div
			style="max-height: 500px;overflow-y: auto;">
			<div>
				<ul>
					<xsl:for-each select="//skos:Concept">
						<xsl:sort
							select="./skos:prefLabel[1]" data-type="text">
						</xsl:sort>
						<xsl:variable name="label" select="./skos:prefLabel[1]/text()"/>
						<xsl:variable name="id" select="@rdf:about"/>
						<li><a href="website.html#{$id}"><xsl:value-of select="$label"/></a></li>
					</xsl:for-each>
				</ul><hr
					class="clear"/></div></div>
	</xsl:template>
	<xsl:template name="filter_Concepts_hierachical">
		<div>
			<xsl:for-each select="//skos:Concept">
				<xsl:choose>
					<xsl:when test="key('broaderByObject', @rdf:about)">
						<details style="margin-bottom:12px;">
							<summary style="cursor:pointer;">
								<xsl:value-of select="./skos:prefLabel[1]"/>
								<xsl:text> </xsl:text>
								<a href="website.html#{@rdf:about}">
									<i style="hover:color:#C53030;" class="fa fa-filter"/>
								</a>
								<!--<xsl:if test="position() ne last()">
							<xsl:text> / </xsl:text>
						</xsl:if>-->
							</summary>
							<p>
								<ul style="margin-left:10px;">
									<xsl:for-each select="key('broaderByObject', @rdf:about)">
										<xsl:variable name="id" select="../@rdf:about"/>
										<li id="{../@rdf:about}">
											<a href="website.html#{../@rdf:about}">
												<xsl:value-of select="../skos:prefLabel[1]"/>
											</a>
										</li>
									</xsl:for-each>
								</ul>
							</p>
						</details>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template name="filter_Concepts_groups">
		<div
			style="max-height: 500px;overflow-y: auto;">
			<div>
				<div>
					<xsl:for-each select="//skos:Collection">
						<xsl:variable name="label" select="./skos:prefLabel[1]/text()"/>
						<div>
							<details><summary><span
								style="display:inline;cursor:pointer;"><xsl:value-of select="$label"/></span></summary>
								<p><ul>
									<xsl:for-each select=".//skos:member">
										<xsl:variable name="member" select="@rdf:resource"/>
										<xsl:variable name="Concept" select="ancestor::rdf:RDF//skos:Concept[matches(@rdf:about, $member)]"/>
										<xsl:variable name="labelConcept" select="$Concept/skos:prefLabel[1]/text()"/>
										<xsl:variable name="id" select="$Concept/@rdf:about"/>
										<li><a href="website.html#{$Concept/@rdf:about}"><xsl:value-of select="$labelConcept"/></a></li>
									</xsl:for-each>
								</ul></p>
							</details>
						</div>
					</xsl:for-each>
					</div><hr
						class="clear"/></div></div>
	</xsl:template>
</xsl:stylesheet>