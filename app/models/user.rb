class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :personnalities
  has_many :rentals # As a renter of personnalities
  has_many :reservations, through: :personnalities, source: :rentals# As the owner of personnalities
  mount_uploader :photo, PhotoUploader
end
