# -*- coding: utf-8 -*-
require 'json'

class AmonController < ApplicationController

  skip_before_filter :verify_authenticity_token ,:only=>[:register]

  def welcome
    `cloudmonkey set display json`
  end

  def register

    # check password
    if params[:password] == params[:confirm]

      begin
        # create user account
        result = JSON.parse(`cloudmonkey create account firstname="#{params[:firstname]}" lastname="#{params[:lastname]}" username="#{params[:accountname]}" accounttype=0 email="#{params[:email]}" password="#{params[:password]}"`)

        redirect_to("http://#{CLOUDSTACK_HOST}:#{CLOUDSTACK_PORT}/client")
      rescue
        redirect_to("/?error=1")
      end

    else
      redirect_to("/?error=1")
    end
    
  end


  def unregister
    
  end

 
end
