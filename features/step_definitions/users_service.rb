require 'rest-client'
require 'YAML'
When(/^The client requests GET "([^"]*)"$/) do |resource|
  response = send_request(BASE_PATH_USERS_SERVICE+'?apikey='+TEST_APIKEY, {})
  @response = response
  @status = response.code
end

Then(/^The response should be a (\d+) OK$/) do |status_code|
  expect(status_code.to_i).to eql(@status)
end

Then(/^I get the first user id$/) do
  @users = JSON.parse @response
  @userid = @users['data'][0]['id']
end

When(/^The client requests GET details of a userid$/) do
  userid_response = send_request(BASE_PATH_USERS_SERVICE+'/'+@userid+'?apikey='+TEST_APIKEY, {})
  @userid_response = userid_response
end

And(/^The user response has below attributes$/) do |table|
  user_response_parsed = JSON.parse @userid_response
  data_array = table.raw.map {|row| row.first}
  attributes = user_response_parsed['data']['attributes']
  attributes.each do |key|
    expect(data_array.index(key[0]) > -1).to eql(true)
  end
end


def send_request(url, headers)
  response = RestClient.get(url, headers={})
  return response
end