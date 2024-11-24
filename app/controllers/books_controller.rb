class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    
    if book.save
      redirect_to book_path(book.id)
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all  # Bookモデルから全てのデータを取得して@booksに代入する例
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end


def edit
  @book = Book.find_by(id: params[:id])
  if @book.nil?
    flash[:error] = "Book not found"
    redirect_to root_path
  end
end