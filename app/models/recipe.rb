class Recipe < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :ingredients, :steps]
  belongs_to :cookbook
  validates :title, :presence => true
  mount_uploader :image, ImageUploader  
  scope :public_entry, -> { joins(:cookbook).where(cookbooks: {public: true} ) } 
  self.per_page = 3
  def public?
  	byebug
  	self.cookbook.public == true
  end
end
