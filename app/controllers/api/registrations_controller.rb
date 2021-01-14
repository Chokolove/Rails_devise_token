# frozen_string_literal: true

module Api
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    skip_forgery_protection
  end
end
