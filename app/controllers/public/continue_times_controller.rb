class Public::ContinueTimesController < ApplicationController

    def start_continue
        continue = Continue.find(params[:continue_id])
        start = current_user.continue_times.new(continue_id: continue.id, start_at: DateTime.now)
        start.save
        redirect_to continue_path(continue.id)
    end

    def end_continue
        continue = Continue.find(params[:continue_id])
        ct = ContinueTime.find_by(continue_id: continue.id, end_at: nil)
        ct.update(end_at: DateTime.now)
        redirect_to continue_path(continue.id)
    end

end
