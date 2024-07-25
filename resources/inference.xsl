<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	<xsl:output method="xml" indent="yes"/>
<!--	Look up all relations by their refering Concept name for inverting objects -->
	<xsl:key name="broaderByObject" match="skos:broader" use="@rdf:resource" />
	<xsl:key name="narrowerByObject" match="skos:narrower" use="@rdf:resource" />
	<xsl:key name="relatedByObject" match="skos:related" use="@rdf:resource" />
	<xsl:key name="hasTopConcept" match="skos:hasTopConcept" use="@rdf:resource" />
	<xsl:key name="topConceptOf" match="skos:topConceptOf" use="@rdf:resource" />

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="skos:ConceptScheme">
		<xsl:variable name="ConceptSchema">
			<xsl:value-of select="@rdf:about"/>
		</xsl:variable>
		<skos:ConceptScheme rdf:about="{@rdf:about}">
			<xsl:apply-templates/>
			<!-- Insert all Concepts as a list of skos:hasTopConcept that refere to scheme -->
			<xsl:for-each select="key('topConceptOf', @rdf:about)">
				<skos:hasTopConcept rdf:resource="{../@rdf:about}"/>
			</xsl:for-each>
		</skos:ConceptScheme>
	</xsl:template>
	
	<xsl:template match="skos:Concept">
		<xsl:variable name="ID"><xsl:value-of select="@rdf:about"/></xsl:variable>
		<skos:Concept rdf:about="{$ID}">
			<xsl:apply-templates/>
<!--			Getting all inverted Objects with resource = Concept ID-->
			<xsl:for-each select="key('broaderByObject', @rdf:about)">
				<skos:narrower rdf:resource="{../@rdf:about}" />
			</xsl:for-each>
			<xsl:for-each select="key('narrowerByObject', @rdf:about)">
					<skos:broader rdf:resource="{../@rdf:about}" />					
			</xsl:for-each>
			<xsl:for-each select="key('relatedByObject', @rdf:about)">
					<skos:related rdf:resource="{../@rdf:about}" />
			</xsl:for-each>
			<xsl:for-each select="key('hasTopConcept', @rdf:about)">
					<skos:topConceptOf rdf:resource="{../@rdf:about}"/>
			</xsl:for-each>
		</skos:Concept>
	</xsl:template>
	
</xsl:stylesheet>
