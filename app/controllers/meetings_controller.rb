class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    # @meetings = policy_scope(Meeting).includes(:dog).order(created_at: :desc)
    @meetings = policy_scope(Meeting).where(user: current_user)
    @other_meetings = policy_scope(Meeting).includes(:dog).where('dogs.user_id = ?', current_user.id).references(:dogs)
    # User.includes(:posts).where('posts.name = ?', 'example').references(:posts)
  end

  def show
  end

  def new
    @meeting = Meeting.new
    @dog = Dog.find(params[:dog_id])
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting
    @meeting.dog = Dog.find(params[:dog_id])
    @meeting.user = current_user

    if @meeting.save
      redirect_to dog_meeting_path(@meeting.dog, @meeting)
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:date, :comment, :status, :rating)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end
end
