class TicketsController < ApplicationController
  def index
    headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'cookie': "#{session[:cookie_name]}=#{session[:cookie_value]}"
    }
    response = HTTParty.get('https://doxly-jira.atlassian.net/rest/agile/1.0/board/1/sprint/30/issue', headers: headers)
    @issues = []
    response.parsed_response["issues"].each do |issue|
      fields = issue['fields']
      @issues << {id: issue['id'], key: issue["key"], summary: fields['summary'], created: fields["created"], priority: fields["priority"]["name"], description: fields["description"], creator: fields["creator"]['name'], subtasks: fields["subtasks"], comments: fields['comment']['comments'] }
    end
  end
end
