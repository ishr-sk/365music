class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      redirect_to my_calendar_path
    else
      render 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def index
    # ログインユーザーのスケジュールのみを表示
    @schedules = Schedule.where(user_id: current_user.id)
  end

  def edit
    # もしログインユーザーではないユーザーだったら編集できない
    unless @schedule.user == current_user
      redirect_to root_path
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to my_calendar_path
    else
      render 'edit'
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_my_calendar_path
  end

  def my_calendar
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:user_id, :title, :body, :start_date, :end_date)
  end
end
