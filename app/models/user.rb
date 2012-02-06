class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :department, :name
  has_secure_password

  #email_regex reference: Ruby on Rails Tutorial-Learn Rails by Example (Michael Hartl)-http://ruby.railstutorial.org/
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,       :presence => true,
                          :format   => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
  validates :department,  :presence => true
  validates :name,        :presence => true
  validates :password,    :presence => true

end

