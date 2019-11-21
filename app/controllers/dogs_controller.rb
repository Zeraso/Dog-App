class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index

    @dogs = policy_scope(Dog).order(created_at: :desc).where(available: true)
    if params[:search].present?
      @query = params[:search][:query]
      @radius = params[:search][:radius]
      if @query.present?
        # Premiere query pour sélectionner chiens par race
        # Chaîner une 2e query .near pour les chiens les plus proches
        @dogs = Dog.where('breed ILIKE ?', "%#{@query}%").near(current_user.address, @radius = 5)
      else
        @dogs = Dog.geocoded
      end
    end


    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { dog: dog })
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @marker = [{ lat: @dog.latitude, lng: @dog.longitude }]

    @meetings = @dog.meetings
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  def my_dogs
    skip_authorization
    @dogs = current_user.dogs
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :coat, :gender, :available, photos: [])
  end

  def set_dog
    @dog = Dog.find(params[:id])
    authorize @dog
  end
end
