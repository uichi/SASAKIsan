class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @attendance = current_user.attendances.build
      @feed_items = current_user.today_feed.paginate(page: params[:page])
      last_attendance = current_user.today_attendance
      @is_clocked_in = clock_in?(last_attendance)
      @is_clocked_out = clock_out?(last_attendance)
    end
  end
end
