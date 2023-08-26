class Public::ContinueTimesController < ApplicationController
    
    def strat_continue
        @continue = Continue.find(params[:continue_id])
        @start = current_user.start.new(continue_id: @continue.id)
        @start.save
        redirect_to continue_path(@continue.id)
    end
    
    def end_continue
        @continue = Continue.find(params[:continue_id])
        @end = current_user.end.new(continue_id: @continue.id)
        @end.save
        redirect_to continue_path(@continue.id)
    end
    
end
