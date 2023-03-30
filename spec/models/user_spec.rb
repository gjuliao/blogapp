require_relative 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John', photo: 'asdfasfd', bio: 'adfasfasdfasdf', posts_counter: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
