class MeetingsController < ApplicationController
  def index
    @meetings = policy_scope(Meeting).order(created_at: :desc)
  end
end
