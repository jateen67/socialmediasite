require 'rails_helper'

RSpec.describe Community, type: :model do

  subject { described_class.new(title: 'test',
                                description: 'test',
                                created_at: Time.now,
                                updated_at: Time.now,
                                user_id: 1) # user exists in our test database
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil

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

end
