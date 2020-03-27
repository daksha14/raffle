class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  before_create :set_sequence

  validates_uniqueness_of    :email,:case_sensitive => false, :allow_blank => true,:scope=>:raffle_id, :if => :email_changed?
  validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of    :email, :on=>:create
  validates_presence_of    :password, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true
  
  belongs_to :raffle
  
  def set_sequence
    self.chance_to_win = 100/(raffle.users.count + 1)
  end

end
