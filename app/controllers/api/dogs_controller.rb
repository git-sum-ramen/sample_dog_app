class Api::DogsController < ApplicationController
  def create
    if current_user
      @dog = Dog.new(
        name: params[:name],
        breed: params[:breed],
        age: params[:age],
        user_id: current_user.id
      )
      @dog.save
      render 'show.json.jb'
    else
      render json: ["You are not allowed to do this"]
    end
  end
end
