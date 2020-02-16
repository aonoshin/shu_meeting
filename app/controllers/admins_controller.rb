class AdminsController < ApplicationController
  
  before_action :admin_check_redirect
  
  def index
  end
  
  def nonaccess
  end
  
end
