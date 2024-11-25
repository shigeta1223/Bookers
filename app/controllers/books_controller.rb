class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
  
    if @book.save
      @books = Book.all  # 作成に成功した場合は全ての本を再取得して @books に設定
       flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all  # 作成に失敗した場合も全ての本を @books に設定
      flash.now[:error] = @book.errors.full_messages.join(", ")
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all  # Bookモデルから全てのデータを取得して@booksに代入する例
    @book = Book.new  # 新しい Book オブジェクトを生成して @book に代入する
  end

  def edit
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      flash[:error] = "Book not found"
      redirect_to root_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book was successfully deleted."  # 削除成功時のメッセージを設定
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
       flash[:success] = "Book was successfully updated."
    else
      flash.now[:error] = @book.errors.full_messages.join(", ")
      render 'edit'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end


