class Ticket < ApplicationRecord
  has_many :votes


  def jira_ticket_object(cookie_name, cookie_value)
    HTTParty.get("https://doxly-jira.atlassian.net/rest/agile/1.0/issue/#{self.jira_key}", headers: headers(cookie_name, cookie_value)).parsed_response
  end

  def headers(cookie_name, cookie_value)
    {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'cookie': "#{cookie_name}=#{cookie_value}"
    }
  end
end
