class Consignee < ActiveRecord::Base
  belongs_to :customer
  has_many :drops

  attr_accessible :address1, :address2, :city, :country, :customer_id, :name, :postcode
  default_scope :order => "country, name"

  validates :customer_id,   :presence => true
  validates :name,          :uniqueness => { :case_sensitive => false },
                            :presence => true
  validates :country,       :presence => true
end


