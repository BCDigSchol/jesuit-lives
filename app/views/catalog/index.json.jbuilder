json.meta do
  json.pages @presenter.pagination_info
end

json.docs do
  json.array! @presenter.documents do |document|

    json.id document.id

    # Information added for Jesuit Portal harvesting.
    birth_date = document['birth_year_display'][0]
    death_date = document['death_year_display'][0]
    birth_place = document['place_of_birth_tsi']
    death_place = document['place_of_death_tsi']
    json.title document['full_name_tsi']
    json.description JesuitLives::TombstonePresenter.new(birth_date, birth_place, death_date, death_place).full

  end
end
