#case Rails.env
#when "development"

current_user = User.find_by(email: 'admin@test.com')

Staticpage.find_or_create_by(slug: 'home') do | page |
    page.title = "Pages Landing page"
    page.description = 'Homepage. do not delete!'
    page.blurb = "This is the homepage."
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Hello, this is the landing page for the Jesuit Online Necrology static pages. More content will go here.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'project') do | page |
    page.title = "The Project"
    page.description = 'About -> The Project'
    page.blurb = "All about the project"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The Jesuit Online Necrology project is a free, collaborative, and fully searchable database of personal information for the more than 32,000 men who died as members of the Society of Jesus between 1814 and 1970. This database provides the dates of birth, entry, and death for all the men who lived and died as Jesuits in the century and a half following the order’s restoration.</p>
    <p>Using the contents from the <a href="/pages/source"><em>Catalogus defunctorum in renata Societate Iesu</em></a>, this database allows for the searching of the men’s surnames and their places of birth, entry, and death. Users can filter search results through numerous facets -- such as places, date ranges, and the grade within the Society at the time of death. In addition, the aggregation of this personal information is expressed through different <a href="/pages/mapping">maps</a> and <a href="/pages/tableau">visualizations</a>. Explanations are available for the <a href="/pages/conventions">conventions</a> used in the original Catalogus as is <a href="/pages/tips">technical help</a> for exploring the database.</p>
    <p>The Jesuit Online Necrology is a collaborative effort among three Jesuit research centers and archives -- the Archivum Romanum Societatis Iesu, the Institute for Advanced Jesuit Studies at Boston College, and the Woodstock Theological Library at Georgetown University. Adrian Vaagenes of Georgetown and Seth Meehan of Boston College serve as the project’s editors.</p>
    <p>The Jesuit Online Necrology, launched in Summer 2021, was developed at Boston College Libraries. The database was built using open source technology and features a Ruby on Rails framework with a Blacklight discovery interface, PostgreSQL, and Solr index. All of the code used for this database is available in the Libraries’ GitHub repository. For a larger discussion of the technical aspects of the project and its visualizations, see our <a href="/pages/praxis">project praxis page</a>. Members of the development team at Boston College were: Ben Florin, Library Applications Developer; Jesse Martinez, Library Applications Developer; Matt Naglak, Digital Scholarship Librarian; and Allison Xu, <span style="font-family: Lato, sans-serif;">Data and Visualization Librarian</span>.</p>
    <p>The data collection phase began in August 2019, and was led and reviewed by Adrian Vaagenes, and transcribed by the following students and staff at Woodstock Theological Library: Alexander Kiley, Mitchell Fariss, Caitlin Frazier, Delia Cervantes, Emma Morris, and Isabel Rassel. Additional transcription work was done by graduates of the Institute for Advanced Jesuit Studies--Rebecca Hammock and Michael Infantine--while Cristiano Casalini and Claude Pavur, SJ, both of the Institute, helped with geographic terminology and Latin translation, respectively.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'source') do | page |
    page.title = "The Source"
    page.description = 'About -> The Source'
    page.blurb = "All about the source of the project"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>In 1972, Rufo Mendizábal, S.J., oversaw the publication of the <em>Catalogus defunctorum in renata Societate Iesu</em>, a necrology of the more than 32,000 men who died in the Society between 1814 and 1970. The catalogue was a compendium of several earlier efforts to collect and publish personal information of deceased Jesuits. Alexander Vivier, S.J., one of those earlier chroniclers, wrote of his catalogue in 1897, “I have no doubt that this register is going to be useful to those who write of the events of our lives; for here they will find notations of times, places, and persons attached, knowledge of which is of very great interest for the writing of history" [quotations in this section translated by Claude Pavur, S.J., Institute for Advanced Jesuit Studies].</p>
    <p>Mendizábal collected, corrected, and updated these various catalogues in a single volume “so,” as he explained, “that those who write or want to research our histories may not waste their time.” His volume presents the entries in chronological order, assigning to each a numerical value that corresponds to an alphabetized index of names.</p>
    <p>Those entries consist of a man’s surname and forename, his dates and places of birth, entrance to the Society, and death, and his grade in the Society.</p>
    <p>In an refreshing expression of modesty, Mendizábal confessed that he was not as “diligent” as his predecessors, “and thus I rightly assume that mistakes are not absent from this catalogue.” Among the changes he made was to translate the names of places “into the vernacular attending to today’s political configurations.” Many of those places are, of course, from a vernacular long out of date. Individuals’ forenames were all Latinized, a common tactic in the multilingual religious order.</p>
    <p>Mendizábal’s volume remains an indispensable resource for identifying information about individual Jesuits who died in the Society in the century and half following the order’s restoration in 1814. By providing a digital version of his work, the editors and developers of the Jesuit Online Necrology hope to make the contents of the Catalogus defunctorum more accessible but also interactive. Individual Jesuits will be more easily discoverable, through the database’s search capabilities. Further, the personal information for all of these individuals who dedicated their lives to the Society of Jesus are integrated, yielding an unprecedented macro-view of this unique group of men. Of those who lived and died in the Society following the order’s restoration, we can now explore what was the most common date of entry and the most common place of birth or death. We can determine what year saw the most admissions, the most births, and the most deaths among this group of men who died as Jesuits.</p>
    <p>Mendizábal recognized that in such a large and complicated work adjustments would be necessary, and he requested that any changes to his printed volume be submitted, thereby “sowing ‘trees that another age may enjoy.’” Likewise, the editors of the Jesuit Online Necrology welcome corrections, additions, suggestions for additional visualizations, and <a href="mailto:jesuitportal@bc.edu">general comments</a> (jesuitportal@bc.edu).</p>
    <p>This site contains explanations for the <a href="/pages/conventions">conventions</a> used in the original Catalogus as well as <a href="/pages/tips">technical help</a> for exploring the database.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'conventions') do | page |
    page.title = "The Conventions"
    page.description = 'About -> The Conventions'
    page.blurb = "All about the conventions used in the project"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Rufo Mendizábal, S.J., relied on a number of conventions in the publication of his <a href="/pages/source">Catalogus defunctorum</a>, and many of those conventions survive in the Jesuit Online Necrology.</p>
    <p>1. Dates</p>
    <ul>
    <li>All dates are entered as dd-mm-yyyy. </li>
    <li>Mendizábal listed entries in chronological order, by date of death, though gaps in the information were unavoidable. Such was the case with Jesuits who died closer to the start of the collection or who died during wars. Or who did not die, as was thought to be the case with Walter Ciszek, who was presumed to have died in a Russian prison during World War II, appeared in a 1947 necrology. Also, Mendizábal sought to reconcile the personal information for Jesuits in White Russia and other locations in the early nineteenth century where different date conventions were used.</li>
    <li>Efforts are made in this database to correct any remaining errors from the Catalogus. Please contact the editor’s with corrections (jesuitportal@bc.edu).</li>
    </ul>
    <p>2. Provinces</p>
    <ul>
    <li>The category of ‘Entry Province’ refers to the administrative entity where the men entered the Society. The term may refer to provinces, vice provinces, missions, or, on occasion, assistancies. In his necrology, Mendizábal listed the name of the province as it was called at the time of the individual Jesuit’s entrance, and this database keeps that convention.  </li>
    </ul>
    <p>3. Category</p>
    <ul>
    <li>Mendizábal assigned to each Jesuit his standing within the society: em (most eminent); ee (most excellent and most reverend); rp (very reverend father general); p (priest, even if he died as a scholastic or novice); s (scholastic); and c (temporal coadjutor). For some, the standing was unknown at the time of Mendizábal’s publication. </li>
    </ul>
    <p>4. Names</p>
    <ul>
    <li>Mendizábal noted that Jesuits often exchanged their given names for those expressing devotion (such as Joseph or Francis Xavier) or for aliases. If he determined the given name, he recorded both. Mendizábal also completed the compound names that he could by using the Society’s annual catalogues. He Latinized the names that he could, but not all had a Latin form (Abdallah or Leslie, Burke or Wallace). </li>
    <li>For more on the forename conventions, please see <a href="/pages/names">the list of names</a>.</li>
    </ul>
    <p>5. Cities/Countries</p>
    <ul>
    <li>Mendizábal exchanged the names of cities to reflect usage in 1972 -- Aachen, not Aix-la-Chapelle; Roma, not Rom, Rome, Rzym -- except in unfamiliar cases. For the latter, he used “the more common Western designation: So we say Le Caire, not Misr al-Qahira; Alexandrie, not al-Iskandariyya; Tripoli, not Trabulus….” Mendizábal’s locations do reflect specific moments even as the geography boundaries had changed and continued to do so. Helpfully, he made an index that provided the “ancient designations” with those used in 1972. He also provided regional designations in parentheses when they assisted in providing a city’s county, district, diocese, province, or state, and omitted them in more obvious cases -- such as New York, Milan, Paris.  He also used parentheses when information was unavailable.</li>
    </ul>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'names') do | page |
    page.title = "The Names"
    page.description = 'About -> The Names'
    page.blurb = "All about the names used in the necrology"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Mendizábal in his <a href="/pages/source"><em>Catalogus defunctorum</em></a>, Latinized and then abbreviated the forename for each deceased Jesuit. The list below provides those abbreviations and their full Latinized forms. Aloisius, for example, appeared in the Catalogus as Al-. </p>
    <p>The editors of the Jesuit Online Necrology welcome suggestions for the native or proper forenames of individual deceased Jesuits (jesuitportal@bc.edu).</p>
    <ul>
    <li>Aeg-idius</li>
    <li>Aem-ilius</li>
    <li>Al-oisius</li>
    <li>Alb-ertus</li>
    <li>Alex-ander</li>
    <li>Alfo-naus</li>
    <li>Alfr-edus</li>
    <li>Ambr-osius</li>
    <li>Andr-eas</li>
    <li>Ang-elus</li>
    <li>Ant-onius</li>
    <li>Archang-elus</li>
    <li>Arth-urus</li>
    <li>Balt-has(s)ar</li>
    <li>Bart-holomaeus</li>
    <li>Bas-ilius</li>
    <li>Bene-dictus</li>
    <li>Bern-ardus</li>
    <li>Bonav-entura</li>
    <li>Cael-estinus</li>
    <li>Cale-vanus</li>
    <li>Cam-illus</li>
    <li>Car-olus</li>
    <li>Casi-mirus</li>
    <li>Christ-ianus</li>
    <li>Chrys-ostomus</li>
    <li>Clem-ens</li>
    <li>Conr-adus</li>
    <li>Corn-elius</li>
    <li>Cypr-ianus</li>
    <li>Cyr-illus</li>
    <li>Dion-ysius</li>
    <li>Dom-inicus</li>
    <li>Edm-undus</li>
    <li>Edu-ardus</li>
    <li>Emm-anuel</li>
    <li>Ern-estus</li>
    <li>Eug-enius</li>
    <li>Eus-ebius</li>
    <li>Ferd-inandus</li>
    <li>Firm-inus</li>
    <li>Fr-anciscus</li>
    <li>F(ranciscus) X(av.)</li>
    <li>Fred-ericus</li>
    <li>Fulg-entius</li>
    <li>Gabr-iel</li>
    <li>Geor-gius</li>
    <li>Ger-ardus</li>
    <li>Greg-orius</li>
    <li>Gual-terus</li>
    <li>Gul-ielmus</li>
    <li>Gust-avus</li>
    <li>Hadr-ianus</li>
    <li>Hen-ricus</li>
    <li>Hier-onymus</li>
    <li>Hil-arius</li>
    <li>Hipp-olytus</li>
    <li>Hub-ertus</li>
    <li>Humb-ertus</li>
    <li>Hya-cinthus</li>
    <li>Iac-obus</li>
    <li>Ign-atius</li>
    <li>Idelfo-nsus</li>
    <li>Io-annes</li>
    <li>Io-B(apitsta)</li>
    <li>Io-Nep(omucenus)</li>
    <li>Ioac-him</li>
    <li>Ios-ephus</li>
    <li>Isid-orus</li>
    <li>Ladis-laus</li>
    <li>Laur-entius</li>
    <li>Laz-arus</li>
    <li>Leop-oldus</li>
    <li>Lud-ovicus</li>
    <li>Mart-inus</li>
    <li>Maur-itius</li>
    <li>Max-imilianus</li>
    <li>Mich-ael</li>
    <li>Narc-issus</li>
    <li>Nico-laus</li>
    <li>Norb-ertus</li>
    <li>Pasc-halis</li>
    <li>Patr-icius</li>
    <li>Pau-lus</li>
    <li>Pet-rus</li>
    <li>Phil-ippus</li>
    <li>Raim-undus</li>
    <li>Raph-ael</li>
    <li>Ric-ardus</li>
    <li>Rob-ertus</li>
    <li>Roc-hus</li>
    <li>Rup-ertus</li>
    <li>Salv-ator</li>
    <li>Seb-astianus</li>
    <li>Stan-islaus</li>
    <li>Steph-anus</li>
    <li>Theod-orus</li>
    <li>Thom-as</li>
    <li>Tim-otheus</li>
    <li>Val-entinus</li>
    <li>Vinc-entius</li>
    <li>Wenc-eslaus</li>
    <li>Xav-erius</li>
    <li>X (= Christo)phorus</li>
    <li>Zach-arias</li>
    </ul>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'tips') do | page |
    page.title = "Searching Tips/ FAQ"
    page.description = 'Explore DB -> Searching Tips/ FAQ'
    page.blurb = "Searching Tips/ FAQ"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Searching Tips / FAQ.</p>
    page is in development during the beta launch of the Jesuit Online Necrology site. Have questions or comments? Please contact the site editors at jesuitportal@bc.edu</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'mapping') do | page |
    page.title = "Mapping the Necrologies"
    page.description = 'Data Viz -> Mapping Necrologies'
    page.blurb = "Mapping the Necrologies"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p><strong>Mapping the Necrologies</strong></p>
    <p>The information pertaining to the births, deaths, and places of entry into the Jesuit order that are available in the <em>Catalogus defunctorum in renata Societate Iesu</em> make it possible for us to spatially visualize and explore the lives of many of these individuals. The following exploratory interactive maps offer a variety of ways to search, filter, and inspect this dataset based on different criteria, offering a different way of engaging with the database and, hopefully, bringing a different perspective to questions that might be asked. Each map is followed by a contextual statement offering a bit more information about its creation and any intrinsic problems related to the dataset used.</p>
    <ul>
    <li><a title="Jesuit Places Map" href="/pages/jesuit-places">Places Map</a>: The Necrology Catalogues contain more than 22,000 individual locations where Jesuits were born or died. This map allows you to quickly search for Jesuits associated with individual locations or simply see how they were spread across the world.</li>
    </ul>
    <p style="padding-left: 40px;"><em>Possible Question</em>: How many Jesuits in the Necrologies were born in Boston, Massachusetts?</p>
    <ul>
    <li><a title="Link to map filtering by place of entry" href="/pages/jesuit-entry">Provinces Map</a>: This map allows you to quickly visualize the lives of Jesuits who took their vows in specific provinces, vice-provinces, or missions, with the ability to filter by location and by the year of interest.</li>
    </ul>
    <p style="padding-left: 40px;"><em>Possible Question</em>: Where and when were all the Jesuit’s born who took their vows in the province of Californiae (California) in 1845?</p>
    <ul>
    <li><a title="Link to map filtering by individual Jesuits" href="/pages/jesuit-lives">Jesuit Lives Map</a>: This map allows you to search by a Jesuit’s last name and visualize his life by his birthplace, place of entry, and place of death.</li>
    </ul>
    <p style="padding-left: 40px;"><em>Possible Question</em>: What does the life-line of Robertus Turnine look like?</p>
    <p> </p>
    <p>Each map was created using LeafletJS and a variety of plugins. See the individual maps and our <a href="/pages/praxis">project praxis page</a> for more details.</p>
    <p>Interested in a mapping question involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'tableau') do | page |
    page.title = "Tableau"
    page.description = 'Data Viz -> Tableau'
    page.blurb = "Tableau visualizations"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Tableau visualization contains interactive visualizations such as charts, graphs, heatmaps to highlight some interesting stories from the Necrology Catalogues data. The visualizations help quantify the trends within the data and show how society has been changing over time. In addition, the visualization also plays a role to help show a more complete picture of these individual Jesuits. For example, you can see the average age distribution of the Jesuits when they enter society, the number of admissions over time, etc. </p>
    <p style="padding-left: 40px;"><a href="/pages/bar-chart">Overall Admission/Last Vow Trend Over Time</a>: the bar graphs show the distribution of the number of admissions and last vows over time. What year saw the most admissions? What year saw the most last vows?</p>
    <p style="padding-left: 40px;"><a href="/pages/heat-map">Timetable:</a> The heatmap shows which day saw the most admission and what day saw the most last vows over time.</p>
    <p style="padding-left: 40px;"><a href="/pages/dot-chart">Average Entry age by Jesuits Title:</a> The average age of entering the society varies by Jesuits' title they hold. This visualization shows the average age of entry to the society by Jesuits Title.</p>
    <p style="padding-left: 40px;"><a href="/pages/combine-chart">The average age of entry to the Society by Province:</a> this visualization shows the change of the average age of entry to the Society over time.</p>
    <p>Each visualization was created using the data visualization tool Tableau. See the individual visualizations and our <a href="/pages/praxis">project praxis page</a> for more details.</p>
    <p>Interested in a visualization involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'team') do | page |
    page.title = "Team Members"
    page.description = 'Project Team -> Team Members'
    page.blurb = "Team Members"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The Jesuit Online Necrology is a multi-year, collaborative effort between <span style="font-size: 16px;">the Archivum Romanum Societatis Iesu, the Institute for Advanced Jesuit Studies at Boston College, and the Woodstock Theological Library at Georgetown University. The editors are thankful and appreciative of all the hard work undertaken by students, faculty, and staff across the partnership institutions.</span></p>
    <p><em>Project Editors</em></p>
    <ul>
    <li>Seth Meehan, Institute for Advanced Jesuit Studies, Boston College</li>
    <li>Adrian Vaagenes, Woodstock Theological Library, Georgetown</li>
    </ul>
    <p><em>Development and Visualization Team (Boston College)</em></p>
    <ul>
    <li>Ben Florin, Library Applications Developer</li>
    <li>Jesse Martinez, Library Applications Developer</li>
    <li>Matt Naglak, Digital Scholarship Librarian</li>
    <li>Allison Xu, Data and Visualization Librarian</li>
    </ul>
    <p><em>Data Collection Team (Woodstock Theological Library)</em></p>
    <ul>
    <li>Delia Cervantes</li>
    <li>Mitchell Fariss</li>
    <li>Caitlin Frazier</li>
    <li>Alexander Kiley</li>
    <li>Emma Morris</li>
    <li>Isabel Rassel</li>
    </ul>
    <p><em>Data Collection Team (IAJS)</em></p>
    <ul>
    <li>Michael Infantine</li>
    <li>Rebecca Hammock</li>
    </ul>
    <p><em>Research Assistance</em></p>
    <ul>
    <li>Cristiano Casalini (IAJS)</li>
    <li>Claude Pavur, SJ (IAJS)</li>
    </ul>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'praxis') do | page |
    page.title = "Praxis"
    page.description = 'Project Team -> Praxis'
    page.blurb = "Praxis"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p><strong>Application Framework</strong></p>
    <p>The Jesuit Online Necrology, launched in Summer 2021, was developed at Boston College Libraries. The database was built using open source technology and features a Ruby on Rails framework with a Blacklight discovery interface, PostgreSQL, and Solr index. All of the code used for this database is available in the <a title="Github repository" href="https://github.com/BCDigSchol/jesuit-lives" target="_blank" rel="noopener">Libraries’ GitHub repository.</a> </p>
    <p><strong>Visualizations</strong></p>
    <p>One goal of the Jesuit Lives Project is to experiment with multimodal ways to delve into the more than 32,000 individuals who appear in the <em>Catalogus defunctorum in renata Societate Iesu.</em> While the main searchable application is an invaluable resource, the visualizations offer alternate pathways to explore these lives and to ask and answer different kinds of questions. Two approaches are taken here: mapping visualizations are available that allow you to search or filter by different individual characteristics of a Jesuit; a variety of of dashboards created using the Tableau platform, meanwhile, ask specific questions about the statistics surrounding the recorded lives of these Jesuit missionaries.</p>
    <p style="padding-left: 40px;"><em>Mapping</em></p>
    <p style="padding-left: 40px;">The interactive maps seen in this project were created through the use of the open-source <a title="Link to Leaflet home page" href="https://leafletjs.com" target="_blank" rel="noopener">LeafletJS javascript library</a>.  The cleaned <em>Catalogus defunctorum</em> datasets, including the data associated with individauls, with provinces, and with specific locations, were transformed into .json files and run through python scripts in order to integrate the appropriate spatial data and reorganize the files for use with Leaflet. Detailed information on the steps involved for each map can be found in the project Github.</p>
    <p style="padding-left: 40px;">In addition to the standard LeafletJS library, a variety of plugins were used to expand the functionality of the maps. The project team thanks the creators of these plugins and recognizes them here.</p>
    <ul>
    <li style="list-style-type: none;">
    <ul>
    <li><a href="https://kartena.github.io/Leaflet.Pancontrol/" target="_blank" rel="noopener">Leaflet.Pancontrol</a>: a simple panning controller for leaflet that allows maps to be more accessible to users with screenreaders (by kartena)</li>
    <li><a href="https://labs.easyblog.it/maps/leaflet-search/" target="_blank" rel="noopener">Leaflet.Control.Search</a>: A Leaflet Control for search markers/features location by attribute and much more (by Stephano Cudini)</li>
    <li><a href="https://github.com/Leaflet/Leaflet.markercluster" target="_blank" rel="noopener">Leaflet.markercluster</a>: Provides animated marker clustering functionality, particularly useful when there is a large amount of data visible on a map at the same time (by yukunzeng)</li>
    <li><a href="https://refreshless.com/nouislider/" target="_blank" rel="noopener">noUISlider</a>: a lightweight javascript range slider with touch support (MIT)</li>
    <li><a href="https://github.com/ewoken/Leaflet.MovingMarker" target="_blank" rel="noopener">Leaflet.movingmarker</a>:  A Leaflet plug-in to create moving marker. Very useful to represent transportations or other movable things (by ewoken)</li>
    <li><a href="https://github.com/torfsen/leaflet.zoomhome">Leaflet.zoomHome</a>: Used to create the home button, along with FontAwesome (by torfson).</li>
    </ul>
    </li>
    </ul>
    <p style="padding-left: 40px;">The jQuery and wNumb javascript libraries were also utilized for the Jesuit Lives map.</p>
    <p style="padding-left: 40px;"><em>Tableau</em></p>
    <p style="padding-left: 40px;">The interactive data visualizations seen in this project were created using Tableau Desktop Version 2021.1. Tableau Desktop is one of the Tableau developer tools which is used for development such as the creation of charts, dashboards, report generation. The project data sources were imported into Tableau with Google sheets connector, the data relationship was defined based on matching data fields in Tableau, visualizations were designed in Tableau desktop. All the final visualization were published to Tableau public which is an online platform which allows user to publicly share and explore data visualizations online, the project set google sheets as a data source in Tableau Public and it will keep the visualization synced with the sheet updates. </p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'contact') do | page |
    page.title = "Contact us"
    page.description = 'Project Team -> Contact Us'
    page.blurb = "How to contact the project"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The editors of the Jesuit Online Necrology welcome comments, corrections to records, suggestions for new content or features, and general feedback from users.</p>
    <p>Email for the project's editors: <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a></p>
    <p>Learn more about the project’s institutional partners at</p>
    <ul>
    <li>Archivum Romanum Societatis Iesu: <a href="http://sjweb.info/arsi/">http://sjweb.info/arsi/</a></li>
    <li>Institute for Advanced Jesuit Studies at Boston College: <a href="https://www.bc.edu/iajs">https://www.bc.edu/iajs</a></li>
    <li>Woodstock Theological Library: <a style="font-size: 1rem;" href="https://www.library.georgetown.edu/woodstock">https://www.library.georgetown.edu/woodstock</a></li>
    </ul>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'jesuit-lives') do | page |
    page.title = "Jesuit Lives Map"
    page.description = 'Map visualizing the movement of Jesuits over the course of their lives'
    page.blurb = "Map visualizing the movement of Jesuits over the course of their lives"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p><iframe title="Jesuit Lives Map" src="https://mnaglak.github.io/JesuitLives/examples/birthDeathMovementProvincesExpanded.html" width="1100" height="500" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" align="center"></iframe><span id="docs-internal-guid-f596cbd6-7fff-3acf-2cda-839f1e0f46ad">The above map allows you to search the <em>Catalogus defunctorum in renata Societate Iesu</em> by a Jesuit's last name. When a match is found, the "life-line" of the Jesuit appears, showing their movement across the world from birth to their place of entry to their place of death. If a Jesuit within the Jesuit Online Necrology does not appear when searched for, it is likely that his spatial data is incomplete, in that the spatial coordinates for one of these locations (birth, entrance place, death) is unknown. Clicking on a Jesuit’s marker or life-line will open a popup box with further details, as well as a link to his database entry. The export data button allows you to export they information about the Jesuit as a .json txt file.</span></p>
    <p>This map was created using the open-source javascript library <a title="Link to Leaflet home page" href="https://leafletjs.com/" target="_blank" rel="noopener">LeafletJS</a> and a several plugins, including <a title="Link to Leaflet.Pancontrol plugin" href="https://kartena.github.io/Leaflet.Pancontrol/" target="_blank" rel="noopener">Leaflet.Pancontrol </a>and <a href="https://labs.easyblog.it/maps/leaflet-search/">Leaflet.Control.Search</a>. See our <a href="/pages/praxis">project praxis page</a> for more details, or <a href="/pages/mapping">return to the map list</a>. </p>
    <p>Interested in a mapping question involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'jesuit-places') do | page |
    page.title = "Jesuit Places Map"
    page.description = 'Page presenting the Jesuit Places mapping visualization'
    page.blurb = "Visualize the places where Jesuits were born, took their vows, and died"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p><iframe title="Jesuit Places Map" src="https://mnaglak.github.io/JesuitLives/examples/placesSearch.html" width="1100" height="500" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" align="center"></iframe></p>
    <p>The above map allows the user to explore the wide variety of locations around the world mentioned in the <em>Catalogus defunctorum.</em> For each location, information about which Jesuits are associated with it is given in a popup box. In some cases, locations are repeated if they are listed in different ways within the dataset (e.g. Roma vs Roma (Italy) ). Zooming in within a particular cluster will make these cases clear.</p>
    <p>This map was created using the open-source javascript library <a title="Link to Leaflet home page" href="https://leafletjs.com" target="_blank" rel="noopener">LeafletJS</a> and a several plugins, including <a title="Link to Leaflet.Pancontrol plugin" href="https://kartena.github.io/Leaflet.Pancontrol/" target="_blank" rel="noopener">Leaflet.Pancontrol</a>, <a title="Link to Leaflet Markercluster plugin" href="https://github.com/Leaflet/Leaflet.markercluster" target="_blank" rel="noopener">Leaflet.MarkerCluster</a>, and <a href="https://labs.easyblog.it/maps/leaflet-search/">Leaflet.Control.Search</a>. See our <a href="/pages/praxis">project praxis page</a> for more details, or <a href="/pages/mapping">return to the map list</a>.</p>
    <p>Interested in a mapping question involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'jesuit-entry') do | page |
    page.title = "Place of Entry Map"
    page.description = 'Map allowing for the filtering of Jesuits by entrance province and year'
    page.blurb = "Map allowing for the filtering of Jesuits by entrance location and year"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p><iframe title="Jesuit Places Map" src="https://mnaglak.github.io/JesuitLives/examples/filteredLives.html" width="1100" height="500" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" align="center"></iframe></p>
    <p>The above map allows the user to filter the lives of Jesuits by the location in which they originally joined the order. Further narrowing can take place by the individual year. Blue lines indicate the movement of a Jesuit from his birthplace to his place of entry, while black lines indicate the movement between the place of entry and place of death.  Each relationship type is able to be turned on or off using the filtering menu in the top-right corner when a search is active. Filtered data is exportable as a .json text file. If a Jesuit within the dataset does not appear for a particular province, it is likely that the spatial coordinates for his birthplace or place of death is not known. Similarly, the precise spatial coordinates for some places listed in the <a href="/staticpages/12/edit"><em>Catalogus defunctorum</em></a> are unknown. Clicking on a Jesuit’s life-line will open a popup box with further details, as well as a link to his database entry.</p>
    <p>This map was created using the open-source javascript library <a title="Link to Leaflet home page" href="https://leafletjs.com" target="_blank" rel="noopener">LeafletJS</a> and a several plugins, including <a title="Link to Leaflet.Pancontrol plugin" href="https://kartena.github.io/Leaflet.Pancontrol/" target="_blank" rel="noopener">Leaflet.Pancontrol</a>, <a title="Link to Leaflet Markercluster plugin" href="https://github.com/Leaflet/Leaflet.markercluster" target="_blank" rel="noopener">Leaflet.MarkerCluster</a>, and <a href="https://labs.easyblog.it/maps/leaflet-search/">Leaflet.Control.Search</a>. See our <a href="/pages/praxis">project praxis page</a> for more details, or <a href="/pages/mapping">return to the map list</a>.</p>
    <p>Interested in a mapping question involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'bar-chart') do | page |
    page.title = "What year saw the most admissions/last vows?"
    page.description = 'Page presenting the Jesuit admission and last vow visualization'
    page.blurb = "Visualize the number of jesuits' admissions and last vows"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The <a href="https://public.tableau.com/profile/boston.college.libraries.digital.scholarship#!/vizhome/Barcharts_16215767786170/Dashboard2?publish=yes">bar graphs</a> appearing here show the change in the number of admissions and final vows over time from 1720 to 1900. The year 1900 was chosen as an arbitrary cut-off point in order to more accurately represent the fact that years after this point are missing information for Jesuits who had not yet passed away by the end of our dataset in 1970.</p>
    <p> </p>
    <p><iframe style="width: 1044px; height: 552px;" src="https://public.tableau.com/views/Barcharts_16215767786170/Dashboard2?:language=en&amp;:display_count=y&amp;publish=yes&amp;:origin=viz_share_link?:showVizHome=no&amp;:embed=true" width="908" height="482"></iframe></p>
    <p>Interested in a visualization involving the Jesuit Online Necrology dataset? Feel free to contact us at <a style="background-color: #ffffff;" href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'dot-chart') do | page |
    page.title = "Average Age of Entry to the Society by Jesuits Title"
    page.description = 'Visualize the average age of entry to the Society by Titles'
    page.blurb = "Visualize the average age of entry to the Society by Titles"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The visualization shows the average age of entry to the Society by Jesuits Title. The average age varies by Jesuits’ title they hold. For example, the average age for priests to enter the Society is 22, temporal coadjutor entered the Society at the average age of 26.</p>
    <p><iframe src="https://public.tableau.com/views/Combinechart2/Dashboard4?:language=en&amp;:display_count=y&amp;publish=yes&amp;:origin=viz_share_link                ?:showVizHome=no&amp;:embed=true" width="1000" height="1000"></iframe></p>
    <p>Interested in a visualization involving the Jesuit Online Necrology dataset? Feel free to contact us at <a style="background-color: #ffffff;" href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'heat-map') do | page |
    page.title = "What day saw the most admission? What day saw the most last vows?"
    page.description = 'visualizes the number of admissions and last vow by date'
    page.blurb = "Total number of admissions and last vow by date"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The <a href="https://public.tableau.com/profile/boston.college.libraries.digital.scholarship#!/vizhome/HeatMap_16216079429690/Dashboard3">heat map</a> on the top visualizes the number of admissions in a timetable. The color of the tiles is representative of the number of admissions, the lighter color indicates a lower number of admissions on that day, whereas the darker color indicates a high number. September 7 had the most admissions in 1909. Similarly, the heat map on the bottom visualizes the number of final vows made in a timetable, it is shown that 14,699 Jesuits made their final vows on Feb 2nd.</p>
    <p><iframe src="https://public.tableau.com/views/HeatMap_16216079429690/Dashboard3?:language=en&amp;:retry=yes&amp;:display_count=y&amp;:origin=viz_share_link?:showVizHome=no&amp;:embed=true" width="1000" height="1555"></iframe></p>
    <p>Interested in a visualization involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'combine-chart') do | page |
    page.title = "Average age of entry to the Society by province"
    page.description = 'Average age of the Jesuits entering into the Society'
    page.blurb = "visualize age of the Jesuits entering into the Society by province"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>The visualization shows the age of the Jesuits entering into the Society, each data point represents an individual Jesuit, the line chart shows the average age of entry to the Society from 1740 to 1960 for those who had passed away by 1970. Use the filter on the right to check a particular province, eg. Roma.</p>
    <p> </p>
    <p><iframe src="https://public.tableau.com/views/Combinechart_16216081410060/Dashboard1?:language=en&amp;:display_count=y&amp;publish=yes&amp;:origin=viz_share_link?:showVizHome=no&amp;:embed=true" width="1000" height="655"></iframe></p>
    <p>Interested in a visualization involving the Jesuit Online Necrology dataset? Feel free to contact us at <a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a>.</p>
    PAGE_BODY
end

#end