class Cookbook < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :description]
  belongs_to :user
  has_many :recipes
  mount_uploader :book_cover, BookCoverUploader  
  scope :public_entry, -> { where public: true }  

  def public?
  	byebug
  	public == true
  end
end
