class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house, include: :reviews
    # The include option lets us nest associated data in our response
    # In the above we call the .reviews method provided by has_many :reviews and serialized the reviews as a nested array of JSON
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
