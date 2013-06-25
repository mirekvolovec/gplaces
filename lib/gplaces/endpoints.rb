module Gplaces
  API_URL = 'https://maps.googleapis.com/maps/api/place'

  extend self

  # Search
  #########

  def api_search_nearby(output_type = :json)
    "#{API_URL}/nearbysearch/#{output_type.to_s}"
  end

  def api_search_text(output_type = :json)
    "#{API_URL}/textsearch/#{output_type.to_s}"
  end

  def api_search_radar(output_type = :json)
    "#{API_URL}/radarsearch/#{output_type.to_s}"
  end

  # Detail
  #########

  def api_detail(output_type = :json)
    "#{API_URL}/details/#{output_type.to_s}"
  end

end