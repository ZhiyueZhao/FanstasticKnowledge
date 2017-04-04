class BooksController < ApplicationController

  def index
    @types = Type.all
    #@books = Book.joins(:type).search_by_name(params[:search]).search_by_type(search_genre).order(sort_column + " " + sort_direction).paginate(:per_page => 2, :page => params[:page])
    #@books = Book.all.page(params[:page]).per(3)
    #
    @selected_type = params[:type]
    if params[:type] == "" || params[:type] == nil
      @books = Book.search_by_name(params[:search]).page(params[:page]).per(3)
    else
      @books = Book.joins(:type).search_by_name(params[:search]).search_by_type(params[:type]).page(params[:page]).per(3)
    end

    #@books = @books.type.type_name = search_genre
    #@booksTotal = Book.search_by_name(params[:search]).order(sort_column + " " + sort_direction)
  end

  def show
    @book = Book.find(params[:id])
  end

  private

    def search_type
      #set default sort params and sanatizing
      (params[:type] == "0") ? "" :params[:type]
    end
end
