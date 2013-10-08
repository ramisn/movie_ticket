class MoviesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(params[:movie])
    if @movie.save
      redirect_to @movie, notice: "Movie was created."
    else
      render :new
    end
  end

  def edit
    @movie = current_user.movies.find(params[:id])
  end

  def update
    @movie = current_user.movies.find(params[:id])
    if @movie.update_attributes(params[:movie])
      redirect_to @movie, notice: "Movie was updated."
    else
      render :edit
    end
  end

  def destroy
    @movie = current_user.movies.find(params[:id])
    @movie.destroy
    redirect_to movies_url, notice: "Movie was destroyed."
  end

  def search
    @movies = Movie.search(params[:search])  
  end
end
