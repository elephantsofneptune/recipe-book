class Cookbook < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :description]
  belongs_to :user
  has_many :recipes
  scope :public_entry, -> { where public: true }  

  def public?
  	byebug
  	public == true
  end
end
