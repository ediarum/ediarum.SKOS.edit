<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	
<!--	insert child relations but not dublicates -->
	<xsl:template match="skos:broader[@rdf:resource=(preceding-sibling::skos:broader)/@rdf:resource]"/>
	<xsl:template match="skos:narrower[@rdf:resource=(preceding-sibling::skos:narrower)/@rdf:resource]"/>
	<xsl:template match="skos:related[@rdf:resource=(preceding-sibling::skos:related)/@rdf:resource]"/>
	<xsl:template match="skos:topConceptOf[@rdf:resource=(preceding-sibling::skos:topConceptOf)/@rdf:resource]"/>
	<xsl:template match="skos:hasTopConcept[@rdf:resource=(preceding-sibling::skos:hasTopConcept)/@rdf:resource]"/>
	<xsl:template match="skos:member[@rdf:resource=(preceding-sibling::skos:member)/@rdf:resource]"/>
	
</xsl:stylesheet>
