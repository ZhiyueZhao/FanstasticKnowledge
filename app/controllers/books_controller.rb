class BooksController < ApplicationController
  before_action :getType

  def index
    @statuses = Status.all

    @selected_type = params[:type]
    @selected_status = params[:status]


    @books = Book.joins(:type, :status).search_by_name(params[:search]).search_by_type(params[:type])
      .search_by_status(params[:status]).page(params[:page]).per(3)

  end

  def show
    @book = Book.find(params[:id])
  end

  def aboutus
    @about = AboutU.last
  end

  def getType
    @types = Type.all
  end

end
