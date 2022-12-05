# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :todo_lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(omniauth_info)
    user_email = omniauth_info.info.email.downcase
    if User.exists?(email: user_email)
      user = User.find_by(email: user_email)
      user.uid = omniauth_info.uid
      user.provider = omniauth_info.provider
      user
    else
      User.create!(email: user_email, uid: omniauth_info.info.uid,
                   password: Devise.friendly_token[0, 20])

    end
  end
end
