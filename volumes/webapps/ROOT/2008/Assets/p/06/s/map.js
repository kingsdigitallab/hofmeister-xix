var map;

const markers = [
  {
    country: `AU`,
    coords: [47.385, 9.902],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0054.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0054&amp;field1Txt=Bezau" class="int">Bezau</a>`,
  },
  {
    country: `AU`,
    coords: [47.5167, 9.7667],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0079.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0079&amp;field1Txt=Bregenz" class="int">Bregenz</a>`,
  },
  {
    country: `AU`,
    coords: [46.983, 10.033],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0222.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0222&amp;field1Txt=Gaschurn" class="int">Gaschurn</a>`,
  },
  {
    country: `AU`,
    coords: [47.9333, 13.8],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0237.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0237&amp;field1Txt=Gmunden" class="int">Gmunden</a>`,
  },
  {
    country: `AU`,
    coords: [47.0833, 15.3667],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0245.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0245&amp;field1Txt=Graz" class="int">Graz</a><ul><li>Gratz</li><li>Grätz</li></ul>`,
  },
  {
    country: `AU`,
    coords: [47.2667, 11.4],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0321.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0321&amp;field1Txt=Innsbruck" class="int">Innsbruck</a><ul><li>Insbruck</li></ul>`,
  },
  {
    country: `AU`,
    coords: [46.6333, 14.3333],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0351.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0351&amp;field1Txt=Klagenfurt" class="int">Klagenfurt</a>`,
  },
  {
    country: `AU`,
    coords: [48.3667, 16.3333],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0361.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0361&amp;field1Txt=Korneuburg" class="int">Korneuburg</a>`,
  },
  {
    country: `AU`,
    coords: [48.4167, 15.6],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0364.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0364&amp;field1Txt=Krems" class="int">Krems</a>`,
  },
  {
    country: `AU`,
    coords: [47.3833, 15.1],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0404.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0404&amp;field1Txt=Leoben" class="int">Leoben</a>`,
  },
  {
    country: `AU`,
    coords: [46.85, 12.8333],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0410.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0410&amp;field1Txt=Lienz" class="int">Lienz</a>`,
  },
  {
    country: `AU`,
    coords: [48.3167, 14.3],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0415.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0415&amp;field1Txt=Linz" class="int">Linz</a><ul><li>Lintz</li><li>Linz a/D</li></ul>`,
  },
  {
    country: `AU`,
    coords: [48.2167, 13.4833],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0578.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0578&amp;field1Txt=Ried &lt;Innkreis&gt;" class="int">Ried &lt;Innkreis&gt;</a><ul><li>Ried</li></ul>`,
  },
  {
    country: `AU`,
    coords: [47.8, 13.05],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0602.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0602&amp;field1Txt=Salzburg" class="int">Salzburg</a><ul><li>Salzb</li><li>Salzb.</li></ul>`,
  },
  {
    country: `AU`,
    coords: [48.2, 15.6167],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0609.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0609&amp;field1Txt=Sankt Pölten" class="int">Sankt Pölten</a><ul><li>St. Pölten</li></ul>`,
  },
  {
    country: `AU`,
    coords: [47.4, 16.15],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0619.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0619&amp;field1Txt=Schreibersdorf" class="int">Schreibersdorf</a>`,
  },
  {
    country: `AU`,
    coords: [47.8667, 16.4667],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0639.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0639&amp;field1Txt=Sonneberg" class="int">Sonneberg</a><ul><li>Sonnenberg</li></ul>`,
  },
  {
    country: `AU`,
    coords: [48.0667, 14.4167],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0652.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0652&amp;field1Txt=Steyr" class="int">Steyr</a>`,
  },
  {
    country: `AU`,
    coords: [48.1667, 14.0333],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0725.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0725&amp;field1Txt=Wels" class="int">Wels</a>`,
  },
  {
    country: `AU`,
    coords: [48.2167, 16.3667],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0731.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0731&amp;field1Txt=Wien" class="int">Wien</a><ul><li>Vienna</li><li>Wieu</li><li>wien</li><li>Wién</li></ul>`,
  },
  {
    country: `AU`,
    coords: [48.2333, 16.35],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0732.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0732&amp;field1Txt=Wien-Währing" class="int">Wien-Währing</a>`,
  },
  {
    country: `AU`,
    coords: [47.8167, 16.25],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0733.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0733&amp;field1Txt=Wiener-Neustadt" class="int">Wiener-Neustadt</a>`,
  },
  {
    country: `AU`,
    coords: [48.6167, 15.1667],
    info: `Austria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0762.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0762&amp;field1Txt=Zwettl" class="int">Zwettl</a>`,
  },
  {
    country: `BE`,
    coords: [51.2167, 4.4167],
    info: `Belgium<br/><a href="content/database/indices/pubPlaces/pubplace/place_0016.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0016&amp;field1Txt=Antwerpen" class="int">Antwerpen</a>`,
  },
  {
    country: `BE`,
    coords: [50.8333, 4.3333],
    info: `Belgium<br/><a href="content/database/indices/pubPlaces/pubplace/place_0089.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0089&amp;field1Txt=Brüssel" class="int">Brüssel</a><ul><li>Bruxelles</li></ul>`,
  },
  {
    country: `BE`,
    coords: [51.0333, 3.7],
    info: `Belgium<br/><a href="content/database/indices/pubPlaces/pubplace/place_0226.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0226&amp;field1Txt=Gent" class="int">Gent</a><ul><li>Gand</li></ul>`,
  },
  {
    country: `BE`,
    coords: [50.6333, 5.5833],
    info: `Belgium<br/><a href="content/database/indices/pubPlaces/pubplace/place_0434.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0434&amp;field1Txt=Lüttich" class="int">Lüttich 
                    (Liège)
                </a>`,
  },
  {
    country: `BK`,
    coords: [43.3333, 17.8],
    info: `Bosnia and Herzegovina<br/><a href="content/database/indices/pubPlaces/pubplace/place_0467.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0467&amp;field1Txt=Mostar" class="int">Mostar</a>`,
  },
  {
    country: `BU`,
    coords: [42.6667, 23.3],
    info: `Bulgaria<br/><a href="content/database/indices/pubPlaces/pubplace/place_0634.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0634&amp;field1Txt=Sofia" class="int">Sofia</a>`,
  },
  {
    country: `DA`,
    coords: [55.25, 9.5],
    info: `Denmark<br/><a href="content/database/indices/pubPlaces/pubplace/place_0271.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0271&amp;field1Txt=Hadersleben" class="int">Hadersleben</a>`,
  },
  {
    country: `DA`,
    coords: [55.7167, 12.5667],
    info: `Denmark<br/><a href="content/database/indices/pubPlaces/pubplace/place_0360.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0360&amp;field1Txt=Kopenhagen" class="int">Kopenhagen 
                    (København)
                </a><ul><li>Cop</li><li>Copenh</li><li>Copenhagen</li><li>Copenpenhagen</li></ul>`,
  },
  {
    country: `DA`,
    coords: [54.95, 8.8833],
    info: `Denmark<br/><a href="content/database/indices/pubPlaces/pubplace/place_0682.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0682&amp;field1Txt=Tondern" class="int">Tondern 
                    (Tønder)
                </a>`,
  },
  {
    country: `EN`,
    coords: [58.35, 26.7333],
    info: `Estonia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0143.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0143&amp;field1Txt=Dorpat" class="int">Dorpat 
                    (Tartu)
                </a>`,
  },
  {
    country: `EN`,
    coords: [59.4333, 24.7167],
    info: `Estonia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0575.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0575&amp;field1Txt=Reval" class="int">Reval 
                    (Tallinn)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.6833, 14.0],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0028.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0028&amp;field1Txt=Aussig" class="int">Aussig 
                    (Ústi nad Labem)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.2167, 16.6667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0088.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0088&amp;field1Txt=Brünn" class="int">Brünn 
                    (Brno)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [48.9667, 14.4833],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0093.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0093&amp;field1Txt=Budweis" class="int">Budweis 
                    (Česke Budějovice)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.7167, 14.5833],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0101.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0101&amp;field1Txt=Böhmisch-Leipa" class="int">Böhmisch-Leipa 
                    (Česka Lípa)
                </a><ul><li>Böhm. Leipa</li><li>Böhm.-Leipa</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [50.1333, 12.4667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0163.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0163&amp;field1Txt=Eger" class="int">Eger 
                    (Cheb)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.2, 12.75],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0176.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0176&amp;field1Txt=Elnbogen" class="int">Elnbogen</a>`,
  },
  {
    country: `EZ`,
    coords: [50.25, 17.1667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0209.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0209&amp;field1Txt=Freiwaldau &lt;Nordmährisches Gebiet&gt;" class="int">Freiwaldau &lt;Nordmährisches Gebiet&gt; 
                    (Jesenik)
                </a><ul><li>Freiwaldau</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [50.0, 17.45],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0210.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0210&amp;field1Txt=Freudenthal" class="int">Freudenthal 
                    (Bruntál)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.683, 18.35],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0214.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0214&amp;field1Txt=Friedek" class="int">Friedek</a>`,
  },
  {
    country: `EZ`,
    coords: [50.7333, 15.1667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0221.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0221&amp;field1Txt=Gablonz &lt;Neisse&gt;" class="int">Gablonz &lt;Neisse&gt; 
                    (Jablonec)
                </a><ul><li>Gablonz</li><li>Gablonz a/N</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [50.0833, 17.6667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0329.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0329&amp;field1Txt=Jägerndorf" class="int">Jägerndorf 
                    (Krnov)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.2167, 12.8667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0338.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0338&amp;field1Txt=Karlsbad" class="int">Karlsbad 
                    (Karlovy Vary)
                </a><ul><li>Carlsb</li><li>Carlsbad</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [50.45, 13.4333],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0356.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0356&amp;field1Txt=Komotau" class="int">Komotau 
                    (Chomutov)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.55, 14.1667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0400.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0400&amp;field1Txt=Leitmeritz" class="int">Leitmeritz 
                    (Litoměřice)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.4667, 17.45],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0468.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0468&amp;field1Txt=Moštěnitz-Prerau" class="int">Moštěnitz-Prerau 
                    (Přerov)
                </a><ul><li>Mostenitz</li><li>Mostěnitz</li><li>Moštěnitz</li><li>Mostěnitz-Prerau</li><li>Ober-Moštěnitz</li><li>Prerau</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [49.8333, 18.25],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0469.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0469&amp;field1Txt=Mährisch-Ostrau" class="int">Mährisch-Ostrau 
                    (Ostrava)
                </a><ul><li>M. Ostrau</li><li>Mähr. Ostrau</li><li>Mähr.-Ostrau</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [49.7833, 16.6667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0470.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0470&amp;field1Txt=Mährisch-Trübau" class="int">Mährisch-Trübau 
                    (Moravské Třebová)
                </a><ul><li>Mähr.-Trübau</li><li>Trübau</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [49.6167, 18],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0500.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0500&amp;field1Txt=Neutitschein" class="int">Neutitschein 
                    (Nový Jičín)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [48.8, 16.6333],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0504.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0504&amp;field1Txt=Nikolsburg" class="int">Nikolsburg 
                    (Mikulov)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.6333, 17.25],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0524.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0524&amp;field1Txt=Olmütz" class="int">Olmütz 
                    (Olomouc)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.75, 13.4167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0546.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0546&amp;field1Txt=Pilsen" class="int">Pilsen 
                    (Plzeň)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.1, 14.4333],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0554.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0554&amp;field1Txt=Prag" class="int">Prag 
                    (Praha)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.0667, 14.4667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0555.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0555&amp;field1Txt=Prag-Weinberge" class="int">Prag-Weinberge 
                    (Královské Vinohrady)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.8, 15.0833],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0571.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0571&amp;field1Txt=Reichenberg" class="int">Reichenberg 
                    (Liberec)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.3333, 13.5667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0600.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0600&amp;field1Txt=Saaz" class="int">Saaz 
                    (Žatec)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.25, 12.4167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0628.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0628&amp;field1Txt=Schönbach b/Eger" class="int">Schönbach b/Eger 
                    (Luby)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.9, 14.5167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0630.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0630&amp;field1Txt=Schönlinde" class="int">Schönlinde 
                    (Krásná Lípa &lt;Rumburg&gt;)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.6667, 13.8167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0672.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0672&amp;field1Txt=Teplitz" class="int">Teplitz 
                    (Teplice)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.45, 14.717],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0681.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0681&amp;field1Txt=Tirnau" class="int">Tirnau 
                    (Trnova)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [50.5667, 15.9167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0684.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0684&amp;field1Txt=Trautenau" class="int">Trautenau 
                    (Trutnov)
                </a>`,
  },
  {
    country: `EZ`,
    coords: [49.217, 15.883],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0685.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0685&amp;field1Txt=Trebitsch" class="int">Trebitsch</a>`,
  },
  {
    country: `EZ`,
    coords: [49.9667, 17.9167],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0689.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0689&amp;field1Txt=Troppau" class="int">Troppau 
                    (Opava)
                </a><ul><li>Tr</li></ul>`,
  },
  {
    country: `EZ`,
    coords: [50.5, 13.05],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0722.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0722&amp;field1Txt=Weipert" class="int">Weipert</a>`,
  },
  {
    country: `EZ`,
    coords: [48.8667, 16.0667],
    info: `Czech Republic<br/><a href="content/database/indices/pubPlaces/pubplace/place_0758.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0758&amp;field1Txt=Znaim" class="int">Znaim 
                    (Znojmo)
                </a>`,
  },
  {
    country: `FI`,
    coords: [60.1333, 25.0],
    info: `Finland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0290.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0290&amp;field1Txt=Helsinki" class="int">Helsinki</a><ul><li>Helsingissä</li><li>Helsingfors</li></ul>`,
  },
  {
    country: `FR`,
    coords: [48.0833, 7.35],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0119.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0119&amp;field1Txt=Colmar" class="int">Colmar</a><ul><li>Kolmar</li><li>Colmar i./E</li><li>Colmar i/E</li></ul>`,
  },
  {
    country: `FR`,
    coords: [49.3667, 6.1833],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0136.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0136&amp;field1Txt=Diedenhofen" class="int">Diedenhofen 
                    (Thionville)
                </a><ul><li>Diedenhoven</li><li>Dietenhofen</li></ul>`,
  },
  {
    country: `FR`,
    coords: [49.1167, 6.1833],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0455.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0455&amp;field1Txt=Metz" class="int">Metz</a>`,
  },
  {
    country: `FR`,
    coords: [47.75, 7.35],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0473.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0473&amp;field1Txt=Mülhausen" class="int">Mülhausen 
                    (Mulhouse)
                </a><ul><li>Mühlhausen i/Els</li><li>Mülhausen i/E</li><li>Mülhausen i/Els</li></ul>`,
  },
  {
    country: `FR`,
    coords: [43.7, 7.2667],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0505.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0505&amp;field1Txt=Nizza" class="int">Nizza 
                    (Nice)
                </a>`,
  },
  {
    country: `FR`,
    coords: [48.8667, 2.3333],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0537.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0537&amp;field1Txt=Paris" class="int">Paris</a>`,
  },
  {
    country: `FR`,
    coords: [49.4333, 1.0833],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0593.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0593&amp;field1Txt=Rouen" class="int">Rouen</a>`,
  },
  {
    country: `FR`,
    coords: [48.5833, 7.75],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0657.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0657&amp;field1Txt=Strassburg" class="int">Strassburg 
                    (Strasbourg)
                </a><ul><li>Strasbourg</li><li>Strassburg i/E</li></ul>`,
  },
  {
    country: `FR`,
    coords: [48.75, 7.3667],
    info: `France<br/><a href="content/database/indices/pubPlaces/pubplace/place_0750.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0750&amp;field1Txt=Zabern" class="int">Zabern 
                    (Saverne)
                </a>`,
  },
  {
    country: `GM`,
    coords: [50.7667, 6.1],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0001.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0001&amp;field1Txt=Aachen" class="int">Aachen</a>`,
  },
  {
    country: `GM`,
    coords: [51.7167, 11.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0005.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0005&amp;field1Txt=Alsleben &lt;Saale&gt;" class="int">Alsleben &lt;Saale&gt;</a><ul><li>Alsleben</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9833, 12.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0007.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0007&amp;field1Txt=Altenburg &lt;Thüringen&gt;" class="int">Altenburg &lt;Thüringen&gt;</a><ul><li>Altenburg</li><li>Altenhurg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.55, 9.9333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0008.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0008&amp;field1Txt=Altona &lt;Hamburg&gt;" class="int">Altona &lt;Hamburg&gt;</a><ul><li>Altona</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.75, 8.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0009.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0009&amp;field1Txt=Alzey" class="int">Alzey</a>`,
  },
  {
    country: `GM`,
    coords: [49.45, 11.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0010.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0010&amp;field1Txt=Amberg &lt;Oberpfalz&gt;" class="int">Amberg &lt;Oberpfalz&gt;</a><ul><li>Amberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.4333, 7.4],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0012.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0012&amp;field1Txt=Andernach" class="int">Andernach</a>`,
  },
  {
    country: `GM`,
    coords: [53.8667, 13.7],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0013.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0013&amp;field1Txt=Anklam" class="int">Anklam</a><ul><li>Anclam</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.5667, 13.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0014.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0014&amp;field1Txt=Annaberg &lt;Erzgebirge&gt;" class="int">Annaberg &lt;Erzgebirge&gt;</a><ul><li>Annaberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.3, 10.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0015.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0015&amp;field1Txt=Ansbach" class="int">Ansbach</a>`,
  },
  {
    country: `GM`,
    coords: [51.0167, 11.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0017.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0017&amp;field1Txt=Apolda" class="int">Apolda</a>`,
  },
  {
    country: `GM`,
    coords: [51.3833, 8.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0019.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0019&amp;field1Txt=Arnsberg" class="int">Arnsberg</a><ul><li>Arensberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.8333, 10.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0020.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0020&amp;field1Txt=Arnstadt" class="int">Arnstadt</a>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 9.0167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0022.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0022&amp;field1Txt=Arolsen" class="int">Arolsen</a>`,
  },
  {
    country: `GM`,
    coords: [49.9833, 9.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0024.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0024&amp;field1Txt=Aschaffenburg" class="int">Aschaffenburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.75, 11.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0025.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0025&amp;field1Txt=Aschersleben &lt;Halle, Saale&gt;" class="int">Aschersleben &lt;Halle, Saale&gt;</a><ul><li>Aschersleben</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.35, 10.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0026.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0026&amp;field1Txt=Augsburg" class="int">Augsburg</a><ul><li>Augsb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.4667, 7.4833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0027.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0027&amp;field1Txt=Aurich" class="int">Aurich</a>`,
  },
  {
    country: `GM`,
    coords: [49.85, 7.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0029.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0029&amp;field1Txt=Bad Kreuznach" class="int">Bad Kreuznach</a>`,
  },
  {
    country: `GM`,
    coords: [48.75, 8.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0031.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0031&amp;field1Txt=Baden-Baden" class="int">Baden-Baden</a>`,
  },
  {
    country: `GM`,
    coords: [51.7167, 11.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0032.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0032&amp;field1Txt=Ballenstedt" class="int">Ballenstedt</a>`,
  },
  {
    country: `GM`,
    coords: [49.9, 10.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0033.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0033&amp;field1Txt=Bamberg" class="int">Bamberg</a>`,
  },
  {
    country: `GM`,
    coords: [51.2833, 7.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0034.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0034&amp;field1Txt=Barmen" class="int">Barmen</a>`,
  },
  {
    country: `GM`,
    coords: [51.1833, 14.4833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0036.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0036&amp;field1Txt=Bautzen" class="int">Bautzen</a>`,
  },
  {
    country: `GM`,
    coords: [49.45, 11.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0037.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0037&amp;field1Txt=Bayreuth" class="int">Bayreuth</a><ul><li>Baireuth</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.6833, 8.6333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0040.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0040&amp;field1Txt=Bensheim" class="int">Bensheim</a>`,
  },
  {
    country: `GM`,
    coords: [53.4833, 10.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0042.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0042&amp;field1Txt=Bergedorf" class="int">Bergedorf</a>`,
  },
  {
    country: `GM`,
    coords: [52.5333, 13.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0044.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0044&amp;field1Txt=Berlin" class="int">Berlin</a><ul><li>Berl</li><li>Berli</li><li>Perlin</li><li>Belin</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.45, 13.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0045.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0045&amp;field1Txt=Berlin-Köpenick" class="int">Berlin-Köpenick</a><ul><li>Coepenick</li><li>Köpenick</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.4333, 13.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0046.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0046&amp;field1Txt=Berlin-Lichterfelde" class="int">Berlin-Lichterfelde</a><ul><li>Lichterfelde</li><li>Gr. Lichterfelde</li><li>Gr.-Lichterfelde</li><li>Gross-Lichterfelde</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.5333, 13.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0047.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0047&amp;field1Txt=Berlin-Rixdorf" class="int">Berlin-Rixdorf</a><ul><li>Rixdorf-Berlin</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.4833, 13.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0048.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0048&amp;field1Txt=Berlin-Schöneberg" class="int">Berlin-Schöneberg</a><ul><li>Schöneberg</li><li>Schöneberg-Berlin</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.4667, 13.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0049.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0049&amp;field1Txt=Berlin-Zehlendorf" class="int">Berlin-Zehlendorf</a><ul><li>Zehlendorf</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.8, 11.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0051.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0051&amp;field1Txt=Bernburg" class="int">Bernburg</a>`,
  },
  {
    country: `GM`,
    coords: [53.6, 7.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0052.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0052&amp;field1Txt=Berum" class="int">Berum</a>`,
  },
  {
    country: `GM`,
    coords: [52.033, 8.533],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0053.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0053&amp;field1Txt=Bethel bei Bielefeld" class="int">Bethel bei Bielefeld</a>`,
  },
  {
    country: `GM`,
    coords: [48.1, 9.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0055.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0055&amp;field1Txt=Biberach &lt;Riss&gt;" class="int">Biberach &lt;Riss&gt;</a><ul><li>Biberach</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.0333, 8.5333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0057.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0057&amp;field1Txt=Bielefeld" class="int">Bielefeld</a>`,
  },
  {
    country: `GM`,
    coords: [49.9667, 7.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0059.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0059&amp;field1Txt=Bingen &lt;Rhein&gt;" class="int">Bingen &lt;Rhein&gt;</a><ul><li>Bingen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.6167, 12.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0062.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0062&amp;field1Txt=Bitterfeld" class="int">Bitterfeld</a>`,
  },
  {
    country: `GM`,
    coords: [51.8, 10.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0063.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0063&amp;field1Txt=Blankenburg" class="int">Blankenburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0064.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0064&amp;field1Txt=Blasewitz &lt;Dresden&gt;" class="int">Blasewitz &lt;Dresden&gt;</a><ul><li>Dresden-Blasewitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4667, 7.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0066.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0066&amp;field1Txt=Bochum" class="int">Bochum</a>`,
  },
  {
    country: `GM`,
    coords: [50.1, 8.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0067.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0067&amp;field1Txt=Bockenheim &lt;Frankfurt, Main&gt;" class="int">Bockenheim &lt;Frankfurt, Main&gt;</a><ul><li>Bockenheim</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 7.1],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0069.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0069&amp;field1Txt=Bonn" class="int">Bonn</a><ul><li>Bonu</li></ul>`,
  },
  {
    country: `GM`,
    coords: [47.8167, 8.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0070.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0070&amp;field1Txt=Bonndorf" class="int">Bonndorf</a>`,
  },
  {
    country: `GM`,
    coords: [50.25, 7.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0071.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0071&amp;field1Txt=Boppard" class="int">Boppard</a>`,
  },
  {
    country: `GM`,
    coords: [51.1333, 12.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0072.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0072&amp;field1Txt=Borna &lt;Leipziger Land&gt;" class="int">Borna &lt;Leipziger Land&gt;</a><ul><li>Borna</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.4167, 12.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0076.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0076&amp;field1Txt=Brandenburg &lt;Havel&gt;" class="int">Brandenburg &lt;Havel&gt;</a><ul><li>Brandenburg</li><li>Brandenburg a. H</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.25, 10.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0078.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0078&amp;field1Txt=Braunschweig" class="int">Braunschweig</a><ul><li>Brauns</li><li>Braunsch</li><li>Braunschw</li><li>Brschw</li><li>Braunschwein</li><li>Brannschweig</li><li>Branschweig</li><li>Braunschweìg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.0833, 8.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0080.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0080&amp;field1Txt=Bremen" class="int">Bremen</a><ul><li>Br</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.55, 8.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0081.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0081&amp;field1Txt=Bremerhaven" class="int">Bremerhaven</a><ul><li>Bremerhafen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.1333, 8.6],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0086.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0086&amp;field1Txt=Bruchsal" class="int">Bruchsal</a>`,
  },
  {
    country: `GM`,
    coords: [52.2, 12.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0087.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0087&amp;field1Txt=Brück bei Potsdam" class="int">Brück bei Potsdam</a><ul><li>Brück b/Potsdam</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.5667, 13.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0091.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0091&amp;field1Txt=Buchholz &lt;Erzgebirge&gt;" class="int">Buchholz &lt;Erzgebirge&gt;</a><ul><li>Buchholz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.2667, 11.85],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0095.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0095&amp;field1Txt=Burg &lt;Magdeburg&gt;" class="int">Burg &lt;Magdeburg&gt;</a><ul><li>Burg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.45, 10.0167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0096.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0096&amp;field1Txt=Burgdorf" class="int">Burgdorf</a>`,
  },
  {
    country: `GM`,
    coords: [50.9167, 12.8167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0097.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0097&amp;field1Txt=Burgstädt" class="int">Burgstädt</a>`,
  },
  {
    country: `GM`,
    coords: [50.4333, 8.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0099.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0099&amp;field1Txt=Butzbach" class="int">Butzbach</a>`,
  },
  {
    country: `GM`,
    coords: [47.9833, 8.8167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0100.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0100&amp;field1Txt=Bärenthal" class="int">Bärenthal</a>`,
  },
  {
    country: `GM`,
    coords: [48.7, 8.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0102.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0102&amp;field1Txt=Bühl" class="int">Bühl</a>`,
  },
  {
    country: `GM`,
    coords: [51.55, 8.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0103.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0103&amp;field1Txt=Büren &lt;Paderborn&gt;" class="int">Büren &lt;Paderborn&gt;</a><ul><li>Büren</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.4333, 12.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0107.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0107&amp;field1Txt=Carlsfeld" class="int">Carlsfeld</a>`,
  },
  {
    country: `GM`,
    coords: [52.6167, 10.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0108.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0108&amp;field1Txt=Celle" class="int">Celle</a>`,
  },
  {
    country: `GM`,
    coords: [52.5167, 13.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0109.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0109&amp;field1Txt=Charlottenburg &lt;Berlin&gt;" class="int">Charlottenburg &lt;Berlin&gt;</a><ul><li>Berlin-Charlottenburg</li><li>Charlottenburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.8333, 12.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0110.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0110&amp;field1Txt=Chemnitz" class="int">Chemnitz</a><ul><li>Altchemnitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.8, 10.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0115.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0115&amp;field1Txt=Clausthal" class="int">Clausthal</a><ul><li>Klausthal</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.25, 10.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0117.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0117&amp;field1Txt=Coburg" class="int">Coburg</a><ul><li>Koburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.95, 7.1667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0118.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0118&amp;field1Txt=Coesfeld" class="int">Coesfeld</a>`,
  },
  {
    country: `GM`,
    coords: [51.383, 13.933],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0120.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0120&amp;field1Txt=Cosel" class="int">Cosel</a>`,
  },
  {
    country: `GM`,
    coords: [51.7167, 14.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0121.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0121&amp;field1Txt=Cottbus" class="int">Cottbus</a><ul><li>Cottbuss</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.8167, 12.3833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0122.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0122&amp;field1Txt=Crimmitzschau" class="int">Crimmitzschau</a>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 7.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0126.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0126&amp;field1Txt=Daaden" class="int">Daaden</a>`,
  },
  {
    country: `GM`,
    coords: [49.8667, 8.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0128.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0128&amp;field1Txt=Darmstadt" class="int">Darmstadt</a>`,
  },
  {
    country: `GM`,
    coords: [51.5333, 12.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0131.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0131&amp;field1Txt=Delitzsch" class="int">Delitzsch</a>`,
  },
  {
    country: `GM`,
    coords: [53.9167, 13.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0132.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0132&amp;field1Txt=Demmin" class="int">Demmin</a>`,
  },
  {
    country: `GM`,
    coords: [51.85, 12.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0133.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0133&amp;field1Txt=Dessau" class="int">Dessau</a>`,
  },
  {
    country: `GM`,
    coords: [51.9167, 8.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0134.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0134&amp;field1Txt=Detmold" class="int">Detmold</a>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 8.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0137.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0137&amp;field1Txt=Dillenburg" class="int">Dillenburg</a>`,
  },
  {
    country: `GM`,
    coords: [48.55, 10.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0138.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0138&amp;field1Txt=Dillingen &lt;Donau&gt;" class="int">Dillingen &lt;Donau&gt;</a><ul><li>Dillingen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.5667, 6.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0139.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0139&amp;field1Txt=Dinslaken" class="int">Dinslaken</a>`,
  },
  {
    country: `GM`,
    coords: [47.9667, 8.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0140.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0140&amp;field1Txt=Donaueschingen" class="int">Donaueschingen</a>`,
  },
  {
    country: `GM`,
    coords: [48.7333, 10.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0141.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0141&amp;field1Txt=Donauwörth" class="int">Donauwörth</a>`,
  },
  {
    country: `GM`,
    coords: [51.5167, 7.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0144.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0144&amp;field1Txt=Dortmund" class="int">Dortmund</a>`,
  },
  {
    country: `GM`,
    coords: [51.65, 14.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0146.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0146&amp;field1Txt=Drebkau" class="int">Drebkau</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0147.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0147&amp;field1Txt=Dresden" class="int">Dresden</a><ul><li>Dresd</li><li>Drsd</li><li>Dres-</li><li>Dresdon</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0148.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0148&amp;field1Txt=Dresden-Gruna" class="int">Dresden-Gruna</a><ul><li>Gruna-Dresden</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0149.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0149&amp;field1Txt=Dresden-Neustadt" class="int">Dresden-Neustadt</a><ul><li>Dresden-N</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0150.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0150&amp;field1Txt=Dresden-Pieschen" class="int">Dresden-Pieschen</a>`,
  },
  {
    country: `GM`,
    coords: [51.5333, 10.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0151.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0151&amp;field1Txt=Duderstedt" class="int">Duderstedt</a>`,
  },
  {
    country: `GM`,
    coords: [51.4333, 6.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0152.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0152&amp;field1Txt=Duisburg" class="int">Duisburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.1167, 13.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0153.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0153&amp;field1Txt=Döbeln" class="int">Döbeln</a>`,
  },
  {
    country: `GM`,
    coords: [51.8167, 7.2833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0155.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0155&amp;field1Txt=Dülmen" class="int">Dülmen</a>`,
  },
  {
    country: `GM`,
    coords: [50.8, 6.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0156.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0156&amp;field1Txt=Düren" class="int">Düren</a>`,
  },
  {
    country: `GM`,
    coords: [51.2167, 6.7833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0157.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0157&amp;field1Txt=Düsseldorf" class="int">Düsseldorf</a><ul><li>Düsseldorff</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.0167, 14.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0158.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0158&amp;field1Txt=Ebersbach &lt;Sachsen&gt;" class="int">Ebersbach &lt;Sachsen&gt;</a><ul><li>Ebersbach i/S</li><li>Ebersbach i/S.</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.8333, 13.8333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0159.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0159&amp;field1Txt=Eberswalde" class="int">Eberswalde</a>`,
  },
  {
    country: `GM`,
    coords: [51.1167, 11.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0160.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0160&amp;field1Txt=Eckartsberga" class="int">Eckartsberga</a>`,
  },
  {
    country: `GM`,
    coords: [54.4667, 9.8333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0161.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0161&amp;field1Txt=Eckernförde" class="int">Eckernförde</a>`,
  },
  {
    country: `GM`,
    coords: [54.7833, 9.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0162.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0162&amp;field1Txt=Edinburgh" class="int">Edinburgh</a><ul><li>Edinburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4, 12.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0164.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0164&amp;field1Txt=Eggenfelden" class="int">Eggenfelden</a>`,
  },
  {
    country: `GM`,
    coords: [48.9, 11.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0165.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0165&amp;field1Txt=Eichstätt" class="int">Eichstätt</a><ul><li>Eichstädt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.8167, 9.8833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0166.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0166&amp;field1Txt=Eimbeck" class="int">Eimbeck</a>`,
  },
  {
    country: `GM`,
    coords: [50.9833, 10.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0168.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0168&amp;field1Txt=Eisenach" class="int">Eisenach</a>`,
  },
  {
    country: `GM`,
    coords: [50.9667, 11.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0169.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0169&amp;field1Txt=Eisenberg &lt;Thüringen&gt;" class="int">Eisenberg &lt;Thüringen&gt;</a><ul><li>Eisenberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.5333, 11.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0170.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0170&amp;field1Txt=Eisleben" class="int">Eisleben</a><ul><li>Eisleb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.2667, 7.1333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0171.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0171&amp;field1Txt=Elberfeld" class="int">Elberfeld</a><ul><li>Elberf</li><li>Elberfeldt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.95, 10.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0174.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0174&amp;field1Txt=Ellwangen" class="int">Ellwangen</a>`,
  },
  {
    country: `GM`,
    coords: [53.75, 9.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0175.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0175&amp;field1Txt=Elmshorn" class="int">Elmshorn</a>`,
  },
  {
    country: `GM`,
    coords: [53.3833, 7.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0177.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0177&amp;field1Txt=Emden" class="int">Emden</a>`,
  },
  {
    country: `GM`,
    coords: [51.8167, 6.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0178.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0178&amp;field1Txt=Emmerich" class="int">Emmerich</a>`,
  },
  {
    country: `GM`,
    coords: [50.3333, 7.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0179.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0179&amp;field1Txt=Ems &lt;Rhein-Lahn-Kreis&gt;" class="int">Ems &lt;Rhein-Lahn-Kreis&gt;</a><ul><li>Ems</li><li>Bad-Ems</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.2833, 11.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0180.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0180&amp;field1Txt=Erding" class="int">Erding</a>`,
  },
  {
    country: `GM`,
    coords: [50.9667, 11.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0181.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0181&amp;field1Txt=Erfurt" class="int">Erfurt</a><ul><li>Erf</li><li>Ersfurt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.6, 11.0333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0182.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0182&amp;field1Txt=Erlangen" class="int">Erlangen</a>`,
  },
  {
    country: `GM`,
    coords: [51.45, 6.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0184.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0184&amp;field1Txt=Essen" class="int">Essen</a><ul><li>Esser</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.75, 9.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0185.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0185&amp;field1Txt=Esslingen &lt;Neckar&gt;" class="int">Esslingen &lt;Neckar&gt;</a><ul><li>Esslingen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [54.1333, 10.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0186.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0186&amp;field1Txt=Eutin" class="int">Eutin</a>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0187.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0187&amp;field1Txt=Eutritzsch" class="int">Eutritzsch</a><ul><li>Eutritzsch-Leipzig</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.2333, 12.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0188.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0188&amp;field1Txt=Eythra" class="int">Eythra</a><ul><li>Eythre</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.6333, 13.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0191.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0191&amp;field1Txt=Finsterwalde" class="int">Finsterwalde</a>`,
  },
  {
    country: `GM`,
    coords: [54.7833, 9.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0194.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0194&amp;field1Txt=Flensburg" class="int">Flensburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.7667, 14.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0196.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0196&amp;field1Txt=Forst &lt;Lausitz&gt;" class="int">Forst &lt;Lausitz&gt;</a><ul><li>Forst</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9167, 13.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0197.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0197&amp;field1Txt=Frankenberg &lt;Mittweida&gt;" class="int">Frankenberg &lt;Mittweida&gt;</a><ul><li>Frankenberg</li><li>Frankenberg i./S</li><li>Frankenberg i/S</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 11.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0198.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0198&amp;field1Txt=Frankenhausen" class="int">Frankenhausen</a>`,
  },
  {
    country: `GM`,
    coords: [50.1, 8.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0200.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0200&amp;field1Txt=Frankfurt &lt;Main&gt;" class="int">Frankfurt &lt;Main&gt;</a><ul><li>Frankf. a. M</li><li>Frankf., a. M</li><li>Frankfurt a. M</li><li>Frankfurt a/M</li><li>Fkf. a/M</li><li>Frankfurt a M</li><li>Frkf. a/M</li><li>Franfkurt a/M</li><li>Frankf. a/M</li><li>Frankfurt a./M</li><li>Frankfurt a/M.</li><li>Frankturt a/M.</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.3333, 14.5333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0201.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0201&amp;field1Txt=Frankfurt &lt;Oder&gt;" class="int">Frankfurt &lt;Oder&gt;</a><ul><li>Fankf. a. d. O</li><li>Franfurt a. O</li><li>Frankf. a. d. O</li><li>Frankf. a. O</li><li>Frankfurt a O</li><li>Frankfurt a. d. O</li><li>Frankfurt a. O</li><li>Frankfurt a/O</li><li>Frkf. a. O</li><li>Frank a/O</li><li>Frankf. a/O</li><li>Frankfurt a./O</li><li>Frankfurt a/O.</li><li>Fkf. a/O</li><li>Frankfart a/O.</li><li>Frankfurt a, O</li><li>Frankfurt. a/O</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9167, 13.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0205.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0205&amp;field1Txt=Freiberg &lt;Sachsen&gt;" class="int">Freiberg &lt;Sachsen&gt;</a><ul><li>Freiberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.0, 7.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0206.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0206&amp;field1Txt=Freiburg &lt;Breisgau&gt;" class="int">Freiburg &lt;Breisgau&gt;</a><ul><li>Freiburg</li><li>Freiburg i. B</li><li>Freiburg i/Br</li><li>Freiburg i/B</li><li>Freiburg i/Br.</li><li>Freiburg i./Br</li><li>Freiburg, i/B</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.7833, 14.0333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0207.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0207&amp;field1Txt=Freienwalde &lt;Oder&gt;" class="int">Freienwalde &lt;Oder&gt;</a><ul><li>Freienwalde</li><li>Freienwalde a/O</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4, 11.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0208.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0208&amp;field1Txt=Freising" class="int">Freising</a>`,
  },
  {
    country: `GM`,
    coords: [50.3333, 8.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0212.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0212&amp;field1Txt=Friedberg &lt;Hessen&gt;" class="int">Friedberg &lt;Hessen&gt;</a><ul><li>Friedberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.6833, 13.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0215.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0215&amp;field1Txt=Friedland &lt;Mecklenburg-Strelitz&gt;" class="int">Friedland &lt;Mecklenburg-Strelitz&gt;</a><ul><li>Friedland</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.85, 10.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0216.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0216&amp;field1Txt=Friedrichroda" class="int">Friedrichroda</a>`,
  },
  {
    country: `GM`,
    coords: [47.65, 9.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0217.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0217&amp;field1Txt=Friedrichshafen" class="int">Friedrichshafen</a>`,
  },
  {
    country: `GM`,
    coords: [50.55, 9.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0218.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0218&amp;field1Txt=Fulda" class="int">Fulda</a>`,
  },
  {
    country: `GM`,
    coords: [52.3667, 14.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0219.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0219&amp;field1Txt=Fürstenwalde" class="int">Fürstenwalde</a>`,
  },
  {
    country: `GM`,
    coords: [49.4667, 10.9833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0220.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0220&amp;field1Txt=Fürth &lt;Bayern&gt;" class="int">Fürth &lt;Bayern&gt;</a><ul><li>Fürth</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.55, 8.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0223.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0223&amp;field1Txt=Geestemünde" class="int">Geestemünde</a>`,
  },
  {
    country: `GM`,
    coords: [51.5, 7.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0224.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0224&amp;field1Txt=Gelsenkirchen" class="int">Gelsenkirchen</a>`,
  },
  {
    country: `GM`,
    coords: [50.8667, 12.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0228.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0228&amp;field1Txt=Gera" class="int">Gera</a>`,
  },
  {
    country: `GM`,
    coords: [50.5833, 8.7],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0229.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0229&amp;field1Txt=Giessen" class="int">Giessen</a>`,
  },
  {
    country: `GM`,
    coords: [50.8, 12.5333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0233.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0233&amp;field1Txt=Glauchau" class="int">Glauchau</a><ul><li>Glaucha</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.7833, 9.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0236.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0236&amp;field1Txt=Glückstadt" class="int">Glückstadt</a>`,
  },
  {
    country: `GM`,
    coords: [50.6833, 7.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0238.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0238&amp;field1Txt=Godesberg" class="int">Godesberg</a>`,
  },
  {
    country: `GM`,
    coords: [51.1333, 15.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0239.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0239&amp;field1Txt=Goldberg" class="int">Goldberg</a>`,
  },
  {
    country: `GM`,
    coords: [51.9167, 10.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0240.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0240&amp;field1Txt=Goslar" class="int">Goslar</a>`,
  },
  {
    country: `GM`,
    coords: [50.95, 10.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0241.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0241&amp;field1Txt=Gotha" class="int">Gotha</a>`,
  },
  {
    country: `GM`,
    coords: [51.067, 12.583],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0246.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0246&amp;field1Txt=Greifenhain" class="int">Greifenhain</a>`,
  },
  {
    country: `GM`,
    coords: [54.0833, 13.3833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0247.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0247&amp;field1Txt=Greifswald" class="int">Greifswald</a>`,
  },
  {
    country: `GM`,
    coords: [50.6667, 12.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0248.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0248&amp;field1Txt=Greiz" class="int">Greiz</a><ul><li>Greitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.2333, 12.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0249.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0249&amp;field1Txt=Grimma" class="int">Grimma</a>`,
  },
  {
    country: `GM`,
    coords: [51.3, 13.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0251.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0251&amp;field1Txt=Grossenhain" class="int">Grossenhain</a>`,
  },
  {
    country: `GM`,
    coords: [51.95, 14.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0255.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0255&amp;field1Txt=Guben" class="int">Guben</a>`,
  },
  {
    country: `GM`,
    coords: [51.0333, 7.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0258.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0258&amp;field1Txt=Gummersbach" class="int">Gummersbach</a>`,
  },
  {
    country: `GM`,
    coords: [48.7167, 9.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0259.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0259&amp;field1Txt=Göppingen" class="int">Göppingen</a>`,
  },
  {
    country: `GM`,
    coords: [51.15, 15.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0260.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0260&amp;field1Txt=Görlitz" class="int">Görlitz</a>`,
  },
  {
    country: `GM`,
    coords: [51.5333, 9.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0262.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0262&amp;field1Txt=Göttingen" class="int">Göttingen</a>`,
  },
  {
    country: `GM`,
    coords: [53.8, 12.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0264.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0264&amp;field1Txt=Güstrow" class="int">Güstrow</a>`,
  },
  {
    country: `GM`,
    coords: [51.9, 8.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0265.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0265&amp;field1Txt=Gütersloh" class="int">Gütersloh</a><ul><li>Güterloh</li><li>Gütersloch</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.35, 8.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0267.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0267&amp;field1Txt=Haardt &lt;Weinstrasse&gt;" class="int">Haardt &lt;Weinstrasse&gt;</a><ul><li>Neustadt a/H</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.45, 8.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0270.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0270&amp;field1Txt=Hadamar" class="int">Hadamar</a>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 7.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0272.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0272&amp;field1Txt=Hagen" class="int">Hagen</a>`,
  },
  {
    country: `GM`,
    coords: [50.9667, 13.1333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0273.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0273&amp;field1Txt=Hainichen" class="int">Hainichen</a>`,
  },
  {
    country: `GM`,
    coords: [51.9, 11.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0274.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0274&amp;field1Txt=Halberstadt" class="int">Halberstadt</a><ul><li>Halberst</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4833, 11.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0275.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0275&amp;field1Txt=Halle &lt;Saale&gt;" class="int">Halle &lt;Saale&gt;</a><ul><li>Halle</li><li>Halle a/S</li><li>Halle a S</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.55, 10.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0276.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0276&amp;field1Txt=Hamburg" class="int">Hamburg</a><ul><li>Ham</li><li>Ham-</li><li>Hamb</li><li>Hambourg</li><li>Hamburgg</li><li>Hamburrg</li><li>Hamubrg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.1167, 9.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0277.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0277&amp;field1Txt=Hameln" class="int">Hameln</a>`,
  },
  {
    country: `GM`,
    coords: [51.3833, 7.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0278.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0278&amp;field1Txt=Hamm" class="int">Hamm</a>`,
  },
  {
    country: `GM`,
    coords: [50.1333, 8.9333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0279.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0279&amp;field1Txt=Hanau" class="int">Hanau</a>`,
  },
  {
    country: `GM`,
    coords: [52.4, 9.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0280.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0280&amp;field1Txt=Hannover" class="int">Hannover</a><ul><li>Hann</li><li>Hannov</li><li>Hannovor</li><li>Hanover</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.4, 9.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0281.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0281&amp;field1Txt=Hannover-Linden" class="int">Hannover-Linden</a><ul><li>Linden</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.8833, 10.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0282.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0282&amp;field1Txt=Harzburg" class="int">Harzburg</a>`,
  },
  {
    country: `GM`,
    coords: [48.35, 8.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0284.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0284&amp;field1Txt=Hechingen" class="int">Hechingen</a>`,
  },
  {
    country: `GM`,
    coords: [49.4167, 8.7],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0285.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0285&amp;field1Txt=Heidelberg" class="int">Heidelberg</a><ul><li>Heidelb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.1333, 9.2333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0286.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0286&amp;field1Txt=Heilbronn" class="int">Heilbronn</a>`,
  },
  {
    country: `GM`,
    coords: [51.3833, 10.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0287.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0287&amp;field1Txt=Heiligenstadt &lt;Eichsfeld&gt;" class="int">Heiligenstadt &lt;Eichsfeld&gt;</a><ul><li>Heilgenstadt</li><li>Heiligenstadt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [54.167, 7.883],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0288.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0288&amp;field1Txt=Helgoland" class="int">Helgoland</a>`,
  },
  {
    country: `GM`,
    coords: [52.2333, 11.0167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0289.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0289&amp;field1Txt=Helmstedt" class="int">Helmstedt</a>`,
  },
  {
    country: `GM`,
    coords: [52.1167, 8.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0292.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0292&amp;field1Txt=Herford" class="int">Herford</a>`,
  },
  {
    country: `GM`,
    coords: [52.8167, 10.1],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0294.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0294&amp;field1Txt=Hermannsburg" class="int">Hermannsburg</a>`,
  },
  {
    country: `GM`,
    coords: [50.8833, 9.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0296.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0296&amp;field1Txt=Hersfeld" class="int">Hersfeld</a>`,
  },
  {
    country: `GM`,
    coords: [51.7, 13.2333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0297.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0297&amp;field1Txt=Herzberg" class="int">Herzberg</a>`,
  },
  {
    country: `GM`,
    coords: [51.0, 8.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0299.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0299&amp;field1Txt=Hilchenbach" class="int">Hilchenbach</a>`,
  },
  {
    country: `GM`,
    coords: [50.4167, 10.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0300.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0300&amp;field1Txt=Hildburghausen" class="int">Hildburghausen</a><ul><li>Hilburghausen</li><li>Hildburgh</li><li>Hildburghaussen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.15, 9.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0301.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0301&amp;field1Txt=Hildesheim" class="int">Hildesheim</a>`,
  },
  {
    country: `GM`,
    coords: [47.5167, 10.3833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0302.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0302&amp;field1Txt=Hindelang" class="int">Hindelang</a>`,
  },
  {
    country: `GM`,
    coords: [50.3167, 11.9333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0304.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0304&amp;field1Txt=Hof &lt;Saale&gt;" class="int">Hof &lt;Saale&gt;</a><ul><li>Hof</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.21667, 10.18333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0305.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0305&amp;field1Txt=Hoheneggelsen" class="int">Hoheneggelsen</a>`,
  },
  {
    country: `GM`,
    coords: [50.8, 12.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0306.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0306&amp;field1Txt=Hohenstein-Ernstthal" class="int">Hohenstein-Ernstthal</a>`,
  },
  {
    country: `GM`,
    coords: [51.8167, 9.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0307.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0307&amp;field1Txt=Holzminden" class="int">Holzminden</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 9.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0308.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0308&amp;field1Txt=Homberg" class="int">Homberg</a>`,
  },
  {
    country: `GM`,
    coords: [50.2167, 8.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0309.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0309&amp;field1Txt=Homburg" class="int">Homburg</a>`,
  },
  {
    country: `GM`,
    coords: [48.45, 8.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0310.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0310&amp;field1Txt=Horb &lt;Neckar&gt;" class="int">Horb &lt;Neckar&gt;</a><ul><li>Horb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.55, 10.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0311.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0311&amp;field1Txt=Horn bei Hamburg" class="int">Horn bei Hamburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.4667, 14.2833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0313.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0313&amp;field1Txt=Hoyerswerda" class="int">Hoyerswerda</a><ul><li>Hoyerswerde</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.5833, 10.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0317.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0317&amp;field1Txt=Ilfeld &lt;Harz&gt;" class="int">Ilfeld &lt;Harz&gt;</a><ul><li>Ilfeld a/H</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.95, 8.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0318.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0318&amp;field1Txt=Illingen" class="int">Illingen</a>`,
  },
  {
    country: `GM`,
    coords: [50.6833, 10.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0319.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0319&amp;field1Txt=Ilmenau" class="int">Ilmenau</a>`,
  },
  {
    country: `GM`,
    coords: [51.867, 10.683],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0320.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0320&amp;field1Txt=Ilsenburg" class="int">Ilsenburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.3833, 7.7],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0324.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0324&amp;field1Txt=Iserlohn" class="int">Iserlohn</a>`,
  },
  {
    country: `GM`,
    coords: [50.9333, 11.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0327.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0327&amp;field1Txt=Jena" class="int">Jena</a>`,
  },
  {
    country: `GM`,
    coords: [53.5833, 7.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0328.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0328&amp;field1Txt=Jever" class="int">Jever</a>`,
  },
  {
    country: `GM`,
    coords: [51.1, 6.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0330.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0330&amp;field1Txt=Jüchen" class="int">Jüchen</a>`,
  },
  {
    country: `GM`,
    coords: [50.9167, 6.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0331.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0331&amp;field1Txt=Jülich" class="int">Jülich</a>`,
  },
  {
    country: `GM`,
    coords: [51.9833, 13.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0332.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0332&amp;field1Txt=Jüterbog" class="int">Jüterbog</a><ul><li>Jüterbogk</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.45, 7.7833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0333.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0333&amp;field1Txt=Kaiserslautern" class="int">Kaiserslautern</a>`,
  },
  {
    country: `GM`,
    coords: [51.3, 6.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0334.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0334&amp;field1Txt=Kaiserswerth" class="int">Kaiserswerth</a>`,
  },
  {
    country: `GM`,
    coords: [49.05, 8.4],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0339.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0339&amp;field1Txt=Karlsruhe" class="int">Karlsruhe</a><ul><li>Calsruhe</li><li>Carlsr</li><li>Carlsruhe</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3, 9.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0341.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0341&amp;field1Txt=Kassel" class="int">Kassel</a><ul><li>Cassel</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 6.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0342.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0342&amp;field1Txt=Kempen" class="int">Kempen</a>`,
  },
  {
    country: `GM`,
    coords: [47.7333, 10.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0343.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0343&amp;field1Txt=Kempten &lt;Allgäu&gt;" class="int">Kempten &lt;Allgäu&gt;</a><ul><li>Kempten</li><li>Kempton</li></ul>`,
  },
  {
    country: `GM`,
    coords: [54.3333, 10.1333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0345.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0345&amp;field1Txt=Kiel" class="int">Kiel</a>`,
  },
  {
    country: `GM`,
    coords: [49.6667, 8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0347.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0347&amp;field1Txt=Kirchheimbolanden" class="int">Kirchheimbolanden</a>`,
  },
  {
    country: `GM`,
    coords: [49.7833, 7.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0348.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0348&amp;field1Txt=Kirn" class="int">Kirn</a>`,
  },
  {
    country: `GM`,
    coords: [50.2, 10.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0349.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0349&amp;field1Txt=Kissingen" class="int">Kissingen</a><ul><li>Bad Kissingen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.75, 10.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0350.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0350&amp;field1Txt=Kitzingen" class="int">Kitzingen</a>`,
  },
  {
    country: `GM`,
    coords: [51.7833, 6.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0353.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0353&amp;field1Txt=Kleve" class="int">Kleve</a><ul><li>Cleve</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.35, 7.6],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0354.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0354&amp;field1Txt=Koblenz" class="int">Koblenz</a><ul><li>Coblenz</li><li>Cöblenz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3, 7.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0355.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0355&amp;field1Txt=Kolberg" class="int">Kolberg</a><ul><li>Colberg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [47.6667, 9.1667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0359.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0359&amp;field1Txt=Konstanz" class="int">Konstanz</a><ul><li>Constanz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 6.5333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0363.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0363&amp;field1Txt=Krefeld" class="int">Krefeld</a><ul><li>Crefeld</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.85, 7.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0365.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0365&amp;field1Txt=Kreuznach" class="int">Kreuznach</a><ul><li>Creuznach</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.2333, 11.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0366.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0366&amp;field1Txt=Kronach" class="int">Kronach</a>`,
  },
  {
    country: `GM`,
    coords: [54.4, 9.5167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0368.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0368&amp;field1Txt=Kropp" class="int">Kropp</a>`,
  },
  {
    country: `GM`,
    coords: [50.1, 11.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0370.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0370&amp;field1Txt=Kulmbach" class="int">Kulmbach</a>`,
  },
  {
    country: `GM`,
    coords: [50.9333, 6.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0371.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0371&amp;field1Txt=Köln" class="int">Köln</a><ul><li>Coeln</li><li>Cöln</li><li>Köln a/Rh</li><li>Köln a. Rh</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9333, 6.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0372.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0372&amp;field1Txt=Köln-Ehrenfeld" class="int">Köln-Ehrenfeld</a>`,
  },
  {
    country: `GM`,
    coords: [51.7667, 11.9833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0377.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0377&amp;field1Txt=Köthen" class="int">Köthen</a>`,
  },
  {
    country: `GM`,
    coords: [51.1, 13.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0378.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0378&amp;field1Txt=Kötzschenbroda" class="int">Kötzschenbroda</a>`,
  },
  {
    country: `GM`,
    coords: [48.35, 7.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0380.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0380&amp;field1Txt=Lahr &lt;Schwarzwald&gt;" class="int">Lahr &lt;Schwarzwald&gt;</a><ul><li>Lahr</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.2, 8.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0382.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0382&amp;field1Txt=Landau &lt;Pfalz&gt;" class="int">Landau &lt;Pfalz&gt;</a><ul><li>Landau</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.5167, 12.1667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0384.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0384&amp;field1Txt=Landshut" class="int">Landshut</a>`,
  },
  {
    country: `GM`,
    coords: [51.1, 10.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0386.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0386&amp;field1Txt=Langensalza" class="int">Langensalza</a><ul><li>Langensalz</li><li>Langensalze</li><li>Laugensalza</li><li>Langensalsa</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.75, 12.083],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0389.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0389&amp;field1Txt=Lausigk" class="int">Lausigk</a>`,
  },
  {
    country: `GM`,
    coords: [53.2333, 7.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0390.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0390&amp;field1Txt=Leer" class="int">Leer</a>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0392.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0392&amp;field1Txt=Leipzig" class="int">Leipzig</a><ul><li>Leip</li><li>Leipcig</li><li>Leipig</li><li>Leipsig</li><li>Leipz</li><li>Leizig</li><li>Lpz</li><li>zig</li><li>Leip-</li><li>Keipzig</li><li>Lpzg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0393.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0393&amp;field1Txt=Leipzig-Eutritzsch" class="int">Leipzig-Eutritzsch</a>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0394.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0394&amp;field1Txt=Leipzig-Gohlis" class="int">Leipzig-Gohlis</a><ul><li>Gohlis</li><li>Gohlis-Leipzig</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0395.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0395&amp;field1Txt=Leipzig-Lindenau" class="int">Leipzig-Lindenau</a><ul><li>Lindenau</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0396.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0396&amp;field1Txt=Leipzig-Neureudnitz" class="int">Leipzig-Neureudnitz</a><ul><li>Leipzig, Neureudnitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0397.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0397&amp;field1Txt=Leipzig-Neuschleussig" class="int">Leipzig-Neuschleussig</a>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0398.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0398&amp;field1Txt=Leipzig-Neustadt" class="int">Leipzig-Neustadt</a><ul><li>Neustadt-Leipzig</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3333, 12.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0399.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0399&amp;field1Txt=Leipzig-Reudnitz" class="int">Leipzig-Reudnitz</a><ul><li>Reudnitz</li><li>Reudnitz-Leipzig</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.0333, 8.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0402.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0402&amp;field1Txt=Lemgo" class="int">Lemgo</a>`,
  },
  {
    country: `GM`,
    coords: [50.5667, 12.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0403.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0403&amp;field1Txt=Lengenfeld" class="int">Lengenfeld</a>`,
  },
  {
    country: `GM`,
    coords: [49.6, 12.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0406.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0406&amp;field1Txt=Leuchtenberg" class="int">Leuchtenberg</a>`,
  },
  {
    country: `GM`,
    coords: [47.8333, 10.0333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0407.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0407&amp;field1Txt=Leutkirch" class="int">Leutkirch</a>`,
  },
  {
    country: `GM`,
    coords: [50.3833, 8.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0412.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0412&amp;field1Txt=Limburg" class="int">Limburg</a>`,
  },
  {
    country: `GM`,
    coords: [47.55, 9.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0413.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0413&amp;field1Txt=Lindau &lt;Bodensee&gt;" class="int">Lindau &lt;Bodensee&gt;</a><ul><li>Lindau</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.5333, 7.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0414.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0414&amp;field1Txt=Lingen &lt;Ems&gt;" class="int">Lingen &lt;Ems&gt;</a><ul><li>Lingen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.6667, 8.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0416.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0416&amp;field1Txt=Lippstadt" class="int">Lippstadt</a>`,
  },
  {
    country: `GM`,
    coords: [52.0833, 13.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0420.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0420&amp;field1Txt=Luckenwalde" class="int">Luckenwalde</a>`,
  },
  {
    country: `GM`,
    coords: [48.9, 9.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0421.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0421&amp;field1Txt=Ludwigsburg" class="int">Ludwigsburg</a>`,
  },
  {
    country: `GM`,
    coords: [49.4833, 8.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0422.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0422&amp;field1Txt=Ludwigshafen" class="int">Ludwigshafen</a>`,
  },
  {
    country: `GM`,
    coords: [53.3333, 11.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0423.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0423&amp;field1Txt=Ludwigslust" class="int">Ludwigslust</a>`,
  },
  {
    country: `GM`,
    coords: [51.1, 14.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0427.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0427&amp;field1Txt=Löbau &lt;Sachsen&gt;" class="int">Löbau &lt;Sachsen&gt;</a><ul><li>Löbau</li><li>Löbau i/S</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.6167, 12.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0428.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0428&amp;field1Txt=Lössnitz" class="int">Lössnitz</a>`,
  },
  {
    country: `GM`,
    coords: [51.95, 13.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0430.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0430&amp;field1Txt=Lübben &lt;Spreewald&gt;" class="int">Lübben &lt;Spreewald&gt;</a><ul><li>Lübben</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.8667, 10.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0431.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0431&amp;field1Txt=Lübeck" class="int">Lübeck</a>`,
  },
  {
    country: `GM`,
    coords: [53.25, 10.4],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0433.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0433&amp;field1Txt=Lüneburg" class="int">Lüneburg</a>`,
  },
  {
    country: `GM`,
    coords: [52.1333, 11.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0436.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0436&amp;field1Txt=Magdeburg" class="int">Magdeburg</a><ul><li>Magdburg</li><li>Magde</li><li>Magdeb</li><li>Magdebg</li><li>Magdehurg</li><li>Mageburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.0, 8.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0438.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0438&amp;field1Txt=Mainz" class="int">Mainz</a><ul><li>Mains</li><li>Mainx</li><li>Maïnz</li><li>Main</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.75, 12.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0439.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0439&amp;field1Txt=Malchin" class="int">Malchin</a>`,
  },
  {
    country: `GM`,
    coords: [49.5, 8.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0440.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0440&amp;field1Txt=Mannheim" class="int">Mannheim</a><ul><li>Hannheim</li><li>Manheim</li><li>Mannh</li><li>Mannhein</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.6, 11.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0441.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0441&amp;field1Txt=Mansfeld" class="int">Mansfeld</a>`,
  },
  {
    country: `GM`,
    coords: [50.8167, 8.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0442.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0442&amp;field1Txt=Marburg &lt;Lahn&gt;" class="int">Marburg &lt;Lahn&gt;</a><ul><li>Marburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.3, 12.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0445.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0445&amp;field1Txt=Markneukirchen" class="int">Markneukirchen</a>`,
  },
  {
    country: `GM`,
    coords: [50.65, 10.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0447.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0447&amp;field1Txt=Mehlis" class="int">Mehlis</a>`,
  },
  {
    country: `GM`,
    coords: [50.55, 10.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0448.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0448&amp;field1Txt=Meiningen" class="int">Meiningen</a>`,
  },
  {
    country: `GM`,
    coords: [51.1667, 13.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0449.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0449&amp;field1Txt=Meissen" class="int">Meissen</a>`,
  },
  {
    country: `GM`,
    coords: [54.0833, 9.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0450.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0450&amp;field1Txt=Meldorf" class="int">Meldorf</a>`,
  },
  {
    country: `GM`,
    coords: [47.9833, 10.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0451.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0451&amp;field1Txt=Memmingen" class="int">Memmingen</a>`,
  },
  {
    country: `GM`,
    coords: [49.5, 9.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0453.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0453&amp;field1Txt=Mergentheim" class="int">Mergentheim</a>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 12.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0454.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0454&amp;field1Txt=Merseburg" class="int">Merseburg</a>`,
  },
  {
    country: `GM`,
    coords: [50.55, 11.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0456.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0456&amp;field1Txt=Meuselbach" class="int">Meuselbach</a>`,
  },
  {
    country: `GM`,
    coords: [49.6667, 9.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0458.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0458&amp;field1Txt=Michelstadt" class="int">Michelstadt</a>`,
  },
  {
    country: `GM`,
    coords: [47.7833, 11.8333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0460.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0460&amp;field1Txt=Miesbach" class="int">Miesbach</a>`,
  },
  {
    country: `GM`,
    coords: [52.3, 8.9],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0462.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0462&amp;field1Txt=Minden &lt;Westfalen&gt;" class="int">Minden &lt;Westfalen&gt;</a><ul><li>Mind</li><li>Minden</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9833, 12.9833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0464.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0464&amp;field1Txt=Mittweida" class="int">Mittweida</a><ul><li>Mittweide</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.35, 9.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0465.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0465&amp;field1Txt=Mosbach" class="int">Mosbach</a>`,
  },
  {
    country: `GM`,
    coords: [53.633, 10.683],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0471.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0471&amp;field1Txt=Mölln" class="int">Mölln</a>`,
  },
  {
    country: `GM`,
    coords: [51.2167, 10.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0472.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0472&amp;field1Txt=Mühlhausen &lt;Thüringen&gt;" class="int">Mühlhausen &lt;Thüringen&gt;</a><ul><li>Mühlhausen</li><li>Mühlhausen i/Th</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4333, 6.8833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0474.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0474&amp;field1Txt=Mülheim &lt;Ruhr&gt;" class="int">Mülheim &lt;Ruhr&gt;</a><ul><li>Mülheim</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.1333, 11.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0475.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0475&amp;field1Txt=München" class="int">München</a><ul><li>Mün</li><li>Münch</li><li>Munchen</li><li>Münchnn</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.2, 6.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0476.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0476&amp;field1Txt=München-Gladbach" class="int">München-Gladbach</a><ul><li>Gladbach</li><li>M. Gladbach</li><li>M.-Gladbach</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.9667, 7.6333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0477.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0477&amp;field1Txt=Münster &lt;Westfalen&gt;" class="int">Münster &lt;Westfalen&gt;</a><ul><li>Münster</li><li>Minster</li><li>Münster i/W</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.15, 11.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0481.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0481&amp;field1Txt=Naumburg &lt;Saale&gt;" class="int">Naumburg &lt;Saale&gt;</a><ul><li>Naumburg</li><li>Naumburg a./S</li><li>Naumburg a/S</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4, 10.0167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0484.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0484&amp;field1Txt=Neu-Ulm" class="int">Neu-Ulm</a>`,
  },
  {
    country: `GM`,
    coords: [53.55, 13.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0485.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0485&amp;field1Txt=Neubrandenburg" class="int">Neubrandenburg</a>`,
  },
  {
    country: `GM`,
    coords: [48.7333, 11.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0486.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0486&amp;field1Txt=Neuburg &lt;Donau&gt;" class="int">Neuburg &lt;Donau&gt;</a><ul><li>Neuburg a/D</li><li>Neuburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.3, 11.417],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0489.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0489&amp;field1Txt=Neuhaldensleben" class="int">Neuhaldensleben</a>`,
  },
  {
    country: `GM`,
    coords: [52.9333, 12.8167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0490.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0490&amp;field1Txt=Neuruppin" class="int">Neuruppin</a><ul><li>Neu-Ruppin</li><li>Ruppin</li><li>Neu Ruppin</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.2, 6.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0493.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0493&amp;field1Txt=Neuss" class="int">Neuss</a><ul><li>Neus</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 11.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0496.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0496&amp;field1Txt=Neustadt &lt;Orla&gt;" class="int">Neustadt &lt;Orla&gt;</a><ul><li>Neustadt a. d. O</li><li>Neustadt a. O</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.1167, 11.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0497.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0497&amp;field1Txt=Neustedt, bei Eckartsberga" class="int">Neustedt, bei Eckartsberga</a>`,
  },
  {
    country: `GM`,
    coords: [53.3667, 13.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0499.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0499&amp;field1Txt=Neustrelitz" class="int">Neustrelitz</a><ul><li>Neu Strelitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.4333, 7.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0501.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0501&amp;field1Txt=Neuwied" class="int">Neuwied</a>`,
  },
  {
    country: `GM`,
    coords: [52.5833, 13.3833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0503.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0503&amp;field1Txt=Nieder-Schönhausen" class="int">Nieder-Schönhausen</a>`,
  },
  {
    country: `GM`,
    coords: [53.6, 7.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0506.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0506&amp;field1Txt=Norden" class="int">Norden</a>`,
  },
  {
    country: `GM`,
    coords: [51.5167, 10.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0507.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0507&amp;field1Txt=Nordhausen" class="int">Nordhausen</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 13.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0508.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0508&amp;field1Txt=Nossen" class="int">Nossen</a>`,
  },
  {
    country: `GM`,
    coords: [48.85, 10.5167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0509.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0509&amp;field1Txt=Nördlingen" class="int">Nördlingen</a>`,
  },
  {
    country: `GM`,
    coords: [49.45, 11.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0510.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0510&amp;field1Txt=Nürnberg" class="int">Nürnberg</a><ul><li>Nürnb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4667, 6.85],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0512.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0512&amp;field1Txt=Oberhausen" class="int">Oberhausen</a>`,
  },
  {
    country: `GM`,
    coords: [49.524, 9.323],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0513.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0513&amp;field1Txt=Oberneudorf-Buchen" class="int">Oberneudorf-Buchen</a>`,
  },
  {
    country: `GM`,
    coords: [49.7167, 7.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0514.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0514&amp;field1Txt=Oberstein" class="int">Oberstein</a>`,
  },
  {
    country: `GM`,
    coords: [50.4167, 12.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0518.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0518&amp;field1Txt=Oelsnitz" class="int">Oelsnitz</a>`,
  },
  {
    country: `GM`,
    coords: [50.1, 8.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0519.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0519&amp;field1Txt=Offenbach &lt;Main&gt;" class="int">Offenbach &lt;Main&gt;</a><ul><li>Offenb</li><li>Offenbach</li><li>Offenbach a/M</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4833, 7.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0520.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0520&amp;field1Txt=Offenburg" class="int">Offenburg</a>`,
  },
  {
    country: `GM`,
    coords: [53.0, 8.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0523.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0523&amp;field1Txt=Oldenburg &lt;Oldenburg&gt;" class="int">Oldenburg &lt;Oldenburg&gt;</a><ul><li>Oldenb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.8667, 8.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0526.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0526&amp;field1Txt=Oppenheim" class="int">Oppenheim</a>`,
  },
  {
    country: `GM`,
    coords: [52.7667, 13.2333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0527.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0527&amp;field1Txt=Oranienburg" class="int">Oranienburg</a>`,
  },
  {
    country: `GM`,
    coords: [52.0333, 11.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0529.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0529&amp;field1Txt=Oschersleben" class="int">Oschersleben</a>`,
  },
  {
    country: `GM`,
    coords: [52.2833, 8.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0530.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0530&amp;field1Txt=Osnabrück" class="int">Osnabrück</a>`,
  },
  {
    country: `GM`,
    coords: [52.8, 11.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0531.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0531&amp;field1Txt=Osterburg" class="int">Osterburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.9667, 10.7167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0533.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0533&amp;field1Txt=Osterwieck" class="int">Osterwieck</a>`,
  },
  {
    country: `GM`,
    coords: [51.7167, 8.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0535.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0535&amp;field1Txt=Paderborn" class="int">Paderborn</a>`,
  },
  {
    country: `GM`,
    coords: [53.4333, 11.85],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0536.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0536&amp;field1Txt=Parchim" class="int">Parchim</a>`,
  },
  {
    country: `GM`,
    coords: [53.5, 14.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0538.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0538&amp;field1Txt=Pasewalk" class="int">Pasewalk</a>`,
  },
  {
    country: `GM`,
    coords: [48.5833, 13.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0539.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0539&amp;field1Txt=Passau" class="int">Passau</a>`,
  },
  {
    country: `GM`,
    coords: [48.967, 10.267],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0543.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0543&amp;field1Txt=Pfahlheim" class="int">Pfahlheim</a>`,
  },
  {
    country: `GM`,
    coords: [48.8833, 8.7],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0544.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0544&amp;field1Txt=Pforzheim" class="int">Pforzheim</a>`,
  },
  {
    country: `GM`,
    coords: [50.9667, 13.9333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0547.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0547&amp;field1Txt=Pirna" class="int">Pirna</a>`,
  },
  {
    country: `GM`,
    coords: [50.4833, 12.1333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0548.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0548&amp;field1Txt=Plauen" class="int">Plauen</a><ul><li>Plauen i/V</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.0, 13.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0552.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0552&amp;field1Txt=Potschappel" class="int">Potschappel</a>`,
  },
  {
    country: `GM`,
    coords: [52.4, 13.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0553.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0553&amp;field1Txt=Potsdam" class="int">Potsdam</a><ul><li>Pots dam</li><li>Potsd</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.3167, 13.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0556.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0556&amp;field1Txt=Prenzlau" class="int">Prenzlau</a>`,
  },
  {
    country: `GM`,
    coords: [53.15, 12.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0558.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0558&amp;field1Txt=Pritzwalk" class="int">Pritzwalk</a>`,
  },
  {
    country: `GM`,
    coords: [50.7, 11.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0560.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0560&amp;field1Txt=Pössneck" class="int">Pössneck</a>`,
  },
  {
    country: `GM`,
    coords: [51.8, 11.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0561.html?fieldTxt=pubPlaces&amp;startTxt=Qa-Qz&amp;current=place_0561&amp;field1Txt=Quedlinburg" class="int">Quedlinburg</a><ul><li>Quedlinb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.3833, 11.6],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0562.html?fieldTxt=pubPlaces&amp;startTxt=Qa-Qz&amp;current=place_0562&amp;field1Txt=Querfurt" class="int">Querfurt</a><ul><li>Querfurth</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.1, 13.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0563.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0563&amp;field1Txt=Radebeul" class="int">Radebeul</a>`,
  },
  {
    country: `GM`,
    coords: [48.85, 8.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0564.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0564&amp;field1Txt=Rastatt" class="int">Rastatt</a><ul><li>Rastadt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.6167, 12.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0565.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0565&amp;field1Txt=Rathenow" class="int">Rathenow</a>`,
  },
  {
    country: `GM`,
    coords: [53.7, 10.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0567.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0567&amp;field1Txt=Ratzeburg" class="int">Ratzeburg</a>`,
  },
  {
    country: `GM`,
    coords: [47.7833, 9.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0568.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0568&amp;field1Txt=Ravensburg" class="int">Ravensburg</a>`,
  },
  {
    country: `GM`,
    coords: [49.0167, 12.1],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0569.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0569&amp;field1Txt=Regensburg" class="int">Regensburg</a><ul><li>Regenburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.6, 12.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0570.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0570&amp;field1Txt=Reichenbach &lt;Vogtland&gt;" class="int">Reichenbach &lt;Vogtland&gt;</a><ul><li>Reichenbach</li><li>Reichenbach i/V</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.1833, 7.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0572.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0572&amp;field1Txt=Remscheid" class="int">Remscheid</a>`,
  },
  {
    country: `GM`,
    coords: [54.3167, 9.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0573.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0573&amp;field1Txt=Rendsburg" class="int">Rendsburg</a>`,
  },
  {
    country: `GM`,
    coords: [48.5, 9.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0574.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0574&amp;field1Txt=Reutlingen" class="int">Reutlingen</a>`,
  },
  {
    country: `GM`,
    coords: [50.6167, 6.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0576.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0576&amp;field1Txt=Rheinbach" class="int">Rheinbach</a>`,
  },
  {
    country: `GM`,
    coords: [51.1667, 6.45],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0577.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0577&amp;field1Txt=Rheydt" class="int">Rheydt</a>`,
  },
  {
    country: `GM`,
    coords: [51.3, 13.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0579.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0579&amp;field1Txt=Riesa" class="int">Riesa</a>`,
  },
  {
    country: `GM`,
    coords: [52.1833, 9.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0581.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0581&amp;field1Txt=Rinteln" class="int">Rinteln</a>`,
  },
  {
    country: `GM`,
    coords: [54.217, 10.417],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0582.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0582&amp;field1Txt=Rixdorf" class="int">Rixdorf</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 12.8167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0583.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0583&amp;field1Txt=Rochlitz" class="int">Rochlitz</a>`,
  },
  {
    country: `GM`,
    coords: [50.3333, 10.8],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0584.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0584&amp;field1Txt=Rodach" class="int">Rodach</a>`,
  },
  {
    country: `GM`,
    coords: [50.8667, 12.1833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0587.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0587&amp;field1Txt=Ronneburg" class="int">Ronneburg</a>`,
  },
  {
    country: `GM`,
    coords: [54.1, 12.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0589.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0589&amp;field1Txt=Rostock" class="int">Rostock</a>`,
  },
  {
    country: `GM`,
    coords: [49.3833, 10.2167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0590.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0590&amp;field1Txt=Rothenburg &lt;Tauber&gt;" class="int">Rothenburg &lt;Tauber&gt;</a><ul><li>Rothenburg</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4667, 8.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0591.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0591&amp;field1Txt=Rottenburg &lt;Neckar&gt;" class="int">Rottenburg &lt;Neckar&gt;</a><ul><li>Rottenburg</li><li>Rottenburg a/N</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.7167, 11.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0594.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0594&amp;field1Txt=Rudolstadt" class="int">Rudolstadt</a>`,
  },
  {
    country: `GM`,
    coords: [51.4333, 6.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0595.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0595&amp;field1Txt=Ruhrort" class="int">Ruhrort</a>`,
  },
  {
    country: `GM`,
    coords: [50.1, 8.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0596.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0596&amp;field1Txt=Rödelheim" class="int">Rödelheim</a>`,
  },
  {
    country: `GM`,
    coords: [50.65, 11.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0597.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0597&amp;field1Txt=Saalfeld &lt;Saale&gt;" class="int">Saalfeld &lt;Saale&gt;</a><ul><li>Saalfeld</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.25, 6.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0598.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0598&amp;field1Txt=Saarbrücken" class="int">Saarbrücken</a><ul><li>Saarbrück</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.317, 6.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0599.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0599&amp;field1Txt=Saarlouis" class="int">Saarlouis</a>`,
  },
  {
    country: `GM`,
    coords: [50.8167, 10.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0603.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0603&amp;field1Txt=Salzungen" class="int">Salzungen</a>`,
  },
  {
    country: `GM`,
    coords: [52.8, 11.1667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0604.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0604&amp;field1Txt=Salzwedel" class="int">Salzwedel</a>`,
  },
  {
    country: `GM`,
    coords: [51.4667, 11.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0605.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0605&amp;field1Txt=Sangerhausen" class="int">Sangerhausen</a>`,
  },
  {
    country: `GM`,
    coords: [49.2833, 7.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0607.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0607&amp;field1Txt=Sankt Ingbert" class="int">Sankt Ingbert</a><ul><li>St. Ingbert</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.0167, 9.5167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0610.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0610&amp;field1Txt=Saulgau" class="int">Saulgau</a>`,
  },
  {
    country: `GM`,
    coords: [50.9167, 14.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0612.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0612&amp;field1Txt=Schandau" class="int">Schandau</a>`,
  },
  {
    country: `GM`,
    coords: [50.5667, 11.8167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0613.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0613&amp;field1Txt=Schleiz" class="int">Schleiz</a><ul><li>Schleitz</li></ul>`,
  },
  {
    country: `GM`,
    coords: [54.5167, 9.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0614.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0614&amp;field1Txt=Schleswig" class="int">Schleswig</a>`,
  },
  {
    country: `GM`,
    coords: [50.5167, 10.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0615.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0615&amp;field1Txt=Schleusingen" class="int">Schleusingen</a><ul><li>Schlesingen</li><li>Schlessingen</li><li>Schleusinger</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.8333, 12.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0616.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0616&amp;field1Txt=Schloss-Chemnitz" class="int">Schloss-Chemnitz</a>`,
  },
  {
    country: `GM`,
    coords: [50.7167, 10.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0617.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0617&amp;field1Txt=Schmalkalden" class="int">Schmalkalden</a>`,
  },
  {
    country: `GM`,
    coords: [50.5833, 12.6333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0618.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0618&amp;field1Txt=Schneeberg &lt;Aue-Schwarzenberg&gt;" class="int">Schneeberg &lt;Aue-Schwarzenberg&gt;</a><ul><li>Schneeberg</li><li>Schneeb</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.3333, 11.0333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0620.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0620&amp;field1Txt=Schwabach" class="int">Schwabach</a>`,
  },
  {
    country: `GM`,
    coords: [50.05, 10.2667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0622.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0622&amp;field1Txt=Schweinfurt" class="int">Schweinfurt</a>`,
  },
  {
    country: `GM`,
    coords: [51.2833, 7.2833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0623.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0623&amp;field1Txt=Schwelm" class="int">Schwelm</a>`,
  },
  {
    country: `GM`,
    coords: [53.6333, 11.4167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0624.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0624&amp;field1Txt=Schwerin" class="int">Schwerin</a><ul><li>Schwerin i/M</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.8, 9.7833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0626.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0626&amp;field1Txt=Schwäbisch Gmünd" class="int">Schwäbisch Gmünd</a><ul><li>Gmünd</li><li>Schw. Gmünd</li><li>Schwäb. Gmünd</li><li>Schw. Gemünd</li><li>Schw.-Gmünd</li></ul>`,
  },
  {
    country: `GM`,
    coords: [49.1, 9.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0627.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0627&amp;field1Txt=Schwäbisch Hall" class="int">Schwäbisch Hall</a><ul><li>Schw. Hall</li><li>Schwäb. Hall</li><li>Schwäbisch-Hall</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.0167, 11.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0629.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0629&amp;field1Txt=Schönebeck &lt;Elbe&gt;" class="int">Schönebeck &lt;Elbe&gt;</a><ul><li>Schönebeck</li><li>Schoenebeck</li></ul>`,
  },
  {
    country: `GM`,
    coords: [53.9333, 10.2833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0631.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0631&amp;field1Txt=Segeberg" class="int">Segeberg</a>`,
  },
  {
    country: `GM`,
    coords: [50.8667, 8.0333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0632.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0632&amp;field1Txt=Siegen" class="int">Siegen</a>`,
  },
  {
    country: `GM`,
    coords: [51.5833, 8.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0633.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0633&amp;field1Txt=Soest" class="int">Soest</a><ul><li>Noest</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.1667, 7.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0635.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0635&amp;field1Txt=Solingen" class="int">Solingen</a>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 10.8667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0638.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0638&amp;field1Txt=Sondershausen" class="int">Sondershausen</a><ul><li>Sondersh</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.55, 13.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0641.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0641&amp;field1Txt=Spandau" class="int">Spandau</a>`,
  },
  {
    country: `GM`,
    coords: [49.3167, 8.4333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0642.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0642&amp;field1Txt=Speyer" class="int">Speyer</a><ul><li>Speier</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.55, 14.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0643.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0643&amp;field1Txt=Spremberg" class="int">Spremberg</a>`,
  },
  {
    country: `GM`,
    coords: [53.6, 9.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0645.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0645&amp;field1Txt=Stade" class="int">Stade</a>`,
  },
  {
    country: `GM`,
    coords: [51.8667, 11.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0648.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0648&amp;field1Txt=Stassfurt" class="int">Stassfurt</a><ul><li>Stassfurth</li><li>Strassfurt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [47.8833, 7.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0649.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0649&amp;field1Txt=Staufen" class="int">Staufen</a><ul><li>Stauffen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [52.6, 11.85],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0650.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0650&amp;field1Txt=Stendal" class="int">Stendal</a>`,
  },
  {
    country: `GM`,
    coords: [50.767, 6.233],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0654.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0654&amp;field1Txt=Stolberg" class="int">Stolberg</a>`,
  },
  {
    country: `GM`,
    coords: [54.3, 13.1],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0656.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0656&amp;field1Txt=Stralsund" class="int">Stralsund</a><ul><li>Stral-</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.8833, 12.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0658.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0658&amp;field1Txt=Straubing" class="int">Straubing</a>`,
  },
  {
    country: `GM`,
    coords: [48.7833, 9.2],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0662.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0662&amp;field1Txt=Stuttgart" class="int">Stuttgart</a><ul><li>Stuttg</li><li>Stutttgart</li><li>Suttgart</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.0833, 11.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0663.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0663&amp;field1Txt=Sulza" class="int">Sulza</a>`,
  },
  {
    country: `GM`,
    coords: [52.55, 11.95],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0666.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0666&amp;field1Txt=Tangermünde" class="int">Tangermünde</a>`,
  },
  {
    country: `GM`,
    coords: [49.6167, 9.6667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0670.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0670&amp;field1Txt=Tauberbischofsheim" class="int">Tauberbischofsheim</a>`,
  },
  {
    country: `GM`,
    coords: [53.7833, 12.5833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0674.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0674&amp;field1Txt=Teterow" class="int">Teterow</a>`,
  },
  {
    country: `GM`,
    coords: [50.9333, 11.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0675.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0675&amp;field1Txt=Thalbürgel" class="int">Thalbürgel</a>`,
  },
  {
    country: `GM`,
    coords: [51.75, 11.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0676.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0676&amp;field1Txt=Thale" class="int">Thale</a>`,
  },
  {
    country: `GM`,
    coords: [51.5667, 13.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0683.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0683&amp;field1Txt=Torgau" class="int">Torgau</a>`,
  },
  {
    country: `GM`,
    coords: [49.75, 6.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0687.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0687&amp;field1Txt=Trier" class="int">Trier</a>`,
  },
  {
    country: `GM`,
    coords: [47.75, 11.5667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0692.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0692&amp;field1Txt=Tölz" class="int">Tölz</a>`,
  },
  {
    country: `GM`,
    coords: [48.5333, 9.05],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0693.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0693&amp;field1Txt=Tübingen" class="int">Tübingen</a>`,
  },
  {
    country: `GM`,
    coords: [48.0667, 10.6333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0694.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0694&amp;field1Txt=Türkheim" class="int">Türkheim</a>`,
  },
  {
    country: `GM`,
    coords: [53.6833, 9.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0695.html?fieldTxt=pubPlaces&amp;startTxt=Ua-Uz&amp;current=place_0695&amp;field1Txt=Uetersen" class="int">Uetersen</a><ul><li>Ütersen</li></ul>`,
  },
  {
    country: `GM`,
    coords: [48.4, 10.0],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0696.html?fieldTxt=pubPlaces&amp;startTxt=Ua-Uz&amp;current=place_0696&amp;field1Txt=Ulm" class="int">Ulm</a>`,
  },
  {
    country: `GM`,
    coords: [51.5333, 7.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0697.html?fieldTxt=pubPlaces&amp;startTxt=Ua-Uz&amp;current=place_0697&amp;field1Txt=Unna" class="int">Unna</a>`,
  },
  {
    country: `GM`,
    coords: [52.9333, 9.2333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0700.html?fieldTxt=pubPlaces&amp;startTxt=Va-Vz&amp;current=place_0700&amp;field1Txt=Verden" class="int">Verden</a>`,
  },
  {
    country: `GM`,
    coords: [51.1, 9.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0704.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0704&amp;field1Txt=Wabern" class="int">Wabern</a>`,
  },
  {
    country: `GM`,
    coords: [48.8333, 9.3],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0706.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0706&amp;field1Txt=Waiblingen" class="int">Waiblingen</a>`,
  },
  {
    country: `GM`,
    coords: [51.0667, 13.0167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0709.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0709&amp;field1Txt=Waldheim" class="int">Waldheim</a>`,
  },
  {
    country: `GM`,
    coords: [47.9167, 9.7667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0710.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0710&amp;field1Txt=Waldsee" class="int">Waldsee</a>`,
  },
  {
    country: `GM`,
    coords: [51.5, 9.1667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0712.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0712&amp;field1Txt=Warburg" class="int">Warburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.95, 7.9833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0713.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0713&amp;field1Txt=Warendorf" class="int">Warendorf</a>`,
  },
  {
    country: `GM`,
    coords: [48.05, 12.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0716.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0716&amp;field1Txt=Wasserburg" class="int">Wasserburg</a>`,
  },
  {
    country: `GM`,
    coords: [50.7667, 12.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0717.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0717&amp;field1Txt=Weida" class="int">Weida</a>`,
  },
  {
    country: `GM`,
    coords: [50.4833, 8.25],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0719.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0719&amp;field1Txt=Weilburg" class="int">Weilburg</a>`,
  },
  {
    country: `GM`,
    coords: [50.9833, 11.3167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0720.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0720&amp;field1Txt=Weimar" class="int">Weimar</a>`,
  },
  {
    country: `GM`,
    coords: [49.5167, 8.6833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0721.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0721&amp;field1Txt=Weinheim" class="int">Weinheim</a>`,
  },
  {
    country: `GM`,
    coords: [51.2, 11.9667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0723.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0723&amp;field1Txt=Weissenfels" class="int">Weissenfels</a>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 12.3833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0726.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0726&amp;field1Txt=Werdau" class="int">Werdau</a>`,
  },
  {
    country: `GM`,
    coords: [51.55, 7.9167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0727.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0727&amp;field1Txt=Werl" class="int">Werl</a>`,
  },
  {
    country: `GM`,
    coords: [51.8333, 10.7833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0728.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0728&amp;field1Txt=Wernigerode" class="int">Wernigerode</a><ul><li>Werningerode</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.6667, 6.6167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0730.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0730&amp;field1Txt=Wesel" class="int">Wesel</a>`,
  },
  {
    country: `GM`,
    coords: [50.0833, 8.2333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0734.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0734&amp;field1Txt=Wiesbaden" class="int">Wiesbaden</a>`,
  },
  {
    country: `GM`,
    coords: [53.5333, 8.1167],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0735.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0735&amp;field1Txt=Wilhelmshaven" class="int">Wilhelmshaven</a>`,
  },
  {
    country: `GM`,
    coords: [53.9, 11.4667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0738.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0738&amp;field1Txt=Wismar" class="int">Wismar</a><ul><li>Wismar i/M</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4333, 7.3333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0739.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0739&amp;field1Txt=Witten" class="int">Witten</a>`,
  },
  {
    country: `GM`,
    coords: [51.8833, 12.65],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0740.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0740&amp;field1Txt=Wittenberg" class="int">Wittenberg</a>`,
  },
  {
    country: `GM`,
    coords: [53.15, 12.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0741.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0741&amp;field1Txt=Wittstock" class="int">Wittstock</a>`,
  },
  {
    country: `GM`,
    coords: [52.1667, 10.55],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0742.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0742&amp;field1Txt=Wolfenbüttel" class="int">Wolfenbüttel</a><ul><li>Wolfenb</li><li>Wolfenbütt</li></ul>`,
  },
  {
    country: `GM`,
    coords: [51.4167, 10.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0743.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0743&amp;field1Txt=Worbis" class="int">Worbis</a>`,
  },
  {
    country: `GM`,
    coords: [49.6333, 8.35],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0744.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0744&amp;field1Txt=Worms" class="int">Worms</a>`,
  },
  {
    country: `GM`,
    coords: [52.7167, 14.1333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0745.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0745&amp;field1Txt=Wriezen" class="int">Wriezen</a>`,
  },
  {
    country: `GM`,
    coords: [51.3667, 12.7333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0746.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0746&amp;field1Txt=Wurzen" class="int">Wurzen</a>`,
  },
  {
    country: `GM`,
    coords: [49.8, 9.9333],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0748.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0748&amp;field1Txt=Würzburg" class="int">Würzburg</a>`,
  },
  {
    country: `GM`,
    coords: [51.05, 12.15],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0753.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0753&amp;field1Txt=Zeitz" class="int">Zeitz</a>`,
  },
  {
    country: `GM`,
    coords: [51.9667, 12.0833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0754.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0754&amp;field1Txt=Zerbst" class="int">Zerbst</a>`,
  },
  {
    country: `GM`,
    coords: [50.65, 11.9833],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0755.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0755&amp;field1Txt=Zeulenroda" class="int">Zeulenroda</a><ul><li>Zeulenrode</li></ul>`,
  },
  {
    country: `GM`,
    coords: [50.9, 14.75],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0757.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0757&amp;field1Txt=Zittau" class="int">Zittau</a>`,
  },
  {
    country: `GM`,
    coords: [50.75, 13.0667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0760.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0760&amp;field1Txt=Zschopau" class="int">Zschopau</a>`,
  },
  {
    country: `GM`,
    coords: [49.25, 7.3667],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0761.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0761&amp;field1Txt=Zweibrücken" class="int">Zweibrücken</a>`,
  },
  {
    country: `GM`,
    coords: [50.7333, 12.5],
    info: `Germany<br/><a href="content/database/indices/pubPlaces/pubplace/place_0763.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0763&amp;field1Txt=Zwickau" class="int">Zwickau</a>`,
  },
  {
    country: `HR`,
    coords: [45.3333, 14.45],
    info: `Croatia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0192.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0192&amp;field1Txt=Fiume" class="int">Fiume 
                    (Rijeka)
                </a>`,
  },
  {
    country: `HR`,
    coords: [46.3, 16.35],
    info: `Croatia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0711.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0711&amp;field1Txt=Warasdin" class="int">Warasdin 
                    (Varaždin)
                </a>`,
  },
  {
    country: `HR`,
    coords: [45.8, 15.9667],
    info: `Croatia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0751.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0751&amp;field1Txt=Zagreb" class="int">Zagreb</a><ul><li>Agram</li></ul>`,
  },
  {
    country: `HR`,
    coords: [44.1167, 15.2333],
    info: `Croatia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0752.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0752&amp;field1Txt=Zara" class="int">Zara 
                    (Zadar)
                </a>`,
  },
  {
    country: `HU`,
    coords: [47.5, 19.05],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0092.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0092&amp;field1Txt=Budapest" class="int">Budapest</a><ul><li>Budápest</li><li>Budaqest</li></ul>`,
  },
  {
    country: `HU`,
    coords: [47.5, 21.6167],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0130.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0130&amp;field1Txt=Debreczin" class="int">Debreczin 
                    (Debrecen)
                </a><ul><li>Debreszin</li></ul>`,
  },
  {
    country: `HU`,
    coords: [47.8833, 20.4667],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0183.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0183&amp;field1Txt=Erlau" class="int">Erlau 
                    (Eger)
                </a>`,
  },
  {
    country: `HU`,
    coords: [47.7667, 18.7],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0243.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0243&amp;field1Txt=Gran" class="int">Gran 
                    (Esztergom)
                </a>`,
  },
  {
    country: `HU`,
    coords: [46.45, 17.0],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0252.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0252&amp;field1Txt=Grosskanizsa" class="int">Grosskanizsa 
                    (Nagykanizsa)
                </a><ul><li>Gr. Kanizsa</li><li>Gr.-Kanizsa</li></ul>`,
  },
  {
    country: `HU`,
    coords: [47.3833, 16.5333],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0263.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0263&amp;field1Txt=Güns" class="int">Güns 
                    (Kőszeg)
                </a>`,
  },
  {
    country: `HU`,
    coords: [47.6667, 16.5833],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0516.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0516&amp;field1Txt=Oedenburg" class="int">Oedenburg 
                    (Sopron)
                </a>`,
  },
  {
    country: `HU`,
    coords: [47.5, 19.0833],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0542.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0542&amp;field1Txt=Pest" class="int">Pest</a><ul><li>Pesth</li></ul>`,
  },
  {
    country: `HU`,
    coords: [47.1833, 18.3667],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0661.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0661&amp;field1Txt=Stuhlweissenburg" class="int">Stuhlweissenburg 
                    (Székesfehérvár)
                </a>`,
  },
  {
    country: `HU`,
    coords: [46.25, 20.15],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0665.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0665&amp;field1Txt=Szegedin" class="int">Szegedin 
                    (Szeged)
                </a>`,
  },
  {
    country: `HU`,
    coords: [47.1, 17.9],
    info: `Hungary<br/><a href="content/database/indices/pubPlaces/pubplace/place_0702.html?fieldTxt=pubPlaces&amp;startTxt=Va-Vz&amp;current=place_0702&amp;field1Txt=Veszprim" class="int">Veszprim 
                    (Veszprém)
                </a>`,
  },
  {
    country: `IN`,
    coords: [22.5, 88.3333],
    info: `India<br/><a href="content/database/indices/pubPlaces/pubplace/place_0104.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0104&amp;field1Txt=Calcutta" class="int">Calcutta</a>`,
  },
  {
    country: `IT`,
    coords: [44.5, 11.3333],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0068.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0068&amp;field1Txt=Bologna" class="int">Bologna</a>`,
  },
  {
    country: `IT`,
    coords: [46.5167, 11.3667],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0074.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0074&amp;field1Txt=Bozen" class="int">Bozen 
                    (Bolzano)
                </a>`,
  },
  {
    country: `IT`,
    coords: [46.7167, 11.6667],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0084.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0084&amp;field1Txt=Brixen" class="int">Brixen 
                    (Bressanone)
                </a>`,
  },
  {
    country: `IT`,
    coords: [43.783, 11.25],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0195.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0195&amp;field1Txt=Florenz" class="int">Florenz 
                    (Firenze)
                </a>`,
  },
  {
    country: `IT`,
    coords: [44.417, 8.95],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0227.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0227&amp;field1Txt=Genua" class="int">Genua 
                    (Genoa)
                </a>`,
  },
  {
    country: `IT`,
    coords: [45.95, 13.6333],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0261.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0261&amp;field1Txt=Görz" class="int">Görz 
                    (Gorizia)
                </a>`,
  },
  {
    country: `IT`,
    coords: [45.4667, 9.2],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0437.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0437&amp;field1Txt=Mailand" class="int">Mailand 
                    (Milano)
                </a><ul><li>Mail</li><li>Mil</li><li>Milan</li><li>Milani</li><li>Milano</li></ul>`,
  },
  {
    country: `IT`,
    coords: [46.6667, 11.15],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0452.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0452&amp;field1Txt=Meran" class="int">Meran 
                    (Merano)
                </a>`,
  },
  {
    country: `IT`,
    coords: [40.8333, 14.25],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0482.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0482&amp;field1Txt=Neapel" class="int">Neapel 
                    (Napoli)
                </a><ul><li>Napoli</li></ul>`,
  },
  {
    country: `IT`,
    coords: [41.8833, 12.5],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0586.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0586&amp;field1Txt=Rom" class="int">Rom 
                    (Roma)
                </a><ul><li>Rome</li></ul>`,
  },
  {
    country: `IT`,
    coords: [45.65, 13.7833],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0688.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0688&amp;field1Txt=Triest" class="int">Triest 
                    (Trieste)
                </a>`,
  },
  {
    country: `IT`,
    coords: [45.0667, 7.6667],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0690.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0690&amp;field1Txt=Turin" class="int">Turin 
                    (Torino)
                </a>`,
  },
  {
    country: `IT`,
    coords: [45.4333, 12.3333],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0699.html?fieldTxt=pubPlaces&amp;startTxt=Va-Vz&amp;current=place_0699&amp;field1Txt=Venedig" class="int">Venedig 
                    (Venezia)
                </a>`,
  },
  {
    country: `IT`,
    coords: [45.4333, 11.0],
    info: `Italy<br/><a href="content/database/indices/pubPlaces/pubplace/place_0701.html?fieldTxt=pubPlaces&amp;startTxt=Va-Vz&amp;current=place_0701&amp;field1Txt=Verona" class="int">Verona</a>`,
  },
  {
    country: `LG`,
    coords: [56.5167, 21.0167],
    info: `Latvia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0408.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0408&amp;field1Txt=Libau" class="int">Libau 
                    (Liepāja)
                </a>`,
  },
  {
    country: `LG`,
    coords: [56.65, 23.6667],
    info: `Latvia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0463.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0463&amp;field1Txt=Mitau" class="int">Mitau 
                    (Jelgava)
                </a>`,
  },
  {
    country: `LG`,
    coords: [56.8833, 24.1333],
    info: `Latvia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0580.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0580&amp;field1Txt=Riga" class="int">Riga</a><ul><li>Riega</li></ul>`,
  },
  {
    country: `LH`,
    coords: [54.6833, 25.3167],
    info: `Lithuania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0736.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0736&amp;field1Txt=Wilna" class="int">Wilna 
                    (Vilnius)
                </a>`,
  },
  {
    country: `LO`,
    coords: [48.9667, 20.5833],
    info: `Slovakia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0316.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0316&amp;field1Txt=Iglo" class="int">Iglo 
                    (Spišská Nová Ves)
                </a>`,
  },
  {
    country: `LO`,
    coords: [48.7333, 21.25],
    info: `Slovakia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0340.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0340&amp;field1Txt=Kaschau" class="int">Kaschau 
                    (Košice)
                </a><ul><li>Kassan</li><li>Kassa</li></ul>`,
  },
  {
    country: `LO`,
    coords: [48.1667, 17.1667],
    info: `Slovakia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0557.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0557&amp;field1Txt=Pressburg" class="int">Pressburg 
                    (Bratislava)
                </a>`,
  },
  {
    country: `LO`,
    coords: [48.3833, 17.5833],
    info: `Slovakia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0691.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0691&amp;field1Txt=Tyrnau" class="int">Tyrnau 
                    (Trnava)
                </a>`,
  },
  {
    country: `LU`,
    coords: [49.6167, 6.1333],
    info: `Luxembourg<br/><a href="content/database/indices/pubPlaces/pubplace/place_0424.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0424&amp;field1Txt=Luxemburg" class="int">Luxemburg</a>`,
  },
  {
    country: `MX`,
    coords: [19.4, -99.15],
    info: `Mexico<br/><a href="content/database/indices/pubPlaces/pubplace/place_0457.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0457&amp;field1Txt=Mexiko" class="int">Mexiko</a><ul><li>Mexico</li></ul>`,
  },
  {
    country: `NL`,
    coords: [52.35, 4.9],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0011.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0011&amp;field1Txt=Amsterdam" class="int">Amsterdam</a><ul><li>Amsterd</li></ul>`,
  },
  {
    country: `NL`,
    coords: [52.0, 5.8833],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0018.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0018&amp;field1Txt=Arnheim" class="int">Arnheim</a><ul><li>Arnhem</li></ul>`,
  },
  {
    country: `NL`,
    coords: [51.8, 4.6667],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0142.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0142&amp;field1Txt=Dordrecht" class="int">Dordrecht</a>`,
  },
  {
    country: `NL`,
    coords: [53.2167, 6.5833],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0253.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0253&amp;field1Txt=Gröningen" class="int">Gröningen</a><ul><li>Groningen</li></ul>`,
  },
  {
    country: `NL`,
    coords: [52.0833, 4.2667],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0266.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0266&amp;field1Txt=Haag" class="int">Haag 
                    (Den Haag)
                </a><ul><li>Gravenhage</li></ul>`,
  },
  {
    country: `NL`,
    coords: [52.3833, 4.6333],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0268.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0268&amp;field1Txt=Haarlem" class="int">Haarlem</a>`,
  },
  {
    country: `NL`,
    coords: [52.2667, 6.7667],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0291.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0291&amp;field1Txt=Hengelo" class="int">Hengelo</a>`,
  },
  {
    country: `NL`,
    coords: [51.6833, 5.3167],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0298.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0298&amp;field1Txt=Herzogenbusch" class="int">Herzogenbusch 
                    (\s-Hertogenbosch)
                </a>`,
  },
  {
    country: `NL`,
    coords: [52.1667, 4.5],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0391.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0391&amp;field1Txt=Leiden" class="int">Leiden</a>`,
  },
  {
    country: `NL`,
    coords: [51.5, 3.6],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0459.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0459&amp;field1Txt=Middelburg" class="int">Middelburg</a>`,
  },
  {
    country: `NL`,
    coords: [51.9167, 4.4833],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0592.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0592&amp;field1Txt=Rotterdam" class="int">Rotterdam</a><ul><li>Rotterd</li></ul>`,
  },
  {
    country: `NL`,
    coords: [51.5667, 5.0833],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0679.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0679&amp;field1Txt=Tilburg" class="int">Tilburg</a>`,
  },
  {
    country: `NL`,
    coords: [52.1, 5.1167],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0698.html?fieldTxt=pubPlaces&amp;startTxt=Ua-Uz&amp;current=place_0698&amp;field1Txt=Utrecht" class="int">Utrecht</a>`,
  },
  {
    country: `NL`,
    coords: [52.5167, 6.1],
    info: `Netherlands<br/><a href="content/database/indices/pubPlaces/pubplace/place_0764.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0764&amp;field1Txt=Zwolle" class="int">Zwolle</a>`,
  },
  {
    country: `NO`,
    coords: [60.3833, 5.3333],
    info: `Norway<br/><a href="content/database/indices/pubPlaces/pubplace/place_0043.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0043&amp;field1Txt=Bergen &lt;Norwegen&gt;" class="int">Bergen &lt;Norwegen&gt;</a><ul><li>Bergen</li></ul>`,
  },
  {
    country: `NO`,
    coords: [59.9333, 10.75],
    info: `Norway<br/><a href="content/database/indices/pubPlaces/pubplace/place_0112.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0112&amp;field1Txt=Christiania" class="int">Christiania 
                    (Oslo)
                </a><ul><li>Christiana</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.8, 20.4833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0003.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0003&amp;field1Txt=Allenstein" class="int">Allenstein 
                    (Olsztyn)
                </a><ul><li>Altenstein</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.1667, 15.4],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0021.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0021&amp;field1Txt=Arnswalde" class="int">Arnswalde 
                    (Choszczno)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.8333, 21.9667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0023.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0023&amp;field1Txt=Arys" class="int">Arys 
                    (Orzysz)
                </a>`,
  },
  {
    country: `PL`,
    coords: [49.8333, 19.0],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0058.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0058&amp;field1Txt=Bielitz" class="int">Bielitz 
                    (Bielsko-Biała)
                </a>`,
  },
  {
    country: `PL`,
    coords: [49.9833, 20.4167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0065.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0065&amp;field1Txt=Bochnia" class="int">Bochnia</a>`,
  },
  {
    country: `PL`,
    coords: [54.4, 19.8333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0077.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0077&amp;field1Txt=Braunsberg &lt;Ostpreussen&gt;" class="int">Braunsberg &lt;Ostpreussen&gt; 
                    (Braniewo)
                </a><ul><li>Braunsberg</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.1, 17.0],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0082.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0082&amp;field1Txt=Breslau" class="int">Breslau 
                    (Wrocław)
                </a><ul><li>Bresl</li><li>Breslan</li><li>Bréslau</li><li>reslau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.35, 17.4667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0083.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0083&amp;field1Txt=Brieg" class="int">Brieg 
                    (Brzeg)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.15, 18.0],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0085.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0085&amp;field1Txt=Bromberg" class="int">Bromberg 
                    (Bydgoszcz)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.2667, 15.5667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0094.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0094&amp;field1Txt=Bunzlau" class="int">Bunzlau 
                    (Bolesławiec)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.8, 16.067],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0098.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0098&amp;field1Txt=Buslar" class="int">Buslar 
                    (Buslary)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.9667, 14.7667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0105.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0105&amp;field1Txt=Cammin &lt;Pommern&gt;" class="int">Cammin &lt;Pommern&gt; 
                    (Kamień Pomorski)
                </a><ul><li>Cammin</li></ul>`,
  },
  {
    country: `PL`,
    coords: [52.05, 15.0667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0123.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0123&amp;field1Txt=Crossen &lt;Oder&gt;" class="int">Crossen &lt;Oder&gt; 
                    (Krosno Odrzańskie)
                </a><ul><li>Crossen</li><li>Crossen a/O</li></ul>`,
  },
  {
    country: `PL`,
    coords: [52.8833, 16.5333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0124.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0124&amp;field1Txt=Czarnków" class="int">Czarnków</a><ul><li>Czarnikau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [54.3667, 18.6833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0127.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0127&amp;field1Txt=Danzig" class="int">Danzig 
                    (Gdańsk)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.2833, 16.4833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0135.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0135&amp;field1Txt=Deutsch Krone" class="int">Deutsch Krone 
                    (Wałcz)
                </a><ul><li>Deutsch-Krone</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.5333, 15.8],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0145.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0145&amp;field1Txt=Dramburg" class="int">Dramburg 
                    (Drawsko Pomorskie)
                </a>`,
  },
  {
    country: `PL`,
    coords: [54.1667, 19.4167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0172.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0172&amp;field1Txt=Elbing" class="int">Elbing 
                    (Elbląg)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.8167, 16.25],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0203.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0203&amp;field1Txt=Fraustadt" class="int">Fraustadt 
                    (Wschowa)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.8833, 15.5167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0213.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0213&amp;field1Txt=Friedeberg" class="int">Friedeberg 
                    (Strzelce)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.4667, 16.6667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0232.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0232&amp;field1Txt=Glatz" class="int">Glatz 
                    (Kłodzko)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.3333, 18.6667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0234.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0234&amp;field1Txt=Gleiwitz" class="int">Gleiwitz 
                    (Gliwice)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.15, 21.9667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0235.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0235&amp;field1Txt=Glogau" class="int">Glogau 
                    (Głogów)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.4833, 18.75],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0244.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0244&amp;field1Txt=Graudenz" class="int">Graudenz 
                    (Grudziądz)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.5333, 18.25],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0250.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0250&amp;field1Txt=Gross Strehlitz" class="int">Gross Strehlitz 
                    (Strzelce)
                </a><ul><li>Gross-Strehlitz</li><li>Strehlitz</li><li>Gr.-Strehlitz</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.95, 15.5],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0254.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0254&amp;field1Txt=Grünberg &lt;Schlesien&gt;" class="int">Grünberg &lt;Schlesien&gt; 
                    (Zielona Góra)
                </a><ul><li>Grünberg</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.6667, 16.5333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0256.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0256&amp;field1Txt=Guhrau" class="int">Guhrau 
                    (Góra)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.3, 16.65],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0269.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0269&amp;field1Txt=Habelschwerdt" class="int">Habelschwerdt 
                    (Bystrzyca Kłodzka)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.3, 15.9667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0283.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0283&amp;field1Txt=Haynau" class="int">Haynau 
                    (Chojnów)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.9167, 15.75],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0303.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0303&amp;field1Txt=Hirschberg" class="int">Hirschberg 
                    (Jelenia Góra)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.8167, 18.2],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0322.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0322&amp;field1Txt=Inowrozław" class="int">Inowrozław</a><ul><li>Inowrazlaw</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.0167, 16.1833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0326.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0326&amp;field1Txt=Jauer &lt;Liegnitz&gt;" class="int">Jauer &lt;Liegnitz&gt; 
                    (Jawor)
                </a><ul><li>Jauer</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.3, 15.9167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0335.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0335&amp;field1Txt=Kalisch" class="int">Kalisch 
                    (Kalisz)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.7, 17.5333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0357.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0357&amp;field1Txt=Konitz" class="int">Konitz 
                    (Chojnice)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.05, 19.9167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0362.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0362&amp;field1Txt=Krakau" class="int">Krakau 
                    (Kraków)
                </a><ul><li>Cracau</li><li>Crakau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.3333, 18.4167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0369.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0369&amp;field1Txt=Kulm" class="int">Kulm 
                    (Chełmno)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.9667, 14.4333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0374.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0374&amp;field1Txt=Königsberg &lt;Neumark&gt;" class="int">Königsberg &lt;Neumark&gt; 
                    (Chojna)
                </a><ul><li>Königsberg i. d. N</li><li>Königsberg i/d. N</li><li>Königsberg i/N</li></ul>`,
  },
  {
    country: `PL`,
    coords: [54.1667, 16.1667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0376.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0376&amp;field1Txt=Köslin" class="int">Köslin 
                    (Koszalin)
                </a><ul><li>Cöslin</li></ul>`,
  },
  {
    country: `PL`,
    coords: [52.7, 15.2],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0383.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0383&amp;field1Txt=Landsberg &lt;Warthe&gt;" class="int">Landsberg &lt;Warthe&gt; 
                    (Gorzów Wielkopolski)
                </a><ul><li>Landsberg</li><li>Landsberg a. d. W</li><li>Landsberg a/W</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.6833, 16.6167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0385.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0385&amp;field1Txt=Langenbielau" class="int">Langenbielau 
                    (Bielawa)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.1167, 15.2833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0387.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0387&amp;field1Txt=Lauban" class="int">Lauban 
                    (Lubań)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.2, 17.8167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0405.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0405&amp;field1Txt=Leobschütz" class="int">Leobschütz 
                    (Głubczyce)
                </a><ul><li>Loebschütz</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.2, 16.1667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0409.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0409&amp;field1Txt=Liegnitz" class="int">Liegnitz 
                    (Legnica)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.85, 16.5833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0417.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0417&amp;field1Txt=Lissa" class="int">Lissa 
                    (Leszno)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.8333, 22.35],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0426.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0426&amp;field1Txt=Lyck" class="int">Lyck 
                    (Ełk)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.1, 15.6],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0429.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0429&amp;field1Txt=Löwenberg &lt;Schlesien&gt;" class="int">Löwenberg &lt;Schlesien&gt; 
                    (Lwówek Ślaski)
                </a><ul><li>Löwenberg</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.3833, 16.1667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0432.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0432&amp;field1Txt=Lüben" class="int">Lüben 
                    (Lubin)
                </a>`,
  },
  {
    country: `PL`,
    coords: [54.0333, 19.05],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0443.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0443&amp;field1Txt=Marienburg &lt;Westpreussen&gt;" class="int">Marienburg &lt;Westpreussen&gt; 
                    (Malbork)
                </a><ul><li>Marienburg</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.9, 18.9167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0444.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0444&amp;field1Txt=Marienwerder" class="int">Marienwerder 
                    (Kwidzyn)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.6167, 17.0167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0478.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0478&amp;field1Txt=Münsterberg &lt;Schlesien&gt;" class="int">Münsterberg &lt;Schlesien&gt; 
                    (Ziębice)
                </a><ul><li>Münsterberg</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.6667, 15.1333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0480.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0480&amp;field1Txt=Naugard" class="int">Naugard 
                    (Nowogard)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.5, 17.3333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0483.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0483&amp;field1Txt=Neisse" class="int">Neisse 
                    (Nysa)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.7167, 14.7],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0487.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0487&amp;field1Txt=Neudamm" class="int">Neudamm 
                    (Dębno)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.8167, 15.6833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0491.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0491&amp;field1Txt=Neusalz &lt;Oder&gt;" class="int">Neusalz &lt;Oder&gt; 
                    (Nowa Sól)
                </a><ul><li>Neusalz a/O</li></ul>`,
  },
  {
    country: `PL`,
    coords: [49.65, 20.6667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0492.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0492&amp;field1Txt=Neusandez" class="int">Neusandez 
                    (Nowy Sącz)
                </a><ul><li>Neu-Sandec</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.317, 17.583],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0495.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0495&amp;field1Txt=Neustadt &lt;Oberschlesien&gt;" class="int">Neustadt &lt;Oberschlesien&gt; 
                    (Prudnik)
                </a><ul><li>Neustadt a/S</li><li>Neustadt o/S</li><li>Neustadt o/Schl</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.7, 16.6833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0498.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0498&amp;field1Txt=Neustettin" class="int">Neustettin 
                    (Szczecinek)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.35, 17.8333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0511.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0511&amp;field1Txt=Oberglogau" class="int">Oberglogau 
                    (Głogówek)
                </a><ul><li>Ober-Glogau</li><li>Ob.-Glogau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.2, 17.35],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0517.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0517&amp;field1Txt=Oels &lt;Niederschlesien&gt;" class="int">Oels &lt;Niederschlesien&gt; 
                    (Oleśnica)
                </a><ul><li>Oels</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.95, 17.3],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0521.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0521&amp;field1Txt=Ohlau" class="int">Ohlau 
                    (Oława)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.6667, 17.9333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0525.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0525&amp;field1Txt=Oppeln" class="int">Oppeln 
                    (Opole)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.65, 17.8167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0534.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0534&amp;field1Txt=Ostrowo" class="int">Ostrowo 
                    (Ostrów Wielkopolski)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.4, 18.633],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0540.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0540&amp;field1Txt=Peiskretscham" class="int">Peiskretscham 
                    (Pyskowice)
                </a>`,
  },
  {
    country: `PL`,
    coords: [49.9833, 18.9],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0549.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0549&amp;field1Txt=Pless" class="int">Pless 
                    (Pszczyna)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.4167, 16.8833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0551.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0551&amp;field1Txt=Posen" class="int">Posen 
                    (Poznań)
                </a>`,
  },
  {
    country: `PL`,
    coords: [49.7833, 22.7833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0559.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0559&amp;field1Txt=Przemyśl" class="int">Przemyśl</a><ul><li>Przemysl</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.0833, 18.1667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0566.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0566&amp;field1Txt=Ratibor" class="int">Ratibor 
                    (Racibórz)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.7833, 17],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0585.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0585&amp;field1Txt=Rogasen" class="int">Rogasen 
                    (Rogoźno)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.6167, 15.3333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0601.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0601&amp;field1Txt=Sagan" class="int">Sagan 
                    (Żagań)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.25, 16.4833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0621.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0621&amp;field1Txt=Schweidnitz" class="int">Schweidnitz 
                    (Świdnica)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.25, 15.5167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0625.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0625&amp;field1Txt=Schwiebus" class="int">Schwiebus 
                    (Świebodzin)
                </a><ul><li>Schwibus</li></ul>`,
  },
  {
    country: `PL`,
    coords: [51.8167, 14.9833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0637.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0637&amp;field1Txt=Sommerfeld" class="int">Sommerfeld 
                    (Lubsko)
                </a>`,
  },
  {
    country: `PL`,
    coords: [51.6667, 15.1667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0640.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0640&amp;field1Txt=Sorau &lt;Lausitz&gt;" class="int">Sorau &lt;Lausitz&gt; 
                    (Żary)
                </a><ul><li>Sorau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.35, 15.0167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0647.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0647&amp;field1Txt=Stargard" class="int">Stargard 
                    (Stargard Szczeciński)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.4167, 14.5333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0651.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0651&amp;field1Txt=Stettin" class="int">Stettin 
                    (Szczecin)
                </a>`,
  },
  {
    country: `PL`,
    coords: [54.4667, 17.0],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0655.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0655&amp;field1Txt=Stolp" class="int">Stolp 
                    (Słupsk)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.8, 17.05],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0659.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0659&amp;field1Txt=Strehlen" class="int">Strehlen 
                    (Strzelin)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.9833, 16.3333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0660.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0660&amp;field1Txt=Striegau" class="int">Striegau 
                    (Strzegom)
                </a><ul><li>Strigau</li></ul>`,
  },
  {
    country: `PL`,
    coords: [53.8833, 14.2333],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0664.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0664&amp;field1Txt=Swinemünde" class="int">Swinemünde 
                    (Świnoujście)
                </a><ul><li>Swinewinde</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.4667, 18.6667],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0668.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0668&amp;field1Txt=Tarnowitz" class="int">Tarnowitz 
                    (Tarnowskie Góry)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.0167, 20.9833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0669.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0669&amp;field1Txt=Tarnów" class="int">Tarnów</a><ul><li>Tarnow</li></ul>`,
  },
  {
    country: `PL`,
    coords: [49.75, 18.5833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0673.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0673&amp;field1Txt=Teschen" class="int">Teschen 
                    (Cieszyn)
                </a>`,
  },
  {
    country: `PL`,
    coords: [53.0167, 18.5833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0677.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0677&amp;field1Txt=Thorn" class="int">Thorn 
                    (Toruń)
                </a>`,
  },
  {
    country: `PL`,
    coords: [54.05, 15.25],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0686.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0686&amp;field1Txt=Treptow &lt;Rega&gt;" class="int">Treptow &lt;Rega&gt; 
                    (Trzebiatów)
                </a><ul><li>Treptow a. d. R</li></ul>`,
  },
  {
    country: `PL`,
    coords: [49.9, 19.4833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0705.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0705&amp;field1Txt=Wadowice" class="int">Wadowice</a>`,
  },
  {
    country: `PL`,
    coords: [50.8, 16.3167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0708.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0708&amp;field1Txt=Waldenburg &lt;Schlesien&gt;" class="int">Waldenburg &lt;Schlesien&gt; 
                    (Wałbrzych)
                </a><ul><li>Waldenburg i/Schl</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.863, 15.677],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0714.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0714&amp;field1Txt=Warmbrunn" class="int">Warmbrunn 
                    (Cieplice Śląskie Zdrój)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.25, 21.0],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0715.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0715&amp;field1Txt=Warschau" class="int">Warschau 
                    (Warszawa)
                </a><ul><li>Varsovie</li><li>Wars</li></ul>`,
  },
  {
    country: `PL`,
    coords: [50.3333, 17.3833],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0756.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0756&amp;field1Txt=Ziegenhals" class="int">Ziegenhals 
                    (Głuchołazy)
                </a>`,
  },
  {
    country: `PL`,
    coords: [52.1, 15.6167],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0765.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0765&amp;field1Txt=Züllichau" class="int">Züllichau 
                    (Sulechów)
                </a>`,
  },
  {
    country: `PL`,
    coords: [50.3833, 17.65],
    info: `Poland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0766.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0766&amp;field1Txt=Zülz" class="int">Zülz 
                    (Biała)
                </a>`,
  },
  {
    country: `RO`,
    coords: [44.4333, 26.1],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0090.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0090&amp;field1Txt=Bucarest" class="int">Bucarest 
                    (Bucureşti)
                </a><ul><li>Buckarest</li><li>Bukarest</li></ul>`,
  },
  {
    country: `RO`,
    coords: [45.7667, 24.15],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0295.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0295&amp;field1Txt=Hermannstadt" class="int">Hermannstadt 
                    (Sibiu)
                </a><ul><li>Herrmannstadt</li></ul>`,
  },
  {
    country: `RO`,
    coords: [47.15, 27.6333],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0325.html?fieldTxt=pubPlaces&amp;startTxt=Ja-Jz&amp;current=place_0325&amp;field1Txt=Jassy" class="int">Jassy 
                    (Iaşi)
                </a>`,
  },
  {
    country: `RO`,
    coords: [46.7833, 23.6167],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0352.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0352&amp;field1Txt=Klausenburg" class="int">Klausenburg</a>`,
  },
  {
    country: `RO`,
    coords: [45.65, 25.5833],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0367.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0367&amp;field1Txt=Kronstadt &lt;Siebenbürgen&gt;" class="int">Kronstadt &lt;Siebenbürgen&gt; 
                    (Braşov)
                </a><ul><li>Kronstadt</li></ul>`,
  },
  {
    country: `RO`,
    coords: [46.167, 24.35],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0446.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0446&amp;field1Txt=Mediasch" class="int">Mediasch</a>`,
  },
  {
    country: `RO`,
    coords: [45.0333, 21.7167],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0528.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0528&amp;field1Txt=Oravicza" class="int">Oravicza 
                    (Oraviţa)
                </a>`,
  },
  {
    country: `RO`,
    coords: [46.05, 20.867],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0541.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0541&amp;field1Txt=Perjámos" class="int">Perjámos 
                    (Periam)
                </a>`,
  },
  {
    country: `RO`,
    coords: [45.75, 21.25],
    info: `Romania<br/><a href="content/database/indices/pubPlaces/pubplace/place_0671.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0671&amp;field1Txt=Temesvar" class="int">Temesvar 
                    (Timişoara)
                </a>`,
  },
  {
    country: `RS`,
    coords: [54.5667, 22.2],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0257.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0257&amp;field1Txt=Gumbinnen" class="int">Gumbinnen 
                    (Gusev)
                </a>`,
  },
  {
    country: `RS`,
    coords: [54.6, 21.8],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0323.html?fieldTxt=pubPlaces&amp;startTxt=Ia-Iz&amp;current=place_0323&amp;field1Txt=Insterburg" class="int">Insterburg 
                    (Chernyahovsk)
                </a>`,
  },
  {
    country: `RS`,
    coords: [54.6667, 20.5],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0373.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0373&amp;field1Txt=Königsberg" class="int">Königsberg 
                    (Kaliningrad)
                </a><ul><li>Königsb</li><li>Koenigsberg</li><li>Königberg</li></ul>`,
  },
  {
    country: `RS`,
    coords: [54.6667, 20.5],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0375.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0375&amp;field1Txt=Königsberg &lt;Preussen&gt;" class="int">Königsberg &lt;Preussen&gt; 
                    (Kaliningrad)
                </a><ul><li>Koenigsberg i/Pr</li><li>Königsberg i/Pr</li><li>Königsberg i/P</li><li>Königsberg, i/P</li></ul>`,
  },
  {
    country: `RS`,
    coords: [55.75, 37.7],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0466.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0466&amp;field1Txt=Moskau" class="int">Moskau 
                    (Moskva)
                </a><ul><li>Moscau</li><li>Moskwa</li></ul>`,
  },
  {
    country: `RS`,
    coords: [59.8833, 30.25],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0608.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0608&amp;field1Txt=Sankt Petersburg" class="int">Sankt Petersburg</a><ul><li>Petersburg</li><li>St. Petersbourg</li><li>St. Petersburg</li><li>St. Petersb</li></ul>`,
  },
  {
    country: `RS`,
    coords: [54.6333, 22.5667],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0646.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0646&amp;field1Txt=Stallupönen" class="int">Stallupönen 
                    (Nesterov)
                </a>`,
  },
  {
    country: `RS`,
    coords: [55.033, 21.8333],
    info: `Russian Federation<br/><a href="content/database/indices/pubPlaces/pubplace/place_0680.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0680&amp;field1Txt=Tilsit" class="int">Tilsit 
                    (Sovetsk)
                </a>`,
  },
  {
    country: `SF`,
    coords: [-33.9333, 18.4667],
    info: `South Africa<br/><a href="content/database/indices/pubPlaces/pubplace/place_0337.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0337&amp;field1Txt=Kapstadt" class="int">Kapstadt 
                    (Cape Town)
                </a><ul><li>Capstadt</li><li>Cape Town</li><li>Capetown</li></ul>`,
  },
  {
    country: `SI`,
    coords: [46.0667, 14.5],
    info: `Slovenia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0381.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0381&amp;field1Txt=Laibach" class="int">Laibach 
                    (Ljubljana)
                </a>`,
  },
  {
    country: `SP`,
    coords: [37.25, -6.9333],
    info: `Spain<br/><a href="content/database/indices/pubPlaces/pubplace/place_0314.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0314&amp;field1Txt=Huelva" class="int">Huelva</a>`,
  },
  {
    country: `SP`,
    coords: [40.4167, -3.7167],
    info: `Spain<br/><a href="content/database/indices/pubPlaces/pubplace/place_0435.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0435&amp;field1Txt=Madrid" class="int">Madrid</a>`,
  },
  {
    country: `SR`,
    coords: [44.8333, 20.5],
    info: `Serbia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0038.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0038&amp;field1Txt=Belgrad" class="int">Belgrad 
                    (Beograd)
                </a>`,
  },
  {
    country: `SR`,
    coords: [45.1167, 21.3167],
    info: `Serbia<br/><a href="content/database/indices/pubPlaces/pubplace/place_0729.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0729&amp;field1Txt=Werschetz" class="int">Werschetz 
                    (Vršac)
                </a>`,
  },
  {
    country: `SW`,
    coords: [57.7167, 11.9667],
    info: `Sweden<br/><a href="content/database/indices/pubPlaces/pubplace/place_0242.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0242&amp;field1Txt=Gothenburg" class="int">Gothenburg</a><ul><li>Göteborg</li></ul>`,
  },
  {
    country: `SW`,
    coords: [59.3333, 18.0833],
    info: `Sweden<br/><a href="content/database/indices/pubPlaces/pubplace/place_0653.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0653&amp;field1Txt=Stockholm" class="int">Stockholm</a>`,
  },
  {
    country: `SZ`,
    coords: [47.4, 8.0667],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0002.html?fieldTxt=pubPlaces&amp;startTxt=Aa-Az&amp;current=place_0002&amp;field1Txt=Aarau" class="int">Aarau</a><ul><li>Arau</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.4667, 8.3167],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0030.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0030&amp;field1Txt=Baden &lt;Aargau&gt;" class="int">Baden &lt;Aargau&gt;</a><ul><li>Baden</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.55, 7.6],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0035.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0035&amp;field1Txt=Basel" class="int">Basel</a>`,
  },
  {
    country: `SZ`,
    coords: [46.267, 6.15],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0039.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0039&amp;field1Txt=Belle-Vue" class="int">Belle-Vue</a>`,
  },
  {
    country: `SZ`,
    coords: [46.95, 7.4333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0050.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0050&amp;field1Txt=Bern" class="int">Bern</a>`,
  },
  {
    country: `SZ`,
    coords: [47.15, 7.2667],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0056.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0056&amp;field1Txt=Biel &lt;Bern&gt;" class="int">Biel &lt;Bern&gt;</a><ul><li>Biel</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.5333, 7.5833],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0060.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0060&amp;field1Txt=Binningen" class="int">Binningen</a>`,
  },
  {
    country: `SZ`,
    coords: [46.8667, 9.5333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0113.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0113&amp;field1Txt=Chur" class="int">Chur</a>`,
  },
  {
    country: `SZ`,
    coords: [46.8, 9.8333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0129.html?fieldTxt=pubPlaces&amp;startTxt=Da-Dz&amp;current=place_0129&amp;field1Txt=Davos" class="int">Davos</a>`,
  },
  {
    country: `SZ`,
    coords: [47.1167, 8.75],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0167.html?fieldTxt=pubPlaces&amp;startTxt=Ea-Ez&amp;current=place_0167&amp;field1Txt=Einsiedeln" class="int">Einsiedeln</a>`,
  },
  {
    country: `SZ`,
    coords: [47.4167, 9.2],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0193.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0193&amp;field1Txt=Flawyl" class="int">Flawyl</a>`,
  },
  {
    country: `SZ`,
    coords: [47.5667, 8.9],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0202.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0202&amp;field1Txt=Frauenfeld" class="int">Frauenfeld</a>`,
  },
  {
    country: `SZ`,
    coords: [46.8333, 7.1667],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0211.html?fieldTxt=pubPlaces&amp;startTxt=Fa-Fz&amp;current=place_0211&amp;field1Txt=Fribourg" class="int">Fribourg</a><ul><li>Freiburg (Schweiz)</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [46.2167, 6.15],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0225.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0225&amp;field1Txt=Genf" class="int">Genf 
                    (Genève)
                </a>`,
  },
  {
    country: `SZ`,
    coords: [47.3833, 9.2833],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0293.html?fieldTxt=pubPlaces&amp;startTxt=Ha-Hz&amp;current=place_0293&amp;field1Txt=Herisau" class="int">Herisau</a>`,
  },
  {
    country: `SZ`,
    coords: [47.1, 6.8333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0379.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0379&amp;field1Txt=La Chaux-de-Fonds" class="int">La Chaux-de-Fonds</a><ul><li>La Chaux de Fonds</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [46.5333, 6.65],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0388.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0388&amp;field1Txt=Lausanne" class="int">Lausanne</a>`,
  },
  {
    country: `SZ`,
    coords: [47.4833, 7.7167],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0411.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0411&amp;field1Txt=Liestal" class="int">Liestal</a>`,
  },
  {
    country: `SZ`,
    coords: [47.0667, 6.75],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0418.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0418&amp;field1Txt=Locle" class="int">Locle</a>`,
  },
  {
    country: `SZ`,
    coords: [47.05, 8.2833],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0425.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0425&amp;field1Txt=Luzern" class="int">Luzern</a>`,
  },
  {
    country: `SZ`,
    coords: [47.4667, 9.5],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0588.html?fieldTxt=pubPlaces&amp;startTxt=Ra-Rz&amp;current=place_0588&amp;field1Txt=Rorschach" class="int">Rorschach</a>`,
  },
  {
    country: `SZ`,
    coords: [47.1667, 9.1333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0606.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0606&amp;field1Txt=Sankt Gallen" class="int">Sankt Gallen</a><ul><li>St Gallen</li><li>St. Gallen</li><li>St. Sallen</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.7, 8.6333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0611.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0611&amp;field1Txt=Schaffhausen" class="int">Schaffhausen</a>`,
  },
  {
    country: `SZ`,
    coords: [47.4167, 7.5833],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0636.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0636&amp;field1Txt=Solothurn" class="int">Solothurn</a>`,
  },
  {
    country: `SZ`,
    coords: [46.7667, 7.6333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0678.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0678&amp;field1Txt=Thun" class="int">Thun</a>`,
  },
  {
    country: `SZ`,
    coords: [46.4667, 6.85],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0703.html?fieldTxt=pubPlaces&amp;startTxt=Va-Vz&amp;current=place_0703&amp;field1Txt=Vevey" class="int">Vevey</a>`,
  },
  {
    country: `SZ`,
    coords: [47.5, 8.75],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0737.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0737&amp;field1Txt=Winterthur" class="int">Winterthur</a><ul><li>Wintherthur</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.2333, 8.6833],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0747.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0747&amp;field1Txt=Wädensweil" class="int">Wädensweil 
                    (Wädenswil)
                </a>`,
  },
  {
    country: `SZ`,
    coords: [46.7833, 6.6333],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0749.html?fieldTxt=pubPlaces&amp;startTxt=Ya-Yz&amp;current=place_0749&amp;field1Txt=Yverdon" class="int">Yverdon</a>`,
  },
  {
    country: `SZ`,
    coords: [47.3, 7.95],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0759.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0759&amp;field1Txt=Zofingen" class="int">Zofingen</a>`,
  },
  {
    country: `SZ`,
    coords: [47.3833, 8.55],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0767.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0767&amp;field1Txt=Zürich" class="int">Zürich</a><ul><li>Zurich</li></ul>`,
  },
  {
    country: `SZ`,
    coords: [47.3833, 8.55],
    info: `Switzerland<br/><a href="content/database/indices/pubPlaces/pubplace/place_0768.html?fieldTxt=pubPlaces&amp;startTxt=Za-Zz&amp;current=place_0768&amp;field1Txt=Zürich-Oberstrass" class="int">Zürich-Oberstrass</a>`,
  },
  {
    country: `TU`,
    coords: [41.0333, 28.95],
    info: `Turkey<br/><a href="content/database/indices/pubPlaces/pubplace/place_0358.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0358&amp;field1Txt=Konstantinopel" class="int">Konstantinopel</a><ul><li>Constantinopel</li></ul>`,
  },
  {
    country: `UK`,
    coords: [53.784, -1.75],
    info: `United Kingdom<br/><a href="content/database/indices/pubPlaces/pubplace/place_0075.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0075&amp;field1Txt=Bradford" class="int">Bradford</a>`,
  },
  {
    country: `UK`,
    coords: [55.8833, -4.25],
    info: `United Kingdom<br/><a href="content/database/indices/pubPlaces/pubplace/place_0231.html?fieldTxt=pubPlaces&amp;startTxt=Ga-Gz&amp;current=place_0231&amp;field1Txt=Glasgow" class="int">Glasgow</a>`,
  },
  {
    country: `UK`,
    coords: [51.5167, -0.0833],
    info: `United Kingdom<br/><a href="content/database/indices/pubPlaces/pubplace/place_0419.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0419&amp;field1Txt=London" class="int">London</a>`,
  },
  {
    country: `UP`,
    coords: [48.3, 25.9333],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0125.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0125&amp;field1Txt=Czernowitz" class="int">Czernowitz 
                    (Chernivtsi)
                </a>`,
  },
  {
    country: `UP`,
    coords: [48.6833, 26.6],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0336.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0336&amp;field1Txt=Kamenez-Podolski" class="int">Kamenez-Podolski 
                    (Kamenec-Podol\skij)
                </a><ul><li>Kamieniec pod</li><li>Kamieniec Podolski</li><li>Kaminiec Podolski</li><li>Kaminiec podolski</li><li>Kaminiec-Podolski</li></ul>`,
  },
  {
    country: `UP`,
    coords: [50.4333, 30.5167],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0344.html?fieldTxt=pubPlaces&amp;startTxt=Ka-Kz&amp;current=place_0344&amp;field1Txt=Kieff" class="int">Kieff 
                    (Kiev)
                </a><ul><li>Kiew</li></ul>`,
  },
  {
    country: `UP`,
    coords: [49.8333, 24.0],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0401.html?fieldTxt=pubPlaces&amp;startTxt=La-Lz&amp;current=place_0401&amp;field1Txt=Lemberg" class="int">Lemberg 
                    (Lviv)
                </a><ul><li>Lemb</li></ul>`,
  },
  {
    country: `UP`,
    coords: [46.5, 30.7667],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0515.html?fieldTxt=pubPlaces&amp;startTxt=Oa-Oz&amp;current=place_0515&amp;field1Txt=Odessa" class="int">Odessa</a>`,
  },
  {
    country: `UP`,
    coords: [49.5833, 25.65],
    info: `Ukraine<br/><a href="content/database/indices/pubPlaces/pubplace/place_0667.html?fieldTxt=pubPlaces&amp;startTxt=Ta-Tz&amp;current=place_0667&amp;field1Txt=Tarnopol" class="int">Tarnopol 
                    (Ternopil)
                </a>`,
  },
  {
    country: `US`,
    coords: [42.358, -71.06],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0073.html?fieldTxt=pubPlaces&amp;startTxt=Ba-Bz&amp;current=place_0073&amp;field1Txt=Boston" class="int">Boston</a>`,
  },
  {
    country: `US`,
    coords: [41.85, -87.65],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0111.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0111&amp;field1Txt=Chicago" class="int">Chicago</a>`,
  },
  {
    country: `US`,
    coords: [39.15, -84.45],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0114.html?fieldTxt=pubPlaces&amp;startTxt=Ca-Cz&amp;current=place_0114&amp;field1Txt=Cincinnati &lt;Ohio&gt;" class="int">Cincinnati &lt;Ohio&gt;</a><ul><li>Cincinatti</li><li>Cincinnati</li></ul>`,
  },
  {
    country: `US`,
    coords: [43.0333, -87.9],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0461.html?fieldTxt=pubPlaces&amp;startTxt=Ma-Mz&amp;current=place_0461&amp;field1Txt=Milwaukee" class="int">Milwaukee</a>`,
  },
  {
    country: `US`,
    coords: [36.1667, -86.75],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0479.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0479&amp;field1Txt=Nashville, Tenn" class="int">Nashville, Tenn</a>`,
  },
  {
    country: `US`,
    coords: [40.7, -74.0],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0502.html?fieldTxt=pubPlaces&amp;startTxt=Na-Nz&amp;current=place_0502&amp;field1Txt=New York" class="int">New York</a><ul><li>New-York</li></ul>`,
  },
  {
    country: `US`,
    coords: [40.7167, -76.1],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0545.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0545&amp;field1Txt=Philadelphia &lt;Pa.&gt;" class="int">Philadelphia &lt;Pa.&gt;</a><ul><li>Philadelphia</li></ul>`,
  },
  {
    country: `US`,
    coords: [42.9667, -82.4167],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0550.html?fieldTxt=pubPlaces&amp;startTxt=Pa-Pz&amp;current=place_0550&amp;field1Txt=Port Huron &lt;Michigan&gt;" class="int">Port Huron &lt;Michigan&gt;</a><ul><li>Port Huron, Mich</li></ul>`,
  },
  {
    country: `US`,
    coords: [38.6167, -90.1833],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0644.html?fieldTxt=pubPlaces&amp;startTxt=Sa-Sz&amp;current=place_0644&amp;field1Txt=St. Louis, Mo" class="int">St. Louis, Mo</a><ul><li>St. Louis</li></ul>`,
  },
  {
    country: `US`,
    coords: [42.2833, -71.2833],
    info: `United States<br/><a href="content/database/indices/pubPlaces/pubplace/place_0724.html?fieldTxt=pubPlaces&amp;startTxt=Wa-Wz&amp;current=place_0724&amp;field1Txt=Wellesley, Mass" class="int">Wellesley, Mass</a>`,
  },
];

window.addEventListener("load", () => {
  map = L.map("map").setView([51.505, -0.09], 3);

  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution:
      '&#169; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
  }).addTo(map);

  const countries = markers.reduce((acc, marker) => {
    if (acc[marker.country] === undefined) {
      acc[marker.country] = [];
    }

    acc[marker.country].push(marker);

    return acc;
  }, {});

  for (const country in countries) {
    const group = L.markerClusterGroup();

    for (const marker of countries[country]) {
      group.addLayer(L.marker(marker.coords).bindPopup(marker.info));
    }

    map.addLayer(group);
  }

  document.getElementById("reset-map").addEventListener("click", function () {
    if (map) {
      map.setView([51.505, -0.09], 3);
    }
  });
});
