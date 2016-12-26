class Subscription < ApplicationRecord
  belongs_to :cookbook
  validates :user_id, uniqueness: { scope: :cookbook_id }  
end
