require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    expect(Book.new(title: "Dune")).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: "")
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an author" do
    book = Book.new(title: "Dune", author: "")
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "is invalid without a price" do
    book = Book.new(title: "Dune", price: nil)
    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a published date" do
    book = Book.new(title: "Dune", published_date: nil)
    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
