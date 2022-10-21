class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "登録が完了しました。"
    else
      @genres = Genre.all
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genre_path, notice: "変更が保存されました。"
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path, notice: "削除されました。"
  end


  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end

