require "rest-client"
require "json"

folder_name = 'vsu_test_folder2'

body = {
    "name" => folder_name,
		 "parent" => {
		     "id" => "0"
		 }
}
										
response = RestClient.post(
    "https://api.box.com/2.0/folders",
    JSON.generate(body),
    {:authorization => "Bearer " << "vuHZfrznM2vxd7wGUHEpe88FX4pQEJXz"}
)
																
puts "COPY THIS NUMBER DOWN: " + JSON.parse(response.body)['id']
																
# This is the ID that you copied down in the last exercise
your_folder_id = JSON.parse(response.body)['id']

# Add the "body" variable here
body = {
	"description" => "This is a new description"
}

response = RestClient.put(
    "https://api.box.com/2.0/folders/#{your_folder_id}",
		    JSON.generate(body),
				:authorization => "Bearer " << "vuHZfrznM2vxd7wGUHEpe88FX4pQEJXz"
				)

JSON.parse(response.body)["description"]
