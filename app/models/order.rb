class Order < ActiveRecord::Base
  belongs_to :factory
  belongs_to :customer
  has_many :drops
  attr_accessible :comments, :currency, :date, :number, :customer_id, :factory_id, :returns, :finance
  default_scope :order => "customer_id, number"

  validates :customer_id,  :presence => true
  validates :factory_id,   :presence => true
  validates :number,       :presence => true,
                           :uniqueness => { :case_sensitive => false }
  validates :date,         :presence => true
  validates :currency,     :presence => true
  validates :returns,      :presence => true
  validates :finance,      :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ["number LIKE ? OR date LIKE ?", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def status(order)
    count = order.drops.count
    temp = 0
    order.drops.each do |drop|
      if drop.invoice.nil?
        temp = temp + 0
      else
        temp = temp + 1
      end
    end
    if count == 0
      'no drops'
    elsif count == temp
      'Shipped'
    elsif temp == 0
      'In Production'
    elsif count > temp
      'Part Shipped'
    else
      'error'
    end
  end

end
