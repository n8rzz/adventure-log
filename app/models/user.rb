class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable,
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable
end
