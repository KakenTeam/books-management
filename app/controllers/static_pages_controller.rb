class StaticPagesController < ApplicationController

  before_action :admin_user, only: [:return]

  def home
    unless current_user.nil?
      unless current_user_admin?
        @borrowings = current_user.borrowings.where(verified: true)
        @books = Array.new
        @borrowings.each { |b| @books << Book.find_by(id: b.book_id) }
      else
        @request_borrowings = Borrowing.where.not(request: nil)
        @borrowings = Borrowing.where(request: nil).includes(:book)
      end
    end
  end

  def about
  end

  def return
    if params[:search_user_id] 
      if @user = User.find_by(id: params[:search_user_id])
        @borrowings = @user.borrowings
      else
        flash[:warning] = "Not found user"
      end
    end
    store_location
  end

  private 
     def admin_user
        unless current_user_admin? 
          flash[:danger] = "You're not admin user!"
          redirect_to root_url
        end
  end
end
