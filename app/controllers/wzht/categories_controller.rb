class Wzht::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
end
