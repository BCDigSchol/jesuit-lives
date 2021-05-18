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
    <p dir="ltr">The Jesuit Online Necrology project is a free, collaborative, and fully searchable database of personal information for the more than 32,000 men who died as members of the Society of Jesus between 1814 and 1970. This database provides the dates of birth, entry, and death for all the men who lived and died as Jesuits in the century and a half following the order’s restoration.</p>
    <p dir="ltr">Using the contents from the <a href="#"><em>Catalogus defunctorum in renata Societate Iesu</em></a>, this database allows for the searching of the men’s surnames and their places of birth, entry, and death. Users can filter search results through numerous facets -- such as places, date ranges, and the grade within the Society at the time of death. In addition, the aggregation of this personal information is expressed through different <a href="/pages/mapping">maps</a> and <a href="/pages/tableau">visualizations</a>. Explanations are available for the <a href="/pages/conventions">conventions</a> used in the original Catalogus as is <a href="/pages/tips">technical help</a> for exploring the database.</p>
    <p dir="ltr">The Jesuit Online Necrology is a collaborative effort among three Jesuit research centers and archives -- the Archivum Romanum Societatis Iesu, the Institute for Advanced Jesuit Studies at Boston College, and the Woodstock Theological Library at Georgetown University. Adrian Vaagenes of Georgetown and Seth Meehan of Boston College serve as the project’s editors.</p>
    <p dir="ltr">The Jesuit Online Necrology, launched in ____ 2021, was developed at Boston College Libraries. The database was built using open source technology and features [[a Ruby on Rails framework with a Blacklight discovery interface, PostgreSQL, and Solr index.]] All of the code used for this database is available in the Libraries’ GitHub repository. Members of the development team were: Ben Florin, [[title]]; Jesse Martinez, Library Applications Developer; Matt Naglak, [[title]]; and Allison Xu [[title]].</p>
    <p dir="ltr">The data collection phase began in August 2019, and was led and reviewed by Adrian Vaagenes, and transcribed by the following students and staff at Woodstock Theological Library: Alexander Kiley, Mitchell Fariss, Caitlin Frazier, Delia Cervantes, Emma Morris, and Isabel Rassel. Additional transcription work was done by graduates of the Institute for Advanced Jesuit Studies--Rebecca Hammock and Michael Infantine--while Cristiano Casalini and Claude Pavur, SJ, both of the Institute, helped with geographic terminology and Latin translation, respectively.</p>
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
    <p dir="ltr">In 1972, Rufo Mendizábal, S.J., oversaw the publication of the Catalogus defunctorum in renata Societate Iesu, a necrology of the more than 32,000 men who died in the Society between 1814 and 1970. The catalogue was a compendium of several earlier efforts to collect and publish personal information of deceased Jesuits. Alexander Vivier, S.J., one of those earlier chroniclers, wrote of his catalogue in 1897, “I have no doubt that this register is going to be useful to those who write of the events of our lives; for here they will find notations of times, places, and persons attached, knowledge of which is of very great interest for the writing of history.”</p>
    <p dir="ltr">Mendizábal collected, corrected, and updated these various catalogues in a single volume “so,” as he explained, “that those who write or want to research our histories may not waste their time.” His volume presents the entries in chronological order, assigning to each a numerical value that corresponds to an alphabetized index of names.</p>
    <p dir="ltr">Those entries consist of a man’s surname and forename, his dates and places of birth, entrance to the Society, and death, and his grade in the Society.</p>
    <p dir="ltr">In an refreshing expression of modesty, Mendizábal confessed that he was not as “diligent” as his predecessors, “and thus I rightly assume that mistakes are not absent from this catalogue.” Among the changes he made was to translate the names of places “into the vernacular attending to today’s political configurations.” Many of those places are, of course, from a vernacular long out of date. Individuals’ forenames were all Latinized, a common tactic in the multilingual religious order.</p>
    <p dir="ltr">Mendizábal’s volume remains an indispensable resource for identifying information about individual Jesuits who died in the Society in the century and half following the order’s restoration in 1814. By providing a digital version of his work, the editors and developers of the Jesuit Online Necrology hope to make the contents of the Catalogus defunctorum more accessible but also interactive. Individual Jesuits will be more easily discoverable, through the database’s search capabilities. Further, the personal information for all of these individuals who dedicated their lives to the Society of Jesus are integrated, yielding an unprecedented macro-view of this unique group of men. Of those who lived and died in the Society following the order’s restoration, we can now explore what was the most common date of entry and the most common place of birth or death. We can determine what year saw the most admissions, the most births, and the most deaths among this group of men who died as Jesuits.</p>
    <p dir="ltr">Mendizábal recognized that in such a large and complicated work adjustments would be necessary, and he requested that any changes to his printed volume be submitted, thereby “sowing ‘trees that another age may enjoy.’” Likewise, the editors of the Jesuit Online Necrology welcome corrections, additions, suggestions for additional visualizations, and <a href="mailto:jesuitportal@bc.edu">general comments</a> (jesuitportal@bc.edu).</p>
    <p dir="ltr">This site contains explanations for the <a href="/pages/conventions">conventions</a> used in the original Catalogus as well as <a href="/pages/tips">technical help</a> for exploring the database.</p>
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
    <p dir="ltr">Rufo Mendizábal, S.J., relied on a number of conventions in the publication of his <em><a href="#">Catalogus defunctorum</a></em>, and many of those conventions survive in the Jesuit Online Necrology.</p>
    <p dir="ltr">1. Chronology</p>
    <p dir="ltr">-- Mendizábal listed entries in chronological order, by date of death, though gaps in the information were unavoidable. Such was the case with Jesuits who died closer to the start of the collection or who died during wars. Or who did not die, as was thought to be the case with Walter Ciszek, who was presumed to have died in a Russian prison during World War II, appeared in a 1947 necrology.</p>
    <p dir="ltr">2. Category</p>
    <p dir="ltr">-- Mendizábal assigned to each Jesuit his standing within the society: em (most eminent); ee (most excellent and most reverend); rp (very reverend father general); p (priest, even if he died as a scholastic or novice); s (scholastic); and c (temporal coadjutor). For some, the standing was unknown at the time of Mendizábal’s publication.</p>
    <p dir="ltr">3. Names</p>
    <p dir="ltr">-- Mendizábal noted that Jesuits often exchanged their given names for those expressing devotion (such as Joseph or Francis Xavier) or for aliases. If he determined the given name, he recorded both. Mendizábal also completed the compound names that he could by using the Society’s annual catalogues. He Latinized the names that he could, but not all had a Latin form (Abdallah or Leslie, Burke or Wallace). </p>
    <p dir="ltr">-- For more on the forename conventions, please see the list of <a href="/pages/names">names</a>.</p>
    <p dir="ltr">4. Years</p>
    <p dir="ltr">-- Mendizábal sought to reconcile the personal information for Jesuits in White Russia and other locations in the early nineteenth century where different date conventions were used.</p>
    <p dir="ltr">5. Cities/Countries</p>
    <p dir="ltr">-- Mendizábal exchanged the names of cities to reflect usage in 1972 -- Aachen, not Aix-la-Chapelle; Roma, not Rom, Rome, Rzym -- except in unfamiliar cases. For the latter, he used “the more common Western designation: So we say Le Caire, not Misr al-Qahira; Alexandrie, not al-Iskandariyya; Tripoli, not Trabulus….” Mendizábal’s locations do reflect specific moments even as the geography boundaries had changed and continued to do so. Helpfully, he made an index that provided the “ancient designations” with those used in 1972. He also provided regional designations in parentheses when they assisted in providing a city’s county, district, diocese, province, or state, and omitted them in more obvious cases -- such as New York, Milan, Paris.  He also used parentheses when information was unavailable</p>
    <p dir="ltr">6. Provinces</p>
    <p dir="ltr">-- Mendizábal listed, for each Jesuit, the name of the province as it was called at the time of his entrance.</p>
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
    <p dir="ltr">Mendizábal in his <a href="#"><em>Catalogus defunctorum</em></a>, Latinized and then abbreviated the forename for each deceased Jesuit. The list below provides those abbreviations and their full Latinized forms. Aloisius, for example, appeared in the Catalogus as Al-. </p>
    <p dir="ltr">The editors of the Jesuit Online Necrology welcome suggestions for the native or proper forenames of individual deceased Jesuits (jesuitportal@bc.edu).</p>
    <ul>
        <li dir="ltr">Aeg-idius</li>
        <li dir="ltr">Aem-ilius</li>
        <li dir="ltr">Al-oisius</li>
        <li dir="ltr">Alb-ertus</li>
        <li dir="ltr">Alex-ander</li>
        <li dir="ltr">Alfo-naus</li>
        <li dir="ltr">Alfr-edus</li>
        <li dir="ltr">Ambr-osius</li>
        <li dir="ltr">Andr-eas</li>
        <li dir="ltr">Ang-elus</li>
        <li dir="ltr">Ant-onius</li>
        <li dir="ltr">Archang-elus</li>
        <li dir="ltr">Arth-urus</li>
        <li dir="ltr">Balt-has(s)ar</li>
        <li dir="ltr">Bart-holomaeus</li>
        <li dir="ltr">Bas-ilius</li>
        <li dir="ltr">Bene-dictus</li>
        <li dir="ltr">Bern-ardus</li>
        <li dir="ltr">Bonav-entura</li>
        <li dir="ltr">Cael-estinus</li>
        <li dir="ltr">Cale-vanus</li>
        <li dir="ltr">Cam-illus</li>
        <li dir="ltr">Car-olus</li>
        <li dir="ltr">Casi-mirus</li>
        <li dir="ltr">Christ-ianus</li>
        <li dir="ltr">Chrys-ostomus</li>
        <li dir="ltr">Clem-ens</li>
        <li dir="ltr">Conr-adus</li>
        <li dir="ltr">Corn-elius</li>
        <li dir="ltr">Cypr-ianus</li>
        <li dir="ltr">Cyr-illus</li>
        <li dir="ltr">Dion-ysius</li>
        <li dir="ltr">Dom-inicus</li>
        <li dir="ltr">Edm-undus</li>
        <li dir="ltr">Edu-ardus</li>
        <li dir="ltr">Emm-anuel</li>
        <li dir="ltr">Ern-estus</li>
        <li dir="ltr">Eug-enius</li>
        <li dir="ltr">Eus-ebius</li>
        <li dir="ltr">Ferd-inandus</li>
        <li dir="ltr">Firm-inus</li>
        <li dir="ltr">Fr-anciscus</li>
        <li dir="ltr">F(ranciscus) X(av.)</li>
        <li dir="ltr">Fred-ericus</li>
        <li dir="ltr">Fulg-entius</li>
        <li dir="ltr">Gabr-iel</li>
        <li dir="ltr">Geor-gius</li>
        <li dir="ltr">Ger-ardus</li>
        <li dir="ltr">Greg-orius</li>
        <li dir="ltr">Gual-terus</li>
        <li dir="ltr">Gul-ielmus</li>
        <li dir="ltr">Gust-avus</li>
        <li dir="ltr">Hadr-ianus</li>
        <li dir="ltr">Hen-ricus</li>
        <li dir="ltr">Hier-onymus</li>
        <li dir="ltr">Hil-arius</li>
        <li dir="ltr">Hipp-olytus</li>
        <li dir="ltr">Hub-ertus</li>
        <li dir="ltr">Humb-ertus</li>
        <li dir="ltr">Hya-cinthus</li>
        <li dir="ltr">Iac-obus</li>
        <li dir="ltr">Ign-atius</li>
        <li dir="ltr">Idelfo-nsus</li>
        <li dir="ltr">Io-annes</li>
        <li dir="ltr">Io-B(apitsta)</li>
        <li dir="ltr">Io-Nep(omucenus)</li>
        <li dir="ltr">Ioac-him</li>
        <li dir="ltr">Ios-ephus</li>
        <li dir="ltr">Isid-orus</li>
        <li dir="ltr">Ladis-laus</li>
        <li dir="ltr">Laur-entius</li>
        <li dir="ltr">Laz-arus</li>
        <li dir="ltr">Leop-oldus</li>
        <li dir="ltr">Lud-ovicus</li>
        <li dir="ltr">Mart-inus</li>
        <li dir="ltr">Maur-itius</li>
        <li dir="ltr">Max-imilianus</li>
        <li dir="ltr">Mich-ael</li>
        <li dir="ltr">Narc-issus</li>
        <li dir="ltr">Nico-laus</li>
        <li dir="ltr">Norb-ertus</li>
        <li dir="ltr">Pasc-halis</li>
        <li dir="ltr">Patr-icius</li>
        <li dir="ltr">Pau-lus</li>
        <li dir="ltr">Pet-rus</li>
        <li dir="ltr">Phil-ippus</li>
        <li dir="ltr">Raim-undus</li>
        <li dir="ltr">Raph-ael</li>
        <li dir="ltr">Ric-ardus</li>
        <li dir="ltr">Rob-ertus</li>
        <li dir="ltr">Roc-hus</li>
        <li dir="ltr">Rup-ertus</li>
        <li dir="ltr">Salv-ator</li>
        <li dir="ltr">Seb-astianus</li>
        <li dir="ltr">Stan-islaus</li>
        <li dir="ltr">Steph-anus</li>
        <li dir="ltr">Theod-orus</li>
        <li dir="ltr">Thom-as</li>
        <li dir="ltr">Tim-otheus</li>
        <li dir="ltr">Val-entinus</li>
        <li dir="ltr">Vinc-entius</li>
        <li dir="ltr">Wenc-eslaus</li>
        <li dir="ltr">Xav-erius</li>
        <li dir="ltr">X (= Christo)phorus</li>
        <li dir="ltr">Zach-arias</li>
    </ul>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'browse-database') do | page |
    page.title = "Browse the Database"
    page.description = 'Explore DB -> Browse'
    page.blurb = "Browse the database"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Browse the Database.</p>
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
    <p>Searching Tips/ FAQ.</p>
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
    <p>Mapping the Necrologies.</p>
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
    <p>Tableau visualizations.</p>
    PAGE_BODY
end

Staticpage.find_or_create_by(slug: 'bibliography') do | page |
    page.title = "Bibliography"
    page.description = 'Bibliography'
    page.blurb = "Bibliography"
    page.rank = 100
    page.publish = true
    page.createdby = current_user
    page.modifiedby = current_user
    page.body = <<~PAGE_BODY
    <p>Bibliography.</p>
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
    <p>Team Members.</p>
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
    <p>Praxis.</p>
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
    <p dir="ltr">The editors of the Jesuit Online Necrology welcome comments, corrections to records, suggestions for new content or features, and general feedback from users.</p>
    <p dir="ltr"> </p>
    <p dir="ltr">Email for the project's editors</p>
    <p dir="ltr" style="padding-left: 40px;"><a href="mailto:jesuitportal@bc.edu">jesuitportal@bc.edu</a></p>
    <p dir="ltr"> </p>
    <p dir="ltr">Learn more about the project’s institutional partners at</p>
    <p dir="ltr" style="padding-left: 40px;">Archivum Romanum Societatis Iesu</p>
    <p dir="ltr" style="padding-left: 40px;"><a href="http://sjweb.info/arsi/">http://sjweb.info/arsi/</a></p>
    <p dir="ltr" style="padding-left: 40px;">Institute for Advanced Jesuit Studies at Boston College</p>
    <p dir="ltr" style="padding-left: 40px;"><a href="https://www.bc.edu/iajs">https://www.bc.edu/iajs</a></p>
    <p dir="ltr" style="padding-left: 40px;">Woodstock Theological Library</p>
    <p dir="ltr" style="padding-left: 40px;"><a href="https://www.library.georgetown.edu/woodstock">https://www.library.georgetown.edu/woodstock</a> </p>
    PAGE_BODY
end

#end