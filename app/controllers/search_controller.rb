class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    if params.key? :search
      search_data = params[:search]

      if search_data.key? :user
        user_search = search_data[:user]
        @search_user_list = User.joins(:time_offs).where('name LIKE ?', "%#{user_search}%")
      end
    end
  end
end
