require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "a user should enter a first name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

   test "a user should enter a profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = 'steve'
  	user.email = 'g23design@gmail.com'
  	user.first_name = 'steve'
  	user.last_name = 'gotham'
  	user.profile_name = 'stevieg'
  	user.encrypted_password = 'password'
  	user.password_confirmation = 'password'
  	assert !user.save
  	puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'steve', last_name: 'gotham', email: 'g23deisgn@gmail.com')
    user.password = user.password_confirmation = 'asdf;lkj'

    user.profile_name = "My profile name with spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'steve', last_name: 'gotham', email: 'g23deisgn@gmail.com')
    user.password = user.password_confirmation = 'asdf;lkj'
    user.profile_name = 'stevegotham_1'
    assert user.valid?
  end

end







