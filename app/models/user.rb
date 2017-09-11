class User < ApplicationRecord
  has_secure_password
  has_many :votes

  validates :first_name, :last_name, :email, :jira_username, :jira_password, presence: true
  validates :email, :jira_username, :jira_password, uniqueness: true
  validates :password, length: {minimum: 6}, on: :create
  validates :first_name, :last_name, length: {maximum: 25}
end
