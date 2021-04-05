case Rails.env
when "development"
    current_user = User.find_by(email: 'admin@test.com')

    Staticpage.find_or_create_by(slug: 'home') do | page |
        page.title = "Maps"
        page.description = 'Homepage. do not delete!'
        page.blurb = "This is the homepage."
        page.rank = 100
        page.publish = true
        page.createdby = current_user
        page.modifiedby = current_user
        page.body = <<~PAGE_BODY
        <p>Hello, this is the landing page for the Jesuit Lives project data viz stuff.</p>
        <p>Here are some links to our wonderful and amazing work:</p>
        <p><a title="Map by date" href="/pages/map_by_date">Map by date</a></p>
        PAGE_BODY
    end

    Staticpage.find_or_create_by(slug: 'map_by_date') do | page |
        page.title = "Jesuit Lives: Where was Jesuit X on Y date? ~29000 Jesuits with birth, death, and province entrance spatial data"
        page.description = 'Here is a demo map page two columns and embedded media.'
        page.blurb = "This is a test page and here we will see a few data visualizations."
        page.rank = 200
        page.publish = true
        page.createdby = current_user
        page.modifiedby = current_user
        page.body = <<~PAGE_BODY
        <div class="row">
          <div class="col-md-6">
            <p>Map allows you to search by last name of Jesuit. Set up to autocomplete Last Name, First Name, ID number because some Jesuits have the same names. On search, the “Life” of a Jesuit appears as a line (for now just birth and death and province); a timeline at the bottom controls functionality. Popup boxes on the  markers and line give more info and could be customized. Also includes examples of Jesuit Maps and colored for alive/Jesuit/dead</p>
          </div>
          <div class="col-md-6">
            <p>This is the right column</p>
            <p><iframe title="YouTube video player" src="https://www.youtube.com/embed/l0vrsO3_HpU" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>
          </div>
        </div>
        PAGE_BODY
    end
    
end