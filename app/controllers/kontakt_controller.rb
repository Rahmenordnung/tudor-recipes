class KontaktController < ApplicationController
  def index
    @contact = Kontakt.new(params[:kontakt])
  end

  def create
    @contact = Kontakt.new(params[kontakt])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Kontakt.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
