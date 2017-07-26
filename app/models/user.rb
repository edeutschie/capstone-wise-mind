class User < ApplicationRecord
  # has_and_belongs_to_many :quotes
  has_many :quotesusers
  has_many :quotes, through: :quotesusers

  has_many :submitted_quotes, class_name: :Quote, foreign_key: "user_id"

  # before_validation :clean_up_phone_num

  validates :login, presence: true, uniqueness: true
  validates :username, presence: true

  validates :theme_choice, presence: true, inclusion: {
    in: [ "motivational", "creativity", "adies_in_internship"]
  }
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone_num, uniqueness: true, presence: true, length: { is: 10 }#, inclusion: { in:  /[^0-9]/ }
  # validates :email, uniqueness: true, presence: true

  # def clean_up_phone_num
  #   self.phone_num = self.phone_num.gsub(/[^0-9]/, '') #unless phone_num.nil?
  # end

end
