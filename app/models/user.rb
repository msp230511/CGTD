# frozen_string_literal: true

class User < ApplicationRecord
  has_many :todo_lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(omniauth_info)
    if User.exists?(email: omniauth_info.info.email)
      user = User.find_by(email: omniauth_info.info.email)
      user.uid = omniauth_info.uid
      user.provider = omniauth_info.provider
      user
    else
      User.create!(email: omniauth_info.info.email, uid: omniauth_info.info.uid,
                    password: Devise.friendly_token[0, 20])

    end
  end
end
