require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
        assert_equal "Tolase Kelvin Adegbite", full_title
        assert_equal "Home | Tolase Kelvin Adegbite", full_title("Home")
    end
end