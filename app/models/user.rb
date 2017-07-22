class User < ApplicationRecord
  # has_and_belongs_to_many :quotes
  has_many :quotesusers
  has_many :quotes, through: :quotesusers

  has_many :submitted_quotes, class_name: :Quote, foreign_key: "user_id"

  # before_validation :clean_up_phone_num

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :login, presence: true, uniqueness: true
  validates :username, presence: true
  # the line below is the good one!
  # validates :phone_num, uniqueness: true, presence: true, length: { is: 10 }#, inclusion: { in:  /[^0-9]/ }
  # validates :phone_num, uniqueness: true, presence: true, format: { with: /\A\d+\Z/ }, length: { is: 10 }
  # validates :phone_num, uniqueness: true, presence: true, format: { with: /^\d+$/ }, length: { is: 10 }
  # validates :phone_num, uniqueness: true, presence: true, format: { with: /\d/ }, length: { is: 10 }
  # validates :email, uniqueness: true, presence: true
  # validates :theme_choice, presence: true, inclusion: {
    # in: [ "motivational", "creativity", "my quotes", "shuffle"]
  # }

  def clean_up_phone_num
    self.phone_num = self.phone_num.gsub(/[^0-9]/, '') #unless phone_num.nil?
  end

end
