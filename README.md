# ediarum.SKOS

![SKOS Logo](css/gfx/skos_large.png) ediarum.SKOS ist ein oXygen-Framework zur Erstsellung und Verwaltung von SKOS-basierten Thesauri.

In diesem README finden Sie die Dokumentation des Datenmodells und Frameworks, sowie Hinweise zur Einrichtung und Erweiterung.

Version: 1.0.0

2021-2024 Berlin-Brandenburgische Akademie der Wissenschaften

Teil von ediarum https://www.ediarum.org/index.html (ediarum@bbaw.de)

Entwickelt von [TELOTA](http://www.bbaw.de/telota), der DH-Arbeitsgruppe der Berlin-Brandenburgischen Akademie der Wissenschaften telota@bbaw.de

## Zitierhinweis

Klappenbach, L. (2024). ediarum.SKOS.edit (Version 1.0.0) [Computer software]. https://doi.org/10.5281/zenodo.13939422

## Lizenz

ediarum.SKOS.edit ist freie Software: Sie können es unter den Bedingungen der GNU General Public License, wie von der Free Software Foundation veröffentlicht, weitergeben und/oder verändern, entweder in Version 3 der Lizenz oder (nach Ihrer Wahl) in einer späteren Version.

ediarum.SKOS.edit wird OHNE JEGLICHE GARANTIE veröffentlich. Weitere Einzelheiten finden Sie in der GNU General Public License.

Sie sollten eine Kopie der GNU General Public License zusammen mit ediarum.SLPS.edit erhalten haben. Falls nicht, siehe http://www.gnu.org/licenses/.

## Einleitung

SKOS ist ein regelbasiertes und maschinell interpretierbares System der Wissensmodellierung. Die zentrale Einheit ist das Konzept. Mittels des SKOS-Vokabular können Konzepte und ihre Relationen zueinander beschrieben werden. SKOS ist eine Semantic Web Technologie, die über URIs Referenzierung und Nachnutzung ermöglicht. Für weitere Informationen zum Datenmodell und Einsatz siehe https://www.w3.org/TR/skos-primer/ und https://www.w3.org/2009/08/skos-reference/skos.html.

ediarum.SKOS.edit ist ein oXygen Framework, entwickelt für den Author-Modus des oXygen XML-Editors (http://www.oxygenxml.com).
Mithilfe von ediarum.SKOS.edit können Wissenschaftler:innen in einer nutzer:innenfreundlichen Oberfläche auf SKOS (Simple Knowledge Organization System) basierende Thesauri erstellen und bearbeiten.
ediarum.SKOS.edit kann mit weiteren *ediarum*-Modulen (beispielsweise ediarum.BASE.edit sowie  projektspezifischen *ediarum*-Frameworks) kombiniert werden, um Konzepte des Thesaurus mit historischen Dokumenten zu verknüpfen.

### Projektkontext

ediarum.SKOS ist im Rahmen des DFG-Projekts "Schleiermachers Ästhetikvorlesungen im Kontext. Zur Reflexion und Anwendung digitaler Methoden in der Konstellationsforschung" (2021-2024) entstanden. 

Ziel des Projektes war es, die Themen und Begriffe der Ästhetikvorlesungen Schleiermachers in ihrem Verlauf zu analysieren. Dafür sollten diese systematisch digital erfasst und mit den Vorlesungen verknüpft werden. Da die Vorlesungen bereits mit ediarum ediert wurden, wurde ein ediarum-kompatible Lösung entwickelt. SKOS wurde als Datenmodell gewählt, da es über die nötige Semantik verfügt, um Themen und Begriffe zu ordnen und miteinander zu verknüpfen (Relationen erfassen). Allen Begriffen und Themen wurde zur Referenzierung und Nachnutzung mit eindeutigen URIs ausgestattet.

Den Quellcode des Frameworks finden Sie auf [Github](https://github.com/ediarum/ediarum.SKOS.edit).  

Der so entstandene Thesaurus wird künftig in einem Repositorium veröffentlicht.

Eine Webansicht der mit dem Framework erstellten Daten finden Sie unter https://schleiermacher-digital.de/skos.
 
## Auf einen Blick

|*Modulname*|ediarum.SKOS.edit| 
| -------- | -------- |
|*Installation*| Download des jüngsten Releases auf Github, lokale Anwendung über Oxygen|
|*Code und Dokumentation*| Github |
|*Entwicklung*| Lou Klappenbach|
|*Wissenschaftlicher Mitarbeiter des DFG-Projektes*| Holden Kelm|
|*Koordination und Konzeption DH-Methodik*| Frederike Neuber|


## Inhalt des Repos

* (.framework) Framework-Datei
* ediarum.jar zur Nutzung der *ediarum* JAVA-Funktionen
* Cascading Stylesheets und Icons zur Gestaltung der Nutzer:innen-Oberfläche
* XSLT-Stylesheets zur Aktualisierung der Inferenzen und Abfrage der Konzepte zur Relationierung, sowie für die Dokumentation und basale Präsentation des Thesaurus
* eine Vorlage für die Erstellung eines neuen Thesaurus
* Informationen über die Lizenzierung (.txt)
* .xpr Projektdatei mit den notwendigen Editorvariablen und Einstellungen


## Installation

### Voraussetzungen

* Installation des oXygen XML-Editor Version 20+ https://www.oxygenxml.com/

### Lokale Installation und Nutzung

ediarum.SKOS kann unabhängig von anderen ediarum-Modulen und lokal verwendet werden. Hierzu sind folgende Schritte notwendig:

#### Schritt 1: Release herunterladen

Legen Sie im Datenverzeichnis ihrer Wahl auf ihrem lokalen Rechner einen Ordner "Thesaurus" an. Dies ist nun Ihr Frameworkordner.
Laden Sie das neuste Release des Frameworks von Github herunter, entzippen Sie es und speichern Sie es lokal in ihrem Frameworkordner. Nun öffnen Sie die enthaltene newProject.xpr-Datei mit oXygen. Jetzt können Sie die Bearbeitung beginnen.

#### Schritt 2: Dokumenttypen-Zuordnung prüfen

 Wählen Sie in der Menüleiste des Oxygen `Optionen > Einstellungen > Dokumenttypen-Zuordnung`. Setzen sie bei ediarum.SKOS.edit das Häkchen, falls dies noch nicht erfolgt ist. Klicken Sie auf `Anwenden` und `OK`

 #### Schritt 3: Datei anlegen

 Erstellen Sie in ihrem Frameworkordner eine neue Datei mithilfe der Vorlage. Dazu unter `Datei > Neu Datei > Frameworkvorlagen > ediarum.skos.edit > thesaurus` eine neue Datei erstellen. Vergeben Sie einen Dateinamen ohne Sonderzeichen und speichern Sie die Datei in Ihrem Frameworkordner.


### Alternativ: Installation als Add-On und Nutzung mit anderen ediarum-Modulen

Das Framework kann auch über einen Server bereit gestellt und als Add-On für den oXygen Editor installiert werden. In diesem Fall sind ggf. projektspezifische Anpassungen notwendig.

#### Schritt 1: Installation als Add-On

Im oXygen Author lassen sich Add-Ons über den Menüpunkt `Hilfe > Neue Add-Ons installieren` installieren. Im geöffneten Fenster geben Sie die oben stehende URL zum skos-Framework in das Textfeld ein und wählen sie das nun angezeigte Add-On aus, indem sie das Häkchen im Kästchen aktivieren. Klicken Sie auf weiter, akzeptieren Sie die Lizenzbestimmungen und klicken Sie auf installieren. Anschließend starten Sie bitte das Programm neu. Anschließend können Sie das Framework nutzen. Gehen Sie weiter zu Schritt 2 und legen Sie eine neue Datei in ihrer Datenbank an.

Weiterführende Infos:

Weitere Informationen zur Installation von oXygen-Add-Ons finden sich in der Dokumentation: https://www.oxygenxml.com/doc/versions/23.1/ug-editor/topics/installing-and-updating-add-ons.html. 

#### Schritt 2: Datei anlegen

 Erstellen Sie in ihrer Datenbank eine neue Datei mithilfe der Vorlage, welche Sie unter `Datei > Neu Datei > Frameworkvorlagen > ediarum.skos.edit > thesaurus` wählen können. Vergeben Sie einen Dateinamen ohne Sonderzeichen und speichern Sie die Datei in Ihrem Dateisystem der Datenbank.

#### Schritt 3: Schnittstelle anlegen

Für die Nutzung einiger Aktionen und zur optionalen Verknüpfung des Thesaurus mit historischen Dokumenten (über ein projektspezifisches Framework siehe Schritt 4) müssen Sie über die *ediarum*.DB App eine projektspezifische Registerschnittstelle anlegen. In der Dokumentation zum Basic-Setup von *ediarum* finden Sie eine Anleitung hierfür: https://www.ediarum.org/docs/set-up/DE/topics/customization/register-anlegen.html

Befolgen Sie die in der Dokumentation angegebenen Schritte und geben Sie folgende Werte in die Eingabemaske ein:

| | Beispielwert | Erklärung  |
| -------- | -------- | -------- |
| **API-ID**   | concepts     | frei wählbar, wird bei den Editorvariablen angegeben (sollte keine Leer- oder Sonderzeichen enthalten)     |
| **Bezeichnung**   | 	Konzepte     | Name des Registers (frei wählbar)     |
| **Registerordner/ -datei**   | Register/Konzepte.xml     | Das SKOS-XML wird in der Regel im Ordner Register gespeichert. Der Name der Datei ist frei wählbar. Register/NAME.xml     |
| **Namespace**   | skos:http://www.w3.org/2004/02/skos/core#     | Hier wird der Namensraum der Konzepte eingetragen     |
| **Node**   |  	skos:Concept    | orientiert sich am Aufbau der SKOS-XML   |
| **XML-ID**   | substring-after(@rdf:about,'https://yourwebsite/yourthesaurus/')    | Hier wird die ID des skos:Concepts übergeben   |
| **Span**   | //skos:prefLabel[1]     |  	orientiert sich am Aufbau des Thesaurus und wird als Name des Eintrages angezeigt, hier: das erste vorkommende präferierte Label des Konzepts    |


Anschließend können Sie über den Button "API-Get" die über die Schnittstelle ausgegebenen Informationen ansehen. Wenn alles korrekt eingegeben wurde, sollte hier eine Liste der im Thesaurus angelegten Konzepte ausgegeben werden. Legen Sie am besten ein Beispielkonzept in der Datei an. Mithilfe der Schnittstelle werden die Konzepte dann bei verschiedenen Aktionen (bspw. beim Hinzufügen von Beziehungen) in einem Dropdownmenü wählbar.

Falls die Schnittstelle nicht abrufbar ist oder keine Inhalte zeigt, prüfen Sie die Rechte der neu erstellte Verzeichnisse und prüfen Sie, ob Sie die aktuellste ediarum.DB-Version installiert haben, da nur ab Version XXX in der *ediarum* App die skos- und rdf-Namespaces registriert sind. Sie können die Namespaces alternativ unter db/projects/apps/ediarum/modules/config.xqm hinzufügen.

#### Schritt 4: Editorvariablen hinzufügen

Um bestimmte Funktionen, wie die Verknüpfung von historischen Dokumenten mit den Thesaurus oder das Öffnen einer Webansicht nutzen zu können, müssen bestimmte Editorvariablen gesetzt werden. Diese können unter `Optionen > Einstellungen > Editorvariablen` hinzugefügt werden. Speichern Sie diese Editorvariablen in den projektspezifischen Optionen (Projekt-Optionen), wenn sie bereits eine Projektdatei erstellt bzw. ein projektspezifisches *ediarum* Framework installiert haben. Falls nicht, können Sie die Editorvariablen als globale Optionen speichern.

Folgende Editorvariablen könnten sinnvollerweise bei einem projektspezifischen *ediarum*-Framework (falls noch nicht vorhanden) ergänzt und angepasst werden:

| Name | Beispielwert | Beschreibung |
| -------- | -------- | -------- |
|ediarum_project_domain|https://oxygen-bot:**@yourserver.de |Domäne inklusive Port und Credentials|
|ediarum_website_base|https://website-user:**@yourserver.de |Website|
|ediarum_website_path|/apps/project/||
|ediarum_projects_directory|/project/rest/db/projects/|Pfad zum Projektverezichnis|
|ediarum_project_name|project|Name/Kürzel des Projektes |
| ediarum_index_concept | /oxygen/ediarum.xql?index=concepts|Pfad zu einer Schnittstelle, die die Liste der Konzepte bereitstellt|
|ediarum_conceptScheme_url|  https://yourwebsite/yourthesaurus/ | Eindeutige URI zum Thesaurus. Dieser sollte über die angegebene URI für Nutzer:innen abrufbar sein. |
|$ediarum_skos_documentation|README.md | Pfad/URL zur Dokumentation des Thesaurus |

Sie können die Aktionen so modifizieren, dass die Editorvariablen abgefragt werden, beispielsweise um neuen Konzepten eine Projektspezifische ID zuzuweisen. Hierfür können Sie das Framework über die oXygen-GUI anpassen. Wählen Sie hierzu im Menü `Optionen > Einstellungen > Dokumenttypen-Zuordnung > ediarum.SKOS.edit` und klicken Sie auf den Button `bearbeiten`. Für mehr Informationen zum Anlegen und Bearbeiten von Aktionen, siehe https://www.ediarum.org/docs/set-up/DE/topics/customization/aktion_eigene.html.

Damit Sie beispielsweise nicht jedesmal beim Anlegen von neuen Konzepten die URL zum Konzeptschema neu eingeben müssen, können Sie diese in den Editorvariablen unter ediarum_conceptScheme_url verzeichen und dann in den jeweiligen Aktionen mittels `${ediarum_conceptScheme_url}` aufrufen.

Falls Sie ediarum.SKOS unabhängig von ediarum.BASE und/oder einem projektspezifischen Framework nutzen, können Sie die Editorvariablen in der im Add-on mitgelieferte Projektdatei anpassen bzw. ergänzen oder die Editorvariablen global in ihrem oXygen Editor (Global-Optionen) speichern.

### Schritt 5 (optional): Aktion zum Verknüpfen von historischen Dokumenten und Thesaurus hinzufügen

In Ihrem projektspezifischen Framework können Sie nun eine Aktion erstellen, mit deren Hilfe Sie die eben erstellte Schnittstelle abfragen können, um Textstellen zu annotieren und mit dem Thesaurus zu verknüpfen. Erstellen Sie dazu eine neue Aktion in ihrem projektspezifischen Framework, welches Sie in Oxygen unter `Optionen > Einstellungen > Dokumenttypen-Zuordnung` finden. Klicken Sie auf das Framework und auf bearbeiten. Anschließend können Sie unter `Autor > Aktionen` mit dem Plus-Zeichen unten rechts eine neue Aktion erstellen. Vergeben Sie in der sich öffnenden Eingabemaske eine eindeutige ID sowie einen Namen und wählen Sie als Vorgang `org.bbaw.telota.ediarum.RegisterInsertFragmentOperation`. Anschließend tragen Sie folgende Argumente ein:

| Name | Beispielwert | Erklärung |
| -------- | -------- | -------- |
|URL| `${ediarum_project_domain}${ediarum_projects_directory}${ediarum_project_name}${ediarum_index_concept}` |URL zur API|
|node|//tei:item|XPATH Ausdruck zum Eintrag inkl. Namensraum |
|namespaces|tei:http://www.tei-c.org/ns/1.0| Namensraum hier TEI, da es in der Schnittstelle als TEI ausgegeben wird|
|item rendering|$XPATH{/span}|XPath zum Namen des Eintrages|
|item variable|z.B. `<skos:narrower rdf:resource="${ediarum_conceptScheme_url}/$XPATH{@xml:id}"/>` | XML-Fragment, das eingefügt werden soll inklusive XPath zur ID aus der API, auf die Verwiesen wird|
|multiple selection|true||
|item separator| |hier Leerzeichen einfügen|
|elements|$ITEMS||
|insert location|ancestor-or-self::skos:Concept|Element im Thesaurus wo das Element eingefügt wird|
|insert position|insert as last child|Position innerhalb des Elements, in das das Fragment eingefügt wird|
|schema aware| true|wenn auf true gesetzt, wird nur eingefügt, wenn das Element an der aktuellen Position im Schema erlaubt ist|



## Datenmodell

### Namensräume

* xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
* xmlns:telota="http://www.telota.de" 
* xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
* xmlns:tei="http://www.tei-c.org/ns/1.0" 
* xmlns:xs="http://www.w3.org/2001/XMLSchema" 

### Elemente

| Element | Erlaubt in | Kindelemente | Nutzung |Beispiel
| -------- | -------- | -------- | ------ | --------|
| ```<rdf:RDF>``` | als Wurzelelement | ```<skos:Concept>```; ```<skos:ConceptScheme>``` |Wurzelelement, beinhaltet Namensräume (siehe oben) sowie Dokument-ID|`<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:telota="http://www.telota.de" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" telota:doctype="thesaurus" xml:lang="de" xml:id="S1122426"></rdf:RDF>`|
| ```<skos:ConceptScheme>```  | ```<rdf:RDF>``` | ```<skos:hasTopConcept>```| Schema|`<skos:ConceptScheme rdf:about="http://www.telota.de/skos/scheme/thesaurus"></skos:ConceptScheme>`|
|  ```<skos:hasTopConcept>``` | ```<skos:ConceptScheme>``` ||Referenz aller Konzepte, die diesem Schema angehören
| ```<skos:Concept>```  | ```<rdf:RDF>```      | ```<skos:inScheme>``` ; ```<skos:prefLabel>``` ; ```<skos:definition>``` ; ```<skos:narrower>``` ; ```<skos:broader>``` ; ```<skos:related>``` ;     | Konzept |`<skos:Concept rdf:about="http://www.telota.de/skos/scheme/thesaurus/#yqm_352_1qb">`|
| ```<rdf:type>```  |```<skos:Concept>``` ; ```<skos:ConceptScheme>``` ||?|
| ```<skos:inScheme>```  | ```<skos:Concept>```  ||Referenz auf das Schema|
| ```<skos:prefLabel>```  |```<skos:Concept>```  ||Name des Konzeptes, kann pro Sprache nur einmal Vorkommen. Die Sprache wird durch das Attribut ```@xml:lang```  angegeben, siehe unten.|
| ```<skos:definition>```  |```<skos:Concept>```  |Text|Beschreibung des Konzeptes. Bisher nur einsprachig erlaubt (deutsch).|
|```<skos:narrower>```  |```<skos:Concept>```  ||Referenz auf ein Unterkonzept|
| ```<skos:broader>```  |```<skos:Concept>```  ||Referenz auf ein Überkonzept|
| ```<skos:related>```  |```<skos:Concept>```  ||Referenz auf ein verwandtes, nicht in hierarchischer Beziehung stehendes Konzept.|
|```<skos:exactMatch>```  |```<skos:Concept>```  ||Referenz auf ein externes, exakt gleichbedeutendes Konzept|
| ```<skos:closeMatch>```  |```<skos:Concept>```  ||Referenz auf ein externes, gleichbedeutendes Überkonzept|
|```<skos:narrowMatch>```  |```<skos:Concept>```  ||Referenz auf ein externes Unterkonzept|
| ```<skos:broadMatch>```  |```<skos:Concept>```  ||Referenz auf ein externes Überkonzept|
| ```<skos:relatedMatch>```  |```<skos:Concept>```  ||Referenz auf ein verwandtes, nicht in hierarchischer Beziehung stehendes, externes Konzept.|



### Attribute


| Attribut | Attributwert | Erlaubt in | Nutzung | Beispiel |
| -------- | -------- | -------- |--------| ---- |
| ```@rdf:about```     | URL     | ```<skos:Concept>``` ; ```<skos:ConceptScheme>```     |Bezeichnung (in Form einer URL mit ID) des Konzeptes oder Schemas|`<skos:ConceptScheme rdf:about="http://www.telota.de/skos/scheme/thesaurus">`|
| `@rdf:resource`     | URL     | ```<rdf:type>``` ; ```<skos:narrower>``` ; ```<skos:broader>``` ; ```<skos:related>``` ; ```<skos:inScheme>``` ; ```<skos:hasTopConcept>```      |Referenz auf ein Konzept oder Schema|
| ```@xml:id```    | ID     | ```<rdf:RDF>```     | eindeutige Identifikation der Datei |
| `@xml:lang`    | de; en     | `<skos:prefLabel>` ; ```<skos:altLabel>``` ; ```<skos:definition>```      | Beschreibung der Sprache |



## Nutzung

Alle Aktionen sind sowohl über das Menü "SKOS" als auch über die Symbolleiste aufrufbar. Bestimmte Aktionen können nur ausgewählt werden, wenn sie an der Stelle, an der sich der Cursor befindet erlaubt sind.

### Neue Datei anlegen

Nutzen Sie hierzu am besten die mitgelieferte Vorlage. Sie finden diese unter `Datei > Neue Datei > Framework Vorlagen > ediarum.skos.edit > thesaurus`. Speichern Sie die Datei in Ihrem Frameworkordner oder in ihrer Datenbank im Verzeichnis `data > Thesaurus` ab.

### Neues Konzept hinzufügen

Um ein neues Konzept hinzuzufügen, klicken Sie in der Symbolleiste auf das Icon ![Neuer Eintrag](css/gfx/new_entry_small.png) "Neuer Eintrag". Anschließend werden in einem Auswahlfenster verschiedene Informationen hintereinander abgefragt. Dabei ist folgendes zu beachten:

Jedes Konzept muss eine deutschsprachige Bezeichnung (prefLabel) erhalten und dem Hauptschema des Thesaurus zugeordnet werden. 

Weitere mögliche aber nicht obligatorische Angaben sind: 

* englischsprachige Bezeichnung 
* alternative Bezeichnung (englisch oder deutsch)
* Definition

Beim Einfügen des Konzeptes wird automatisch eine eindeutige ID generiert und dem Konzept als Attributwert eines `@rdf:about` zugeordnet.

Beim Hinzufügen eines Konzeptes wird nach der Wahl eines Konzeptschemas gefragt. Hier muss das entsprechende Konzeptschema ausgewählt werden.

### Neues Konzeptschema erstellen

Sie können ein weiteres Konzeptschema erstellen und diesem Konzepte des Thesaurus zuweisen. Wählen Sie hierfür den Menüpunkt ![Neues Konzeptschema](css/gfx/conceptScheme_small.png) "Neues Konzeptschema" und geben Sie eine URL ein. 


###  Gruppe erstellen

Um Konzepte mit gemeinsamen Eigenschaften in einer Gruppe zusammenzufassen, erstellen Sie zunächst eine Neue Gruppe auf ![Neue Gruppe hinzufügen](css/gfx/collection_small.png) "Neue Gruppe". Und fügen Sie anschließend dieser Gruppe alle zugehörigen Konzepte als Mitglieder hinzu.

#### Mitglied hinzufügen

Um einer Gruppe ein Konzept zuzuweisen, positionieren Sie den Cursor in die gewünschte Gruppe und klicken Sie auf ![Mitglied hinzufügen](css/gfx/member_small.png) "Mitglied hinzufügen", um anschließend im Menu das gewünschte Konzept auszuwählen.

### Labels

Über das Icon ![Deutsche bevorzugte Bezeichnung](css/gfx/label_small.png) "Detsche bevorzugte Bezeichnung" können neben der obligatorischen deutschen Bezeichnung (`<skos:prefLabel xml:lang='de'></skos:prefLabel>`) auch eine englischsprachige Bezeichnung (`<skos:prefLabel xml:lang='en'></skos:prefLabel>`) sowie Alternativbezeichnungen (`<skos:altLabel xml:lang='de'></skos:prefLabel>`) in Englisch und/oder Deutsch angegeben werden.


### Definition

Über die Aktion "Definition eingeben", kann eine Beschreibung des jeweiligen Konzeptes hinzugefügt werden. Hierzu den Cursor in das zu beschreibende Konzept platzieren und anschließend auf das Symbol ![Definition eingeben](css/gfx/definition_small.png) "Definition eingeben" klicken. Im geöffneten Auswahlfenster kann anschließend die Definition des Konzepts eingegeben werden.

Die Aktion fügt dem Konzept ein `<skos:definition></skos:definition>` als Kindelement hinzu.


### Semantische Beziehungen

Es können zwei verschiedene Typen von Beziehungen annotiert werden: hierarchische (Unterkonzept und Überkonzept) und assoziative (Relationen). Diese dürfen jedoch nicht kombiniert werden (Zaytseva/Ďurčo 2020). 

In der Symbolleiste sind die entsprechenden Aktionen in einem Dropdown mit dem Symbol ![Beziehungen](css/gfx/beziehungen_small.png) "Beziehungen" zu finden. Um eine Beziehung zu annotieren, muss der Cursor in das Ausgangskonzept platziert werden. Es können nun folgende Beziehungen eingegeben werden:

#### Unterkonzept: skos:narrower

Unterkonzepte werden durch `<skos:narrower>` beschrieben. Bei Klick auf die Aktion ![Unterkonzept zuweisen](css/gfx/narrower_small.png) "Unterkonzept zuweisen" wird ein Auswahlfenster mit den verfügbaren Konzepten angezeigt, auf die verwiesen werden kann. Durch Auswahl des zu referenzierenden Konzeptes und Bestätigung mit "OK", wird die Referenz-URL als Attributwert im Attribut `@rdf:resource` des Ausgangskonzeptes gespeichert. 


#### Überkonzept: skos:broader

Überkonzepte werden durch `<skos:broader>` beschrieben. Bei Klick auf die Aktion ![Überkonzept zuweisen](css/gfx/broader_small.png) "Überkonzept zuweisen" wird ein Auswahlfenster mit den verfügbaren Konzepten angezeigt, auf die verwiesen werden kann. Durch Auswahl des zu referenzierenden Konzeptes und Bestätigung mit "OK", wird die Referenz-URL als Attributwert im Attribut `@rdf:resource` des Ausgangskonzepts gespeichert. 


#### Relation: skos:related

Assoziative Beziehungen können über den Menüpunkt ![Relation anlegen](css/gfx/beziehungen_small.png) "Relation anlegen" erstellt werden. Diese Form der Beziehung ist nur zwischen nicht hierarchischen Konzepten anzuwenden.

##### Projektspezifisches

Bei *schleiermacher digital* sind nur die Themen untereinander mit dieser Beziehungsform auszuzeichnen, nicht aber Begriffe mit Begriffen oder Begriffe mit Themen.


### Verknüpfung mit externen Ressourcen

Zur Verknüpfung der Konzepte mit Konzepten anderer Thesauri können die Aktionen unter dem Menüpunkt ![externe Ressourcen](css/gfx/sw_small.png) "Externe Ressourcen" verwendet werden. Zur Verknüpfung muss eine URL zum Konzept der externen Ressource eingegeben werden. Es stehen folgende Beziehungsformen zur Auswahl:
 
 * skos:exactMatch (exakte Übereinstimmung)
 * skos:closeMatch (Übereinstimmung)
 * skos:broadMatch (externes Überkonzept)
 * skos:narrowMatch (externes Unterkonzept)
 * skos:relatedMatch (externe Relation)

### Inferenzen aktualisieren

Um die Datei mit allen semantischen Beziehungen anzureichern, kann die Aktion ![](css/gfx/inference_small.png) "Inferenzen Aktualisieren" genutzt werden. Diese veranlasst das Neu-Einfügen aller eingegebenen Beziehungen und Rückbeziehungen. Wurde also einem Konzept ein Unterkonzept zugeordnet, wird nach dem Ausführen dieser Aktion dem Unterkonzept auch das entsprechende Überkonzept zugeordnet.

### Inferenzen löschen

Eine Inferenz kann durch einfaches Markieren und Entfernen gelöscht werden. Um die Beziehung vollständig zu löschen, müssen aber sowohl Hin- als auch Rückbeziehungen gelöscht werden, da sonst beim nächsten Ausführen der Aktion "Inferenzen aktualisieren", die Gegenbeziehung wieder eingefügt wird.

### README öffnen

Über die Aktion ![](css/gfx/skos_small.png) "Readme öffnen", wird die README.md geöffnet. Hier finden Sie Informationen zum Kontext, Aufbau und Einsatz des Frameworks, sowie eine Beschreibung der Aktionen.

### Webansicht öffnen

Über die Aktion ![](css/gfx/link_small.png) "Webansicht öffnen", wird der Thesaurus als (lokale) html-Ansicht geöffnet.

### Aktionsübersicht öffnen

Über die Aktion "Aktionsübersicht öffnen", wird die documentation.html geöffnet. Hier finden Sie einen Übersicht über alle implementierten Aktionen. Dies kann für Entwickler:innen bei Anpassungs- oder Erweiterungsarbeiten hilfreich sein.

## Validierung
Für die Validierung der erstellten Daten können folgende Tools verwendet werden:

* https://github.com/NatLibFi/Skosify
* https://github.com/cmader/qSKOS/

## Turtle-Export (.ttl)

Mit Skosify lässt sich zudem die mit dem Framework erstellte XML-Datei in eine Turtle-Datei umwandeln. Nach der Installation (siehe Doku https://github.com/NatLibFi/Skosify) kann dies kann über die Kommandozeile ausgeführt werden: 

`skosify thesaurus.xml -o thesaurus.ttl --label "Mein Thesaurus"` 

## Quellen und weiterführende Informationen

Baker, Thomas u. a. (2013): Key Choices in the Design of Simple Knowledge Organization System (SKOS). Journal of Web Semantics 20:35–49. DOI: 10.1016/j.websem.2013.05.001.

Costa, Rute; Salgado, Ana; Almeida, Bruno (2021): SKOS as a key element for linking lexicography to digital humanities. In: Information and Knowledge Organisation in Digital Humanities. Routledge

Dumont, Stefan; Fechner, Martin (2015) Bridging the Gap: Greater Usability for TEI encoding. In: Journal of the Text Encoding Initiative 8 | December 2014 - December 2015. DOI: https://doi.org/10.4000/jtei.1242.

Dumont, Stefan; Arndt, Nadine; Grabsch, Sascha; Klappenbach, Lou (2011-2021): ediarum.BASE.edit. https://github.com/ediarum/ediarum.BASE.edit. Version: 2.0.0

Fechner, Martin; Dumont, Stefan; Fischer, Gordon; Klappenbach, Lou; Wierzoch, Jan (2011-2021): ediarum.DB. DOI: https://doi.org/10.5281/zenodo.2449849.

DFG-Projekt der Ästhetikvorlesungen https://gepris.dfg.de/gepris/projekt/448730446?context=projekt&task=showDetail&id=448730446&

Kelm, Holden; Klappenbach, Lou (2022): Erläuterungen zum Thesaurus für die Ästhetikvorlesungen, in: schleiermacher digital / Vorlesungen / Vorlesungen über die Ästhetik. Hg. v. Holden Kelm. 
Berlin-Brandenburgische Akademie der Wissenschaften, Berlin, URL: https://schleiermacher-digital.de/S8323529

Sinclair, Stéfan; Rockwell, Geoffrey (2016): Voyant Tools. Web. http://voyant-tools.org/.

SKOS-Primer: https://www.w3.org/TR/skos-primer/ 

SKOS-Referenz: https://www.w3.org/TR/skos-reference/

Zaytseva, Ksenia; Ďurčo, Matej (2020): Controlled Vocabularies and SKOS. Version 1.1.0. Edited by Matej Ďurčo and Tanja Wissik. DARIAH-Campus. [Training module]. URL: https://campus.dariah.eu/resource/controlled-vocabularies-and-skos 
