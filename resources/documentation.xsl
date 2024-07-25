<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:user="http://tempuri.org/msxsl"
	xmlns:telota="http://www.telota.de" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//DE" indent="yes"/>
	<xsl:param name="framework"/>

	
	<xsl:template match="/">
		<html lang="de">
			<head>
				<title>
					Dokumentation Datenmodell und projektspezifisches ediarum-Famework der Schleiermacher Arbeitsstelle der BBAW
				</title>
				<meta charset="utf-8"/>
				<meta name="google-site-verification" content="CFybFEFKB-guBQivbjy_Z6-MSID1ZtRJSoBl5oiLwxY"/>
				<meta name="viewport" content="initial-scale=1"/>
				<meta name="Description" content="Dokumentation des ediarum.SKOS-Frameworks und Datenmodells des DFG-Projektes zu Schleiermachers Ästhetikvorlesungen"/>
			</head>
			<body>
				<div style="margin: 20px;">
					<h1>Dokumentation des ediarum.SKOS-Frameworks und Datenmodells des DFG-Projektes zu Schleiermachers Ästhetikvorlesungen</h1>
					<p>Kontakt: TELOTA@bbaw.de (Holden Kelm, Lou Klappenbach)</p>
					<p>Stand: <xsl:value-of select="current-dateTime()"/></p>
					<div style="display:flex;">
						<div style="width:70%;">
							<xsl:call-template name="actions"/>
						</div>
						<div>
							<xsl:call-template name="tabs"/>
						</div>
					</div>
					
				</div>
			</body>
		</html>
		<!--<xsl:result-document href="{$framework}/resources/documentation.html" method="html">
			<html lang="de">
				<head>
					<title>
						Dokumentation Datenmodell und projektspezifisches ediarum-Famework der Schleiermacher Arbeitsstelle der BBAW
					</title>
					<meta charset="utf-8"/>
					<meta name="google-site-verification" content="CFybFEFKB-guBQivbjy_Z6-MSID1ZtRJSoBl5oiLwxY"/>
					<meta name="viewport" content="initial-scale=1"/>
					<meta name="Description" content="Dokumentation des ediarum.SKOS-Frameworks und Datenmodells des DFG-Projektes zu Schleiermachers Ästhetikvorlesungen"/>
				</head>
				<body>
					<div style="margin: 20px;">
						<h1>Dokumentation des ediarum.SKOS-Frameworks und Datenmodells des DFG-Projektes zu Schleiermachers Ästhetikvorlesungen</h1>
						<p>Kontakt: TELOTA@bbaw.de (Holden Kelm, Lou Klappenbach)</p>
						<p>Stand: <xsl:value-of select="current-dateTime()"/></p>
						<div style="display:flex;">
							<div style="width:70%;">
								<xsl:call-template name="actions"/>
							</div>
							<div>
								<xsl:call-template name="tabs"/>
							</div>
						</div>
						
					</div>
				</body>
			</html>
		</xsl:result-document>-->
	</xsl:template>
	
	<xsl:template name="actions">
		<xsl:for-each select="//action[field[@name='id']]">
			<xsl:variable name="id" select ="field[@name='id']/String/text()"/>
			<xsl:variable name="name" select ="field[@name='name']/String/text()"/>
			<div id="{normalize-space($id)}" style="padding:10px;">
				<table style="border-collapse: collapse; width: 100%;">
					<tr style="background-color: #f2f2f2;">
						<th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Name</th>
						<td style="border: 1px solid #ddd; padding: 8px;"><xsl:value-of select="field[@name='name']/String"></xsl:value-of></td>
					</tr>
					<tr>
						<th style="border: 1px solid #ddd; padding: 8px; text-align: left;">ID</th>
						<td style="border: 1px solid #ddd; padding: 8px;"><xsl:value-of select="$id"></xsl:value-of></td>
					</tr>
					<tr style="background-color: #f2f2f2;">
						<th style="border: 1px solid #ddd; padding: 8px; text-align: left; width: 150px;">Beschreibung</th>
						<td style="border: 1px solid #ddd; padding: 8px; width: calc(100% - 160px);"><xsl:value-of select="field[@name='description']/String"></xsl:value-of></td>
					</tr>
					<tr>
						<th style="border: 1px solid #ddd; padding: 8px; text-align: left;">Bedienung</th>
						<td style="border: 1px solid #ddd; padding: 8px;">
							<ul style="list-style-type: none; padding: 0; margin: 0;">
								<xsl:choose>
									<xsl:when test=".//ancestor::serialized//menu[.//String[contains(.,$id)]]/field[@name='label']/String">
										<li style="margin-bottom: 4px;">im Menü "SKOS" verfügbar</li>
									</xsl:when>
									<xsl:otherwise>
										<li style="margin-bottom: 4px;">nicht im Menü für Nutzer:innen verfügbar</li>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test=".//ancestor::serialized//toolbar[.//String[matches(.,$id)]]">
										<li style="margin-bottom: 4px;">in der Toolbar/Symbolleiste verfügbar</li>
									</xsl:when>
									<xsl:otherwise>
										<li style="margin-bottom: 4px;">nicht in der Toolbar für Nutzer:innen verfügbar</li>
									</xsl:otherwise>
								</xsl:choose>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="tabs">
		<div style="margin:0 100px 0 100px;position:fixed;">
			<h2>Zu Aktion springen</h2>
			<!-- Tab content -->
			<details style="margin-bottom:10px;">
				<summary>Alphabetisch</summary>
				<p>
					<div id="alpha" class="tabcontent" style="margin-left:10px;display:block;">
						<xsl:call-template name="filter_Concepts_alphabetical"/>
					</div>
				</p>
			</details>
		</div>
	</xsl:template>
	<xsl:template name="filter_Concepts_alphabetical">
		<div style="max-height: 200px;overflow-y: auto;">
			<div>
				<ul>
					<xsl:for-each select="//action[field[@name='id']]">
						<xsl:sort select="field[@name='name']/String/text()" data-type="text"> </xsl:sort>
						<xsl:variable name="label" select="field[@name='name']/String/text()"/>
						<xsl:variable name="id" select="normalize-space(field[@name='id']/String/text())"/>
						<li>
							<a href="documentation.html#{$id}">
								<xsl:value-of select="$label"/>
							</a>
						</li>
					</xsl:for-each>
				</ul>
				<hr class="clear"/>
			</div>
		</div>
	</xsl:template>
	
	
</xsl:stylesheet>