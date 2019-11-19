class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
  end

  def show
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
