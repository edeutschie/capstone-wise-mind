class Quote < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :quotesusers
  has_many :users, through: :quotesusers

  belongs_to :user

  validates :text, presence: true, uniqueness: true
  validates :author, presence: true
  validates :theme, presence: true, inclusion: {
    in: [ "Motivational", "Creativity", "My Quotes", "Shuffle"]
  }
  validates :public, presence: true, inclusion: { in: [ true, false ] }

  # def rando
  #   return 5 + 5
  # end
  #validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}, on: :create
  end
end
