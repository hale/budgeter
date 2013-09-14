class UtilitiesController < ActionController::Base

  def parse_date
    date = nil
    begin
      date = Date.parse params[:date]
    rescue ArgumentError, TypeError
    end

    respond_to do |format|
      if date
        format.json { render :json => { :date => date }, :status => 200 }
      else
        format.json { render :json => { }, :status => 422 }
      end
    end
  end

end
