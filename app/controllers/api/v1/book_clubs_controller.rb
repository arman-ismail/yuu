module Api
  module V1
    class BookClubsController < ApplicationController
      before_action :set_book_club, only: [:show, :update, :destroy]
      before_action :authorize_admin, except: [:index, :show]
      
      def index
        @book_clubs = BookClub.all
        render json: @book_clubs
      end
      
      def show
        render json: @book_club
      end
      
      def create
        @book_club = BookClub.new(book_club_params)
        if @book_club.save
          render json: @book_club, status: :created
        else
          render json: @book_club.errors, status: :unprocessable_entity
        end
      end
      
      def update
        if @book_club.update(book_club_params)
          render json: @book_club
        else
          render json: @book_club.errors, status: :unprocessable_entity
        end
      end
      
      def destroy
        @book_club.destroy
        head :no_content
      end
      
      def analytics
        @book_club = BookClub.find(params[:id])
        analytics = {
          total_books: @book_club.books.count,
          completed_books: @book_club.book_readings.completed.count,
          average_rating: @book_club.book_summaries.average(:rating)
        }
        render json: analytics
      end
      
      def books
        @book_club = BookClub.find(params[:id])
        render json: @book_club.books
      end
      
      private
      
      def set_book_club
        @book_club = BookClub.find(params[:id])
      end
      
      def book_club_params
        params.require(:book_club).permit(:name, :description)
      end
    end
  end
end