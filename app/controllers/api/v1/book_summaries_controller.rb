module Api
  module V1
    class BookSummariesController < ApplicationController
      before_action :set_book_summary, only: [:show, :update, :destroy]
      
      def index
        @book_summaries = if params[:book_id] && params[:book_club_id]
          BookSummary.where(book_id: params[:book_id], book_club_id: params[:book_club_id])
        else
          BookSummary.all
        end
        render json: @book_summaries
      end
      
      def show
        render json: @book_summary
      end
      
      def create
        @book_summary = current_user.book_summaries.new(book_summary_params)
        if @book_summary.save
          render json: @book_summary, status: :created
        else
          render json: @book_summary.errors, status: :unprocessable_entity
        end
      end
      
      private
      
      def set_book_summary
        @book_summary = BookSummary.find(params[:id])
      end
      
      def book_summary_params
        params.require(:book_summary).permit(:content, :rating, :book_id, :book_club_id)
      end
    end
  end
end