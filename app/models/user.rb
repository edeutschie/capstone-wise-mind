class User < ApplicationRecord
  # has_and_belongs_to_many :quotes
  has_many :quotesusers
  has_many :quotes, through: :quotesusers

  has_many :submitted_quotes, class_name: :Quote, foreign_key: "user_id"

  before_validation :clean_up_phone_num

  validates :phone_num, presence: true

  def clean_up_phone_num
    return self.phone_num.gsub(/[^0-9]/, '')
  end

  # def rando
  #   return 2 + 2
  # end
end
