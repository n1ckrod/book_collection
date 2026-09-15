class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[ show edit update destroy ]
  before_action :set_options, only: %i[ new edit create update ]

  def index
    @user_books = UserBook.includes(:user, :book)
  end

  def show
  end

  def new
    @user_book = UserBook.new
  end

  def edit
  end

  def create
    @user_book = UserBook.new(user_book_params)
    if @user_book.save
      redirect_to user_books_path, notice: "User book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user_book.update(user_book_params)
      redirect_to user_books_path, notice: "User book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_book.destroy!
    redirect_to user_books_path, notice: "User book was successfully destroyed.", status: :see_other
  end

  private
    def set_user_book
      @user_book = UserBook.find(params.expect(:id))
    end

    def set_options
      @users = User.order(:username)
      @books = Book.order(:title)
    end

    def user_book_params
      params.expect(user_book: [ :user_id, :book_id ])
    end
end
