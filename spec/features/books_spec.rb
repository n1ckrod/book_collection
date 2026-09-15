require "rails_helper"

RSpec.describe "Creating a book", type: :feature do
  def fill_in_full_book
    visit new_book_path
    fill_in "Title", with: "Dune"
    fill_in "Author", with: "Frank Herbert"
    fill_in "Price", with: "9.99"
    select "2015", from: "book_published_date_1i"
    select "August", from: "book_published_date_2i"
    select "1", from: "book_published_date_3i"
    click_on "Create Book"
  end

  scenario "sunny day: valid title" do
    fill_in_full_book
    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("Dune")
  end

  scenario "rainy day: blank title" do
    visit new_book_path
    fill_in "Title", with: ""
    click_on "Create Book"
    expect(page).to have_content("Book could not be saved.")
    expect(page).to have_content("Title can't be blank")
  end

  scenario "author is saved from the form" do
    fill_in_full_book
    expect(page).to have_content("Book was successfully created.")
    expect(Book.last.author).to eq("Frank Herbert")
  end

  scenario "price is saved from the form" do
    fill_in_full_book
    expect(page).to have_content("Book was successfully created.")
    expect(Book.last.price).to eq(BigDecimal("9.99"))
  end

  scenario "published date is saved from the form (drop-down)" do
    fill_in_full_book
    expect(page).to have_content("Book was successfully created.")
    expect(Book.last.published_date).to eq(Date.new(2015, 8, 1))
  end
end
