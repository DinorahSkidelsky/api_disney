class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]

  # GET api/v1/movies
  def index
    if params[:title].present?
      @movies = Movie.where('title ILIKE ?', "%#{params[:title]}%")
      @movies = 'title not found' if @movies.empty?
    elsif params[:genre].present?
      @movies = Movie.where('cast(genre_id as text) ILIKE ?', "%#{params[:genre]}%")
      @movies = 'genre not found' if @movies.empty?
    elsif params[:order].present?
      if params[:order] == 'asc'
        @movies = Movie.order('creation_date ASC')
      elsif params[:order] == 'desc'
        @movies = Movie.order('creation_date DESC')
      else
        @movies = 'not found'
      end
    else
      @movies = Movie.all
    end

    render json: @movies, only: %i[title creation_date image_url]
  end

  # GET api/v1/movies/1
  def show
    render json: @movie, include: [:characters]
  end

  # POST api/v1/movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/movies/1
  def destroy
    render json: @movie.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :creation_date, :rate, :genre_id, :image_url)
  end
end
