class User < ActiveRecord::Base
  belongs_to :factory

  attr_accessible :admin, :department, :email, :factory_id, :name, :password, :password_confirmation
  has_secure_password

  validates :name,        :uniqueness => { :case_sensitive => false },
                          :presence => true
  validates :email,       :uniqueness => { :case_sensitive => false },
                          :presence => true,
                          :format   => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,    :presence => true
  validates :department,  :presence => true
end

