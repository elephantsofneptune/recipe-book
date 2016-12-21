class Cookbook < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :description]
  belongs_to :user
  has_many :recipes
  has_many :subscriptions
  mount_uploader :book_cover, BookCoverUploader  
  scope :public_entry, -> { where public: true }  
  self.per_page = 2

  def public?
  	byebug
  	public == true
  end
end
