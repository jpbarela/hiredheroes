class WelcomeController < ApplicationController

  def landing
    @moc_codes = MocCode.order("moc_code").all
    @landing = true 
  end

end
