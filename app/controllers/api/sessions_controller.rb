# frozen_string_literal: true

module Api
  class SessionsController < DeviseTokenAuth::SessionsController
    skip_forgery_protection
  end
end