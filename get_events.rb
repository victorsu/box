require "rest_client"
require "json"

events_url = "https://api.box.com/2.0/events"

response = RestClient.get(
   events_url,
	    :params => {:limit => 1},
			 # Put the OAuth header here
			:authorization => "Bearer " << "vuHZfrznM2vxd7wGUHEpe88FX4pQEJXz"
)

JSON.parse(response.body)
