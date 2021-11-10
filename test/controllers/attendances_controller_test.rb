require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @attendance = attendances(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Attendance.count' do
      post attendances_path, params: { attendance: { clock_in_at: Time.zone.now } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Attendance.count' do
      delete attendance_path(@attendance)
    end
    assert_redirected_to login_url
  end
end
