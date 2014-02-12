require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a satus requires content" do 
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end
  test "that status content is at least two letters long" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	assert !status.errors[:content].empty?
  end
  test "that a status has a user id" do
  	status = Status.new
  	status.content = "Hello"
  	assert !status.save
  	assert !status.content[:user_id].empty?
  end
end
