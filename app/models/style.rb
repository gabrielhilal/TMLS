class Style < ActiveRecord::Base
  has_many :items

  attr_accessible :construction, :image, :style
  mount_uploader :image, ImageUploader
  default_scope :order => "style, construction"

  validates :style,           :presence => true,
                              :uniqueness => {:scope => :construction, :message => "/ Construction combination has already been taken"}
  validates :construction,    :presence => true
  validates :image,           :presence => true

  def dropdown
    "#{style} | #{construction}"
  end

  def self.search(search)
    if search
      find(:all, :conditions => ["style ILIKE ? OR construction ILIKE ?", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end