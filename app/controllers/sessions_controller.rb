class SessionsController < ApplicationController

  def new
    login_args = {
                  'username': ENV["jira_username"],
                  'password': ENV["jira_password"]
                }
    headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    }
    response = HTTParty.post('https://doxly-jira.atlassian.net/rest/auth/1/session', body: login_args.to_json, headers: headers)
    session[:cookie_name] = response.parsed_response["session"]["name"]
    session[:cookie_value] = response.parsed_response["session"]["value"]
  end
end
