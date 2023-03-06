require 'rails_helper'

RSpec.describe Like, type: :model do

  subject { described_class.new(created_at: Time.now,
                                updated_at: Time.now,
                                user_id: 1, # user exists in our test database
                                community_id: 1, # community exists in our test database
                                likeable_id: 1, # id of thing were liking (comment in this case) exists in our test database
                                likeable_type: 'Comment')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a proper user_id" do
    subject.user_id = 10000000000

    expect(subject).to_not be_valid
  end

  it "is not valid without a community_id" do
    subject.community_id = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a proper community_id" do
    subject.community_id = 10000000000

    expect(subject).to_not be_valid
  end

  it "is not valid without a likeable_type" do
    subject.likeable_type = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a likeable_id" do
    subject.likeable_id = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a proper likeable_id" do
    subject.likeable_id = 100000000

    expect(subject).to_not be_valid
  end

end
