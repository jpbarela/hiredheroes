class WelcomeController < ApplicationController

  def landing
    @moc_codes = MocCode.order("moc_code").all
  end

end
