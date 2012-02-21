class Order < ActiveRecord::Base
  belongs_to :factory
  belongs_to :customer
  has_many :drops
  attr_accessible :comments, :currency, :date, :number, :customer_id, :factory_id
  default_scope :order => "customer_id, number"

  validates :customer_id,  :presence => true
  validates :factory_id,   :presence => true
  validates :number,       :presence => true,
                           :uniqueness => { :case_sensitive => false }
  validates :date,         :presence => true
  validates :currency,     :presence => true

end
