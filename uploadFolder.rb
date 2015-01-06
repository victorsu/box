require "rest-client"
require "json"

your_folder_id = "2908822363"

your_filename = "test_file2" + ".txt"

f = File.open(your_filename, "w")

# Write a string to the file here–don't forget to close the file!

response = RestClient.post(
    "https://api.box.com/2.0/files/content",
		 {
		 	# We need to read the file again to send it to Box
		 :myFile => File.new(your_filename, 'rb'),
		  # This tells Box where to put the file
		  :parent_id => your_folder_id
		 },
		:authorization => "Bearer " << "vuHZfrznM2vxd7wGUHEpe88FX4pQEJXz"
)

puts JSON.parse(response.body)["entries"][0]["name"]
