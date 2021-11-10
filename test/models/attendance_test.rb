require "test_helper"

class AttendanceTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @attendance = @user.attendances.build(clock_in_at: Time.zone.now)
  end

  test "should be valid" do
    assert @attendance.valid?
  end

  test "user id should be present" do
    @attendance.user_id = nil
    assert_not @attendance.valid?
  end

  test "order should be most recent first" do
    assert_equal attendances(:most_recent), Attendance.first
  end
end
