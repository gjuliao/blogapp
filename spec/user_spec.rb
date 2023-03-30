require_relative 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'asdfasfd', bio: 'adfasfasdfasdf', posts_counter: 0) }

  before { subject.save }

  it 'No name should be invalid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Name length should be less than 50' do
    subject.name = 'b' * 55
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
