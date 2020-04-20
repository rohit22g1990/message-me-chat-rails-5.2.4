class HomeController < ApplicationController
    before_action :require_user 

    def index
        @message = Message.new
        @messages = Message.custom_messages
    end
end 