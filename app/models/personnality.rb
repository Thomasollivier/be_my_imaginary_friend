class Personnality < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
