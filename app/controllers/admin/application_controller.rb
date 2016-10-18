class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  
  layout 'admin'

  def authenticate_admin!
    render_404 unless current_user.is_admin?
  end

  def render_404
    render file: Rails.root.join("public", "404"), layout: false, status: "404"
  end
end