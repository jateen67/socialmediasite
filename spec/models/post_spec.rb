require 'rails_helper'

RSpec.describe Post, type: :model do

  subject { described_class.new(title: 'test',
                                body: 'test',
                                created_at: Time.now,
                                updated_at: Time.now,
                                user_id: 1, # user exists in our test database
                                community_id: 1) # community exists in our test database
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a body" do
    subject.body = nil

    expect(subject).to_not be_valid
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

end
