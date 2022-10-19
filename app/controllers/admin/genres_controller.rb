class Admin::GenresController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def create
  end

  def update
  end

end