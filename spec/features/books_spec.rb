require "rails_helper"

RSpec.describe "Creating a book", type: :feature do
  scenario "sunny day: valid title" do
    visit new_book_path
    fill_in "Title", with: "Dune"
    click_on "Create Book"
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
end
