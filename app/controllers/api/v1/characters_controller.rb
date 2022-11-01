class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]

  # GET api/v1/characters
  def index
    @characters = Character.all

    render json: @characters, only: [:name, :image_url]
  end

  # GET api/v1/characters/1
  def show
    render json: @character, include: [:movie]
  end

  # POST api/v1/characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/characters/1
  def update
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/characters/1
  def destroy
    render json: @character.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :age, :weight, :history, :movie_id, :image_url)
  end
end
