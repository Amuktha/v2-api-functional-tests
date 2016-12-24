require 'rest-client'
require 'YAML'
When(/^The client requests GET "([^"]*)"$/) do |resource|
  response = send_request(BASE_PATH+resource+'?apikey='+TEST_APIKEY,{})
  @status = response.code
end

Then(/^The response should be a (\d+) OK$/) do |status_code|
  expect(status_code.to_i).to eql(@status)
end

def send_request(url,headers)
  response = RestClient.get(url, headers={})
  return response
end