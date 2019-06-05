require 'spec_helper'
require 'minitest/spec'
require 'minitest/autorun'

describe "Welcoming users" do
  before do
    def get_action; "test string" end
  end

  it "should work" do
    welcome_user.must_equal "Required action was test string."
  end
end