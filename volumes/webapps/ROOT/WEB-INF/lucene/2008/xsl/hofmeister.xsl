<?xml version="1.0" encoding="UTF-8"?>
<!--
  XSLT that converts Hofmeister documents into ereuna lucene documents.
-->
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:excel="urn:schemas-microsoft-com:office:spreadsheet" xmlns:local="urn:local"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" />

  <xsl:param name="output">/Users/miguel/Developer/KCL/projects/ereuna/archive/hofmeister/xml</xsl:param>

  <xsl:param name="al-composers-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_composers.xml</xsl:param>
  <xsl:param name="al-countries-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_countries.xml</xsl:param>
  <xsl:param name="al-hofclasses-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_hofclasses.xml</xsl:param>
  <xsl:param name="al-keys-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_keys.xml</xsl:param>
  <xsl:param name="al-opus-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_opuses.xml</xsl:param>
  <xsl:param name="al-publishers-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_publishers.xml</xsl:param>
  <xsl:param name="al-pubplaces-file">/Users/miguel/Developer/KCL/projects/hofmeister/cocoon/xml/alist/AL_pubPlaces.xml</xsl:param>

  <xsl:variable name="al-composers" select="document($al-composers-file)" />
  <xsl:variable name="al-countries" select="document($al-countries-file)" />
  <xsl:variable name="al-hofclasses" select="document($al-hofclasses-file)" />
  <xsl:variable name="al-keys" select="document($al-keys-file)" />
  <xsl:variable name="al-opus" select="document($al-opus-file)" />
  <xsl:variable name="al-publishers" select="document($al-publishers-file)" />
  <xsl:variable name="al-pubplaces" select="document($al-pubplaces-file)" />

  <xsl:variable name="non-latin-characters">ąǎäàáâÁćčçČėęéèêëěœÉíĭíïłňńñōǒôóòöøÖřšśŚŠùúüůÜÛýźżžŻŽŹ'’</xsl:variable>

  <xsl:variable name="latin-characters">aaaaaaAcccCeeeeeeeeEiiiilnnnoooooooOrssSSuuuuUUyzzzZZZ</xsl:variable>

  <xsl:variable name="tei-doc">
    <xsl:sequence select="/" />
  </xsl:variable>

  <xsl:template match="/">
    <xsl:for-each select="//TEI.2/text/body/div">
      <xsl:variable name="div-id" select="@id" />

      <xsl:call-template name="head">
        <xsl:with-param name="id" select="$div-id" />
      </xsl:call-template>

      <xsl:call-template name="baw">
        <xsl:with-param name="id" select="$div-id" />
      </xsl:call-template>

      <xsl:call-template name="listbibl">
        <xsl:with-param name="id" select="$div-id" />
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="head">
    <xsl:param name="id" required="yes" />

    <xsl:if test="string($id)">
      <xsl:result-document encoding="UTF-8" exclude-result-prefixes="#all" href="{$output}/{$id}.xml" indent="yes" method="xml" output-version="1.0">
        <lucene-document id="{$id}">
          <header>
            <tei>
              <xsl:apply-templates mode="tei-copy" select="." />
            </tei>
          </header>
          <fields>
            <xsl:call-template name="dates">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>

            <xsl:for-each select="head">
              <xsl:variable name="key" select="hofClass/@key" />
              <xsl:variable name="name" select="lower-case(normalize-space(hofClass))" />
              <xsl:variable name="reg-name" select="$al-hofclasses//node()[@id = $key]/regName" />

              <xsl:call-template name="field-with-thesaurus">
                <xsl:with-param name="field" select="'hofclass'" />
                <xsl:with-param name="key" select="$key" />
                <xsl:with-param name="name" select="$name" />
                <xsl:with-param name="reg-name" select="$reg-name" />
                <xsl:with-param name="sort-field" select="true()" />
              </xsl:call-template>

              <xsl:call-template name="free-text" />
            </xsl:for-each>
          </fields>
        </lucene-document>
      </xsl:result-document>
    </xsl:if>
  </xsl:template>

  <xsl:template name="dates">
    <xsl:param name="id" required="yes" />

    <xsl:variable name="year" select="substring-before(substring-after($id, 'hofm_'), '_')" />
    <xsl:variable name="month" select="substring-before(substring-after($id, concat('hofm_', $year, '_')), '_')" />

    <sort name="by-date">
      <xsl:value-of select="$year" />
      <xsl:value-of select="$month" />
    </sort>
    <field indexed="un-tokenized" name="date" stored="yes" vector="no">
      <xsl:value-of select="$year" />
      <xsl:value-of select="$month" />
    </field>
    <field indexed="no" name="title-date" stored="yes" vector="no">
      <xsl:choose>
        <xsl:when test="$tei-doc//TEI.2/text/body/head[2]">
          <xsl:value-of select="$tei-doc//TEI.2/text/body/head[2]" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tei-doc//TEI.2/text/body/head" />
        </xsl:otherwise>
      </xsl:choose>
    </field>
    <field indexed="no" name="page-number" stored="yes" vector="no">
      <xsl:value-of select="$tei-doc//node()[@id = $id]/preceding::pb[1]/@n" />
    </field>
    <field indexed="no" name="page-number-ed" stored="yes" vector="no">
      <xsl:value-of select="$tei-doc//node()[@id = $id]/preceding::pb[1]/@ed" />
    </field>
  </xsl:template>

  <xsl:template name="free-text">
    <xsl:variable name="ft" select="lower-case(normalize-space(.))" />

    <field indexed="tokenized" name="free-text" stored="yes" vector="no">
      <xsl:call-template name="non-latin-to-latin">
        <xsl:with-param name="text" select="$ft" />
      </xsl:call-template>
    </field>

    <xsl:if test="contains($ft, 'ä') or contains($ft, 'ö') or contains($ft, 'ü')">
      <field indexed="tokenized" name="free-text" stored="yes" vector="no">
        <xsl:call-template name="replace-diaresis">
          <xsl:with-param name="text" select="$ft" />
        </xsl:call-template>
      </field>
    </xsl:if>
  </xsl:template>

  <xsl:template name="non-latin-to-latin">
    <xsl:param name="text" />

    <xsl:value-of select="translate($text, $non-latin-characters, $latin-characters)" />
  </xsl:template>

  <xsl:template name="replace-diaresis">
    <xsl:param name="text" required="yes" />

    <xsl:variable name="no-diaresis" select="replace(replace(replace($text, 'ü', 'ue'), 'ö', 'oe'), 'ä', 'ae')" />
    <xsl:call-template name="non-latin-to-latin">
      <xsl:with-param name="text" select="$no-diaresis" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="baw">
    <xsl:param name="id" required="yes" />

    <xsl:for-each select="bibl | album | wip">
      <xsl:choose>
        <xsl:when test="exists(listBibl)">
          <xsl:variable name="no-listbibl">
            <xsl:element name="{name()}">
              <xsl:sequence select="@*" />
              <xsl:sequence select="node()[not(ancestor-or-self::listBibl)]" />
            </xsl:element>
          </xsl:variable>

          <xsl:variable name="tei">
            <xsl:apply-templates mode="tei-copy" select="." />
          </xsl:variable>

          <xsl:for-each select="$no-listbibl/wip">
            <xsl:call-template name="baw-doc">
              <xsl:with-param name="tei" select="$tei" />
            </xsl:call-template>
          </xsl:for-each>

          <xsl:call-template name="baw-list-doc">
            <xsl:with-param name="id" select="@id" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="baw-doc" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="baw-doc">
    <xsl:param name="tei" />

    <xsl:variable name="id" select="@id" />

    <xsl:if test="string($id)">
      <xsl:result-document encoding="UTF-8" exclude-result-prefixes="#all" href="{$output}/{$id}.xml" indent="yes" method="xml" output-version="1.0">
        <lucene-document id="{$id}">
          <header>
            <tei>
              <xsl:choose>
                <xsl:when test="$tei">
                  <xsl:sequence select="$tei" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates mode="tei-copy" select="." />
                </xsl:otherwise>
              </xsl:choose>
            </tei>
          </header>
          <fields>
            <xsl:call-template name="dates">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>
            <xsl:call-template name="fields">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>
            <xsl:call-template name="free-text" />
          </fields>
        </lucene-document>
      </xsl:result-document>
    </xsl:if>
  </xsl:template>

  <xsl:template name="fields">
    <xsl:param name="id" required="yes" />
    <xsl:param name="exclude-listbibl" select="false()" />

    <xsl:if test="not(.//composer)">
      <sort name="by-composer" />
    </xsl:if>

    <xsl:for-each select=".//composer">
      <xsl:variable name="key" select="@key" />
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-composers//composer[@id = $key]/regName" />

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'composer'" />
        <xsl:with-param name="key" select="$key" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="reg-name" select="$reg-name" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="not(.//title)">
      <sort name="by-title" />
    </xsl:if>

    <xsl:for-each select=".//title">
      <xsl:call-template name="field-no-thesaurus">
        <xsl:with-param name="field" select="'title'" />
        <xsl:with-param name="value" select="." />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="not(.//opus)">
      <sort name="by-opus" />
    </xsl:if>

    <xsl:for-each select=".//opus">
      <xsl:variable name="key" select="@key" />
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-opus//opus[@id = $key]/regName" />
      <xsl:variable name="sort">
        <xsl:analyze-string regex="^([a-z\.]*)(\d+)(\w*\.*)(\s?)([a-z\.]*)(\s?)(\d*)(\w*)(\s?)([a-z\.]*)(\s?)(\-*)(\d*)(\w*)$" select="$name">
          <xsl:matching-substring>
            <xsl:value-of select="regex-group(1)" />
            <xsl:value-of select="local:pad(regex-group(2))" />
            <xsl:value-of select="regex-group(3)" />
            <xsl:value-of select="regex-group(4)" />
            <xsl:value-of select="regex-group(5)" />
            <xsl:value-of select="regex-group(6)" />
            <xsl:value-of select="local:pad(regex-group(7))" />
            <xsl:value-of select="regex-group(8)" />
            <xsl:value-of select="regex-group(9)" />
            <xsl:value-of select="regex-group(10)" />
            <xsl:value-of select="regex-group(11)" />
            <xsl:value-of select="regex-group(12)" />
            <xsl:value-of select="local:pad(regex-group(13))" />
            <xsl:value-of select="regex-group(14)" />
          </xsl:matching-substring>
        </xsl:analyze-string>
      </xsl:variable>

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'opus'" />
        <xsl:with-param name="key" select="$key" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="reg-name" select="$reg-name" />
        <xsl:with-param name="sort" select="$sort" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select=".//key">
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-keys//excel:Row/excel:Cell[2][lower-case(normalize-space(../excel:Cell[1])) = $name]" />

      <field indexed="tokenized" name="key" stored="yes" vector="no">
        <xsl:value-of select="$name" />
      </field>

      <field indexed="un-tokenized" name="key" stored="yes" vector="no">
        <xsl:value-of select="lower-case($reg-name[1])" />
      </field>

      <field indexed="un-tokenized" name="key-key" stored="yes" vector="no">
        <xsl:value-of select="$name" />
      </field>
    </xsl:for-each>

    <xsl:if test="not(.//publisher)">
      <sort name="by-publisher" />
    </xsl:if>

    <xsl:for-each select=".//publisher">
      <xsl:variable name="key" select="@key" />
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-publishers//publisher[@id = $key]/regName" />

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'publisher'" />
        <xsl:with-param name="key" select="$key" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="reg-name" select="$reg-name" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="not(.//pubPlace)">
      <sort name="by-pubplace" />
    </xsl:if>

    <xsl:for-each select=".//pubPlace">
      <xsl:variable name="key" select="@key" />
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-pubplaces//pubPlace[@id = $key]/regName" />

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'pubplace'" />
        <xsl:with-param name="key" select="$key" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="reg-name" select="$reg-name" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>

      <xsl:variable name="country" select="$al-pubplaces//pubPlace[@id = $key]/country" />
      <xsl:variable name="country-key" select="$al-countries//countryCode[internal = $country]/internal" />
      <xsl:variable name="country-name" select="lower-case($al-countries//countryCode[internal = $country]/full)" />
      <xsl:variable name="country-reg-name" select="$al-countries//countryCode[internal = $country]/full" />

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'country'" />
        <xsl:with-param name="key" select="$country-key" />
        <xsl:with-param name="name" select="$country-name" />
        <xsl:with-param name="reg-name" select="$country-reg-name" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select=".//hofClass">
      <xsl:variable name="key" select="@key" />
      <xsl:variable name="name" select="lower-case(normalize-space(.))" />
      <xsl:variable name="reg-name" select="$al-hofclasses//node()[@id = $key]/regName" />

      <xsl:call-template name="field-with-thesaurus">
        <xsl:with-param name="field" select="'hofclass'" />
        <xsl:with-param name="key" select="$key" />
        <xsl:with-param name="name" select="$name" />
        <xsl:with-param name="reg-name" select="$reg-name" />
        <xsl:with-param name="sort-field" select="position() = 1" />
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select=".//regNumber">
      <field indexed="un-tokenized" name="regnumber" stored="yes" vector="no">
        <xsl:value-of select="normalize-space(.)" />
      </field>
    </xsl:for-each>
  </xsl:template>

  <xsl:function as="xs:string" name="local:pad">
    <xsl:param name="text" />

    <xsl:choose>
      <xsl:when test="string-length($text) = 1">
        <xsl:value-of select="concat('00', $text)" />
      </xsl:when>
      <xsl:when test="string-length($text) = 2">
        <xsl:value-of select="concat('0', $text)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:template name="field-with-thesaurus">
    <xsl:param name="field" required="yes" />
    <xsl:param name="key" required="yes" />
    <xsl:param name="name" required="yes" />
    <xsl:param name="reg-name" required="yes" />
    <xsl:param name="sort-field" required="yes" />
    <xsl:param name="sort" />

    <xsl:if test="$sort-field = true()">
      <sort name="by-{$field}">
        <xsl:variable name="latin">
          <xsl:call-template name="non-latin-to-latin">
            <xsl:with-param name="text" select="if (string($sort)) then $sort else $name" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="clean-sort-field">
          <xsl:with-param name="text" select="$latin" />
        </xsl:call-template>
      </sort>
    </xsl:if>

    <field indexed="tokenized" name="{$field}" stored="yes" vector="no">
      <xsl:call-template name="non-latin-to-latin">
        <xsl:with-param name="text" select="$name" />
      </xsl:call-template>
    </field>

    <field indexed="un-tokenized" name="{$field}-display" stored="yes" vector="no">
      <xsl:value-of select="$reg-name" />
    </field>

    <xsl:if test="contains($name, 'ä') or contains($name, 'ö') or contains($name, 'ü')">
      <field indexed="tokenized" name="{$field}" stored="yes" vector="no">
        <xsl:call-template name="replace-diaresis">
          <xsl:with-param name="text" select="$name" />
        </xsl:call-template>
      </field>
    </xsl:if>

    <field indexed="un-tokenized" name="{$field}-thesaurus" stored="yes" vector="no">
      <xsl:call-template name="non-latin-to-latin">
        <xsl:with-param name="text" select="lower-case($reg-name)" />
      </xsl:call-template>
      <xsl:text>#</xsl:text>
      <xsl:if test="string($sort)">
        <xsl:value-of select="$sort" />
        <xsl:text>___</xsl:text>
      </xsl:if>
      <xsl:value-of select="$reg-name" />
      <xsl:text>#</xsl:text>
      <xsl:value-of select="$key" />
    </field>

    <xsl:if test="contains(lower-case($reg-name), 'ä') or contains(lower-case($reg-name), 'ö') or contains(lower-case($reg-name), 'ü')">
      <field indexed="un-tokenized" name="{$field}-thesaurus" stored="yes" vector="no">
        <xsl:call-template name="replace-diaresis">
          <xsl:with-param name="text" select="lower-case($reg-name)" />
        </xsl:call-template>
        <xsl:text>#</xsl:text>
        <xsl:value-of select="$reg-name" />
        <xsl:text>#</xsl:text>
        <xsl:value-of select="$key" />
      </field>
    </xsl:if>

    <field indexed="un-tokenized" name="{$field}-key" stored="yes" vector="no">
      <xsl:value-of select="$key" />
    </field>
  </xsl:template>

  <xsl:template name="clean-sort-field">
    <xsl:param name="text" required="yes" />

    <xsl:variable name="symbols">(),;-_</xsl:variable>

    <xsl:variable name="dots" select="translate($text, $symbols, '')" />
    <xsl:value-of select="translate($dots, '.', ' ')" />
  </xsl:template>

  <xsl:template name="field-no-thesaurus">
    <xsl:param name="field" required="yes" />
    <xsl:param name="value" required="yes" />
    <xsl:param name="sort-field" required="yes" />

    <xsl:variable name="value-clean" select="lower-case(normalize-space($value))" />

    <xsl:if test="$sort-field = true()">
      <xsl:variable name="sort">
        <xsl:choose>
          <xsl:when test="string-length($value) > 10">
            <xsl:value-of select="substring($value, 1, 10)" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$value-clean" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <sort name="by-{$field}">
        <xsl:variable name="latin">
          <xsl:call-template name="non-latin-to-latin">
            <xsl:with-param name="text" select="$sort" />
          </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="clean-sort-field">
          <xsl:with-param name="text" select="$latin" />
        </xsl:call-template>
      </sort>
    </xsl:if>

    <field indexed="tokenized" name="{$field}" stored="yes" vector="no">
      <xsl:call-template name="non-latin-to-latin">
        <xsl:with-param name="text" select="$value-clean" />
      </xsl:call-template>
    </field>

    <field indexed="un-tokenized" name="{$field}-display" stored="yes" vector="no">
      <xsl:value-of select="$value" />
    </field>

    <xsl:if test="contains($value, 'ä') or contains($value, 'ö') or contains($value, 'ü')">
      <field indexed="tokenized" name="{$field}" stored="yes" vector="no">
        <xsl:call-template name="replace-diaresis">
          <xsl:with-param name="text" select="$value-clean" />
        </xsl:call-template>
      </field>
    </xsl:if>
  </xsl:template>

  <xsl:template name="baw-list-doc">
    <xsl:param name="id" required="yes" />

    <xsl:variable name="listbibl">
      <xsl:apply-templates mode="tei-copy" select="." />
    </xsl:variable>

    <xsl:variable name="free-text">
      <xsl:call-template name="free-text" />
    </xsl:variable>

    <xsl:if test="string($id)">
      <xsl:for-each select="listBibl/bibl[.//seg]">
        <xsl:result-document encoding="UTF-8" exclude-result-prefixes="#all" href="{$output}/{$id}.{generate-id(.)}.xml" indent="yes" method="xml"
          output-version="1.0">
          <lucene-document id="{$id}.{generate-id(.)}">
            <header>
              <tei>
                <xsl:sequence select="$listbibl" />
              </tei>
            </header>
            <fields>
              <xsl:for-each select=".//seg">
                <xsl:choose>
                  <xsl:when test="string(@sameAs) or string(@corresp)">
                    <xsl:variable name="ref">
                      <xsl:choose>
                        <xsl:when test="string(@sameAs)">
                          <xsl:value-of select="@sameAs" />
                        </xsl:when>
                        <xsl:when test="string(@corresp)">
                          <xsl:value-of select="@corresp" />
                        </xsl:when>
                      </xsl:choose>
                    </xsl:variable>

                    <xsl:for-each select="//seg[@id = $ref]">
                      <xsl:call-template name="dates">
                        <xsl:with-param name="id" select="$id" />
                      </xsl:call-template>
                      <xsl:call-template name="fields">
                        <xsl:with-param name="id" select="$id" />
                      </xsl:call-template>

                      <xsl:sequence select="$free-text" />
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="dates">
                      <xsl:with-param name="id" select="$id" />
                    </xsl:call-template>
                    <xsl:call-template name="fields">
                      <xsl:with-param name="id" select="$id" />
                    </xsl:call-template>

                    <xsl:sequence select="$free-text" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </fields>
          </lucene-document>
        </xsl:result-document>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template name="listbibl">
    <xsl:param name="id" required="yes" />

    <xsl:for-each select="listBibl">
      <xsl:variable name="bibl-id" select="bibl[1]/@id" />

      <xsl:result-document encoding="UTF-8" exclude-result-prefixes="#all" href="{$output}/{$bibl-id}.xml" indent="yes" method="xml"
        output-version="1.0">
        <lucene-document id="{$bibl-id}">
          <header>
            <tei>
              <xsl:apply-templates mode="tei-copy" select="." />
            </tei>
          </header>
          <fields>
            <xsl:call-template name="dates">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>

            <xsl:for-each select="bibl">
              <xsl:call-template name="fields">
                <xsl:with-param name="id" select="$id" />
              </xsl:call-template>
            </xsl:for-each>

            <xsl:call-template name="free-text" />
          </fields>
        </lucene-document>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>

  <!-- copy tei elements -->
  <xsl:template match="*" mode="tei-copy">
    <xsl:element name="{name()}">
      <xsl:for-each select="@*">
        <xsl:if test="name() != 'TEIform'">
          <xsl:sequence select="." />
        </xsl:if>
      </xsl:for-each>
      <xsl:apply-templates mode="tei-copy" />
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
