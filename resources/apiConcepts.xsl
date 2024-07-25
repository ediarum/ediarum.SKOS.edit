<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:user="http://tempuri.org/msxsl"
	xmlns:telota="http://www.telota.de" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
	<xsl:output method="xml" indent="yes"/>
	<xsl:param name="framework"/>
	<xsl:variable name="ediarum_project_name"/>
	<xsl:key name="broaderByObject" match="skos:broader" use="@rdf:resource"/>

	
	<xsl:template match="/">
		<xsl:result-document href="{$framework}/resources/concepts.xml" method="xml">
			<TEI xmlns="http://www.tei-c.org/ns/1.0">
		        <teiHeader>
		            <fileDesc>
		                <titleStmt>
		                    <title>Index: "Concepts"</title>
		                </titleStmt>
		                <publicationStmt>
		                	<p>For details see "ediarum.SKOS" project.</p>
		                </publicationStmt>
		                <sourceDesc>
		                    <p>Generated with ediarum.existdb.</p>
		                </sourceDesc>
		            </fileDesc>
		        </teiHeader>
		        <text>
		            <body>
		                <list type="index" subtype="Themen">
								<xsl:call-template name="all_concepts"></xsl:call-template>
		                </list>
				</body>
		        </text>
			</TEI>
		</xsl:result-document>
	</xsl:template>
	<xsl:template name="all_concepts">
		<xsl:for-each select="//skos:Concept">
			<xsl:sort select="./skos:prefLabel[@xml:lang = 'de' and text()]" data-type="text"/>
			<xsl:variable name="id" select="@rdf:about"/>
			<xsl:variable name="label_de" select="./skos:prefLabel[@xml:lang = 'de' and text()]"/>
			<item xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$id}">
			    <span><xsl:value-of select="$label_de"/></span>
			</item>
		</xsl:for-each>
	</xsl:template>

	
</xsl:stylesheet>