class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new
    book.save
    redirect_to 
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all  # Bookモデルから全てのデータを取得して@booksに代入する例
  end
end

  def show
  end

  def edit
  end