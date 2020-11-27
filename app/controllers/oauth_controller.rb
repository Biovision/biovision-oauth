# frozen_string_literal: true

# Authentication with OAuth
class OauthController < ApplicationController
  include Authentication

  before_action :redirect_authenticated_user
  before_action :set_foreign_site

  # get /auth/:provider/callback
  def auth_callback
    data = request.env['omniauth.auth']
    user = @foreign_site.authenticate(data, tracking_for_entity)
    create_token_for_user(user) unless user.banned?

    redirect_to my_path
  end

  private

  def set_foreign_site
    @foreign_site = ForeignSite[params[:provider]]

    handle_http_503('Cannot set foreign site') if @foreign_site.nil?
  end
end
