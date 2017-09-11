class VotesController < ApplicationController
  before_action :require_user

  def create
    vote = ticket.votes.find_or_initialize_by(user_id: current_user.id)
    vote.value = params[:value]
    vote.save
  end

  private

  def ticket
    @ticket ||= Ticket.find(params[:ticket_id])
  end

end
