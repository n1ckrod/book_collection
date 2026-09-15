require "rails_helper"

RSpec.describe Book, type: :model do
  it "reads the seeded books from the test database" do
    expect(Book.count).to be >= 5
    expect(Book.first.title).to be_present
  end
end
