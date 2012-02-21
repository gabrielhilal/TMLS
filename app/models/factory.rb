class Factory < ActiveRecord::Base
  has_many :orders
  attr_accessible :address1, :address2, :city, :contact, :country, :email, :name, :postcode, :telephone
  default_scope :order => "country, name"

  #email_regex reference: Ruby on Rails Tutorial-Learn Rails by Example (Michael Hartl)-http://ruby.railstutorial.org/
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :contact, :presence => true
  validates :country, :presence => true
  validates :email,   :presence => true,
                      :format   => { :with => email_regex },
                      :uniqueness => { :case_sensitive => false }
  validates :name,    :presence => true,
                      :uniqueness => { :case_sensitive => false }

end
