require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations on creating user' do
    it "validates a user account is created correctly" do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      
      expect(@user.save).to be(true)
    end

    it "validates unable to create user account due to blank last name" do
      @user = User.new(first_name:'Test', last_name: nil,email:'123@123.com',password:'1234',password_confirmation:'1234')
      
      expect(@user.save).to be(false)
    end

    it "validates unable to create user account due to blank first name" do
      @user = User.new(first_name:nil, last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      
      expect(@user.save).to be(false)
    end
    
    it "validates unable to create user account due to blank password" do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:nil,password_confirmation:'1234')
      
      expect(@user.save).to be(false)
    end

    it "validates unable to create user account duepassword confirmation" do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:nil)
      
      expect(@user.save).to be(false)
    end 

    it "validates unable to create user account due to blank password and password confirmation" do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:nil,password_confirmation:nil)
      
      expect(@user.save).to be(false)
    end  

    it "validates unable to create user account due to mismatch passwords " do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'12345')
      
      expect(@user.save).to be(false)
    end

    it "validates unable to create user account due to password length " do
      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:'123',password_confirmation:'123')
      
      expect(@user.save).to be(false)
    end

    it "validates unable to create user account due to email already exists" do
      @user1 = User.new(first_name:'Test1', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      expect(@user1.save).to be(true)

      @user = User.new(first_name:'Test', last_name: 'User',email:'123@123.com',password:'12345',password_confirmation:'12345')
      expect(@user.save).to be(false)
    end
  end

  describe 'Authentications on sessions' do
  
    it "authenticates a correct user" do
      @user = User.new(first_name:'Test1', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      expect(@user.save).to be(true)

      expect(User.authenticate_with_credentials('123@123.com','1234')).to be(true)
    end

    it "does not authenticates a user with incorrect password" do
      @user = User.new(first_name:'Test1', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      expect(@user.save).to be(true)

      expect(User.authenticate_with_credentials('123@123.com','12345')).to be(false)
    end

    it "does not authenticates a user with incorrect email and password combination" do
      @user = User.new(first_name:'Test1', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      expect(@user.save).to be(true)

      expect(User.authenticate_with_credentials('1234@123.com','1234')).to be(false)
    end

    #edge cases
    it "authenticates a email with leading and trailing spaces" do
      @user = User.new(first_name:'Test1', last_name: 'User',email:'123@123.com',password:'1234',password_confirmation:'1234')
      expect(@user.save).to be(true)

      expect(User.authenticate_with_credentials(' 123@123.com  ','1234')).to be(true)
    end

    it "authenticates a email with mixed cases" do
      @user = User.new(first_name:'Test1', last_name: 'User',email:'abc@def.com',password:'1234',password_confirmation:'1234')
      expect(@user.save).to be(true)

      expect(User.authenticate_with_credentials(' ABC@Def.cOm  ','1234')).to be(true)
    end


  end 
end
