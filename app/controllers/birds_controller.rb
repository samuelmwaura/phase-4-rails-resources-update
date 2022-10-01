class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  #PATCH /birds/:id
  def update
   bird = find_a_bird
   bird.update(bird_params)
   render json: bird, status: :accepted
  rescue ActiveRecord::RecordNotFound  #Will rescue us from the bird not found error
    send_error
  end
  
  #Custom route that takes the role of updating the likes from the frontend client to the backend
  def increment_likes
    bird = find_a_bird
    bird.update(likes:bird.likes + 1)
    render json: bird
  rescue ActiveRecord::RecordNotFound
    send_error
  end

  private

  def bird_params
    params.permit(:name, :species,:likes)
  end

  def send_error
    render json: {error:" Bird not found!"}, status: :not_found
  end

  def find_a_bird
    bird = Bird.find(params[:id])
  end
end
