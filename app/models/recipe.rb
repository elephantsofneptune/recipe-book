class Recipe < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :ingredients, :steps]
  belongs_to :cookbook
  scope :public_entry, -> { joins(:cookbook).where(cookbooks: {public: true} ) }  

  def public?
  	byebug
  	self.cookbook.public == true
  end
end
