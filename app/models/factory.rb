class Factory < ActiveRecord::Base
  has_many :orders
  has_one :user

  attr_accessible :address1, :address2, :city, :contact, :country, :email, :name, :postcode, :telephone
  default_scope :order => "country, name"

  validates :name,      :uniqueness => { :case_sensitive => false },
                        :presence => true
  validates :contact,   :presence => true
  validates :email,     :uniqueness => { :case_sensitive => false },
                        :presence => true,
                        :format   => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :country,   :presence => true
end
