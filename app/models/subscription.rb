class Subscription < ApplicationRecord
  belongs_to :cookbook, dependent: :destroy
  validates :user_id, uniqueness: { scope: :cookbook_id }  
end
