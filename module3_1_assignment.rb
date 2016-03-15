require 'httparty'

class Recipe
  include HTTParty
  base_uri "http://food2fork.com/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for (keyword)
    get("/search", query: { q: keyword})["recipes"]
  end

end


# All search requests should be made to the base search API URL.
# http://food2fork.com/api/search 
#
# All recipe requests should be made to this URL: http://food2fork.com/api/get

# Request: http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken 
# key: API Key
# q: (optional) Search Query (Ingredients should be separated by commas). 
# If this is omitted top rated recipes will be returned.
# sort: (optional) How the results should be sorted. See Below for details.
# page: (optional) Used to get additional results

# GET Recipe
# key: API Key
# rId: Id of desired recipe as returned by Search Query