class Foursquare

  def self.find(city, category_id) #can also write Foursquare for self

    client = Foursquare2::Client.new(client_id: 'B1KPTBXUN3FML14LGZP5FWHTM14SXVYPE4XDSFC1W0AL5LUF', client_secret: '')
    response = client.search_venues(near: city, categoryId: category_id).to_json

    sushi_venues_hash = JSON.parse(response)
    restaurant_items_array = sushi_venues_hash.values[0][0].values[2]
    restaurant_names = []

    restaurant_items_array.each do |obj|
      puts obj["name"]
      restaurant_names << obj["name"]
    end

    restaurant_checkins = []

    restaurant_items_array.each do |obj|
      puts obj["stats"]["checkinsCount"]
      restaurant_checkins << obj["stats"]["checkinsCount"]
    end

    names_and_checkins = {}

    restaurant_names.each_with_index { |k,i| names_and_checkins[k] = restaurant_checkins[i]}

    @names_and_checkins_remap = names_and_checkins.map {|k, v| {Name: k, Checkins: v} }

    @sorted_names_and_checkins_remap = @names_and_checkins_remap.sort_by { |k| k[:Checkins] }.reverse

  end

end
