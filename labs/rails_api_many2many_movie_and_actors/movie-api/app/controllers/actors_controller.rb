class ActorsController < ApplicationController
    def index
      @movie = Movie.find(params[:movie_id])
      @actors = @movie.actors
      render json: @actors, include: :movies, status: :ok
    end
  
    def show
      @actor = Actor.find(params[:id])
      render json: @actor, include: :movies, status: :ok
    end
  
    def create
      @movies = Movie.find(params[:movie_id])
      @actor = Actor.new(actor_params)
      if @actor.save
        @movie.actors.push(@actor)
        render json: @actor, status: :created
      else
        render json: { errors: @actor.errors }, status: :unprocessable_entity
      end
    end
  
    def update
      @movie = Movie.find(params[:movie_id])
      @actor = Actor.find(params[:id])
      if @actor.update(actor_params)
        render json: @actor, status: :ok
      else
        render json: { errors: @actor.errors }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @actor = Actor.find(params[:id])
      @actor.destroy
      head 204
    end
  
    private
  
    def actor_params
      params.require(:actor).permit(:title, :movie_id)
    end
  end