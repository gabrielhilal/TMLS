class Style < ActiveRecord::Base
  has_many :items
  attr_accessible :image, :style, :construction
  mount_uploader :image, ImageUploader

  #validates :picture,          :presence => true
  validates :style,            :presence => true,
                               :uniqueness => {:scope => :construction}
  validates :construction,     :presence => true,
                               :uniqueness => {:scope => :style}

end
