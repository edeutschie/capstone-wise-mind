class Quote < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :quotesusers
  has_many :users, through: :quotesusers
  has_many :dailyquotes

  belongs_to :user, optional: true

  validates :text, presence: true, uniqueness: true
  validates :author, presence: true
  validates :theme, presence: true, inclusion: {
    in: [ "motivational", "creativity", "adies_in_internship"]
  }
  validates :public, inclusion: { in: [ true, false ] }

  #validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}, on: :create

end
