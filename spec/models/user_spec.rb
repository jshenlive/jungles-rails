require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "creates a user account with correctly" do
      @user = User.new(name:'Test',email:'123@123.com',password:'1234',password_confirmation:'1234')
      
      expect(@user.save).to be(true)
    end


  end
end
