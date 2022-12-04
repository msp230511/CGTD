# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'from_omniauth' do
    let(:ahash) { OmniAuth::AuthHash.new }

    before(:each) do
      ahash.uid = 12_345
      ahash.provider = 'Github'
      ahash.info = OmniAuth::AuthHash::InfoHash.new
      ahash.info.name = 'Nobody'
      ahash.info.email = 'nobody@example.com'
      ahash.info.valid = true
    end

    it 'should return an instance of User' do
      expect(User.from_omniauth(ahash)).to be_an_instance_of(User)
    end

    it "should create a new user if the email doesn't exist" do
      expect { User.from_omniauth(ahash) }.to change { User.all.count }.by(1)
    end

    it 'should return an existing user if the email exists' do
      expect { User.from_omniauth(ahash) }.to change { User.all.count }.by(1)
      expect { User.from_omniauth(ahash) }.to change { User.all.count }.by(0)
    end
  end
end
