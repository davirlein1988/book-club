class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create!(book_params)
    redirect_to "/books/#{@book.id}"
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to "/books"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"

  end

    def search
    if params[:search]
      @books = Book.search(params[:search], operator: "or")
    else
      @books = Book.all
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :url_file)
  end


end
