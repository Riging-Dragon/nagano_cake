class Admins::GenresController < ApplicationController
def index
    @genres = Genre.all
    @genre = Genre.new
end

def edit
    @genre = Genre.with_deleted.find(params[:id])

end

def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "You have creatad new genre successfully."
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render :index
    end
end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "you have edited genre successfully."
      @genre = Genre.find(params[:id])
      redirect_to admins_genres_path
    else
      render :edit
    end
  end
  def genre_restore
    @genre = Genre.only_deleted.find(params[:id]).restore
    redirect_to admins_genres_path
  end

  def destroy
    @genre = Genre.with_deleted.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

private
  def genre_params
    params.require(:genre).permit(:category)
  end

end