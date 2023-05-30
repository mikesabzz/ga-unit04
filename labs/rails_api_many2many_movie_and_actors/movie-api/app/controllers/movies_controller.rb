class MoviesController < ApplicationController
    def index
      @actor = Actor.find(params[:actor_id])
      @movies = @actor.movies
      render json: @movies, include: :actors, status: :ok
    end
  
    def show
      @movie = Movie.find(params[:id])
      render json: @movie, include: :actors, status: :ok
    end
  
    def create
      @actor = Actor.find(params[:actor_id])
      @movie = Movie.new(movie_params)
      if @movie.save
        @actor.movies.push(@movie)
        render json: @movie, status: :created
      else
        render json: { errors: @movie.errors }, status: :unprocessable_entity
      end
    end
  
    def update
      @actor = Actor.find(params[:actor_id])
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        render json: @movie, status: :ok
      else
        render json: { errors: @movie.errors }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      head 204
    end
  
    private
  
    def movie_params
      params.require(:movie).permit(:title, :actor_id)
    end
  end