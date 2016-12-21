require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
  	@user_1 = User.create!(email: "misokuan@gmail.com", username: "misokuan", password: "1234Qwer", first_name: "Miso", last_name: "Kuan", date_of_birth: "1993-12-24")
  	@user_2 = User.create!(email: "missnpk@gmail.com", username: "missnpk", password: "1234Qwer", first_name: "Miss", last_name: "Npk", date_of_birth: "2004-12-21")
  end

	describe "email validation" do
	  it "does not allow duplicate email to be signed up" do
	  	expect(User.create!(email: "misokuan@gmail.com", username: "new_user", password: "1234Qwer")).to_be nil
	  end

	  it "allows unique email to be signed up" do
	  	expect(User.create!(email: "pui_kuan93@hotmail.com", username: "new_user", password: "1234Qwer")).to_not_be nil
	  end 

	  it "does not allow user without email to be signed up" do
	  	expect(User.create!(username: "pui_kuan93", password: "1234Qwer")).to_be nil
	  end
	end  

	describe "username validation" do
	  it "does not allow duplicate username to be signed up" do
	  	expect(User.create!(email: "new_user@gmail.com", username: "misokuan", password: "1234Qwer")).to_be nil
	  end

	  it "allows unique username to be signed up" do
	  	expect(User.create!(email: "new_user@gmail.com", username: "pui_kuan93", password: "1234Qwer")).to_not_be nil
	  end

	  it "does not allow user without username to be signed up" do
	  	expect(User.create!(email: "pui_kuan93@hotmail.com", password: "1234Qwer")).to_be nil
	  end	  
	end

	describe "#fullname" do
	  it "returns the combination of first and last name" do
	  	expect(@user_1.fullname).to_be "Miso Kuan"
	  	expect(@user_2.fullname).to_be "Miss Npk"
	  end
	end

	describe '#age' do
		it "returns the user's age based on their date of birth" do
			expect(@user_1.age).to_be 23
			expect(@user_2.age).to_be 12
		end 
	end	

end
