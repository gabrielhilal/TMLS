class Consignee < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :address1, :address2, :city, :country, :name, :postcode, :customer_id

  validates :name,     :presence => true,
                       :uniqueness => { :case_sensitive => false }


end
