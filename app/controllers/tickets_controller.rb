class TicketsController < ApplicationController
  before_action :require_user

  def index
    headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'cookie': "#{session[:cookie_name]}=#{session[:cookie_value]}"
    }
    response = HTTParty.get('https://doxly-jira.atlassian.net/rest/agile/1.0/board/1/sprint/30/issue', headers: headers)
    @tickets = []
    response.parsed_response["issues"].each do |issue|
      fields = issue['fields']
      ticket = Ticket.find_or_create_by(jira_key: issue['key'])
      @tickets << {
        id: ticket.id,
        jira_id: issue['id'],
        key: issue["key"],
        summary: fields['summary'],
        created: fields["created"],
        priority: fields["priority"]["name"],
        description: markdown.render(fields["description"] || ''),
        creator: fields["creator"]['name'],
        subtasks: fields["subtasks"],
        comments: fields['comment']['comments'],
        votes: ticket.votes
      }
      @logged_in_users = User.where(currently_logged_in: true)
      @ticket_object = Ticket.find(@tickets.first[:id])
    end
  end

  def show
    @ticket_object = Ticket.find(params[:id])
    fields = @ticket_object.jira_ticket_object(session[:cookie_name], session[:cookie_value])['fields']
    @ticket = {
      id: @ticket_object.id,
      key: @ticket_object.jira_key,
      summary: fields['summary'],
      created: fields["created"],
      priority: fields["priority"]["name"],
      description: markdown.render(fields["description"] || ''),
      creator: fields["creator"]['name'],
      subtasks: fields["subtasks"],
      comments: fields['comment']['comments'],
      votes: @ticket_object.votes
    }
    @logged_in_users = User.where(currently_logged_in: true)
  end

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end
end
