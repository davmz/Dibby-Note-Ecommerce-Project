class User < ApplicationRecord
  has_one :province, dependent: :nullify
  has_many :order, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :confirmable

  # Validation
  validates :first_name, :last_name, :address, presence: true
end
