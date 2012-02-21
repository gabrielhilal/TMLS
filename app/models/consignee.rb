class Consignee < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :address1, :address2, :city, :country, :name, :postcode
  default_scope :order => "country, name"

  validates :name,     :presence => true,
                       :uniqueness => { :case_sensitive => false }
  validates :country,     :presence => true

end
