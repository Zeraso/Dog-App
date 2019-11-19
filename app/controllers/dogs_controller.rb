class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = policy_scope(dog).order(created_at: :desc)
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
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
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :coat, :gender)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
