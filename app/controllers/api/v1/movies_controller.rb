class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    page_number = (params[:page] == nil ? 1 : params[:page])
    page_size = (params[:page_size] == nil ? 10 : params[:page_size])
    category = (params[:category] != nil ? Category.find_by_title(params[:category]) : nil )
    if category
      @movies = Movie.where(:category_id => category.id).paginate(page: page_number, per_page: page_size)
    else
      @movies = Movie.paginate(page: page_number, per_page: page_size)
    end

    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:title, :description, :category_id, :user_id)
    end
end
