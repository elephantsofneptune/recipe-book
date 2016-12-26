class Cookbook < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :description]
  belongs_to :user
  validates :title, :presence => true
  has_many :recipes
  has_many :subscriptions, dependent: :destroy
  mount_uploader :book_cover, BookCoverUploader  
  scope :public_entry, -> { where public: true }  
  self.per_page = 4

  def public?
  	byebug
  	public == true
  end
end
