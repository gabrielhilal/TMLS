class Customer < ActiveRecord::Base
  has_many :consignees, :dependent => :destroy
  has_many :orders

  attr_accessible :address1, :address2, :city, :contact, :country, :discount, :email, :name, :postcode, :telephone, :terms
  default_scope :order => "name"

  validates :name,      :uniqueness => { :case_sensitive => false },
                        :presence => true
  validates :country,   :presence => true
  validates :contact,   :presence => true
  validates :email,     :uniqueness => { :case_sensitive => false },
                        :presence => true,
                        :format   => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :discount,  :presence => true
  validates :terms,     :presence => true
end

