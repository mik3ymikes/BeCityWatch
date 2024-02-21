require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not vailid without a username" do 
    user=build(:user, username: nil)
    expect(user).not_to be_valid
  end
  
    # password
  
    it "is invailid when password is nil" do
      user=build(:user, password:nil)    
    end


  it 'is not valid without an email ' do
    user=build(:user, email: nil)
    expect(user).not_to be_valid
  end


  it 'is not valid without an zipcode ' do
    user=build(:user, zipcode: nil)
    expect(user).not_to be_valid
  end




context 'Uniqueness tests' do
  it 'is not valid without a unique username' do
    user1=create(:user)
    user2=build(:user, username: user1.username)

    expect(user2).not_to be_valid
    expect(user2.errors[:username]).to include("has already been taken")
  end

  it 'is not valid without a unique email' do
    user1=create(:user)
    user2=build(:user, email: user1.email)

    expect(user2).not_to be_valid
    expect(user2.errors[:email]).to include("has already been taken")
end
end

context 'destroy user and everything dependent on it' do
  let (:user) {create (:user)}
  let (:user_id) {user.id}

before do
  user.destroy
end


it "deletes alerts" do
  alerts=Alert.where(user_id: user_id)
  expect(alerts).to be_empty
end

it "deletes comments" do
  comments=Comment.where(user_id: user_id)
  expect(comments).to be_empty
end

# it "deletes events" do
#   events=Event.where(user_id: user_id)
#   expect(events).to be_empty
# end
end
end

