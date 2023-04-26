class User < ApplicationRecord
  # include Devise::Models::Guest
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        # , :guest

  has_many :answers, dependent: :destroy



end


