# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # around_action :set_time_zone

  # private
  # def set_time_zone
  #     Time.use_zone(current_user.timezone) { yield }
  # end
end
