# -*- coding: utf-8 -*-
require 'json'

class AmonController < ApplicationController

  skip_before_filter :verify_authenticity_token ,:only=>[:register, :unregister]

  def welcome
  end

  def register

    # check password
    if params[:password] == params[:confirm]

      begin
        # create user account
        result = JSON.parse(`cloudmonkey create account firstname="#{params[:firstname]}" lastname="#{params[:lastname]}" username="#{params[:username]}" accounttype=0 email="#{params[:email]}" password="#{params[:password]}"`)

        redirect_to("/?registered=true")
      rescue
        redirect_to("/?registered=false")
      end

    else
      redirect_to("/?registered=false")
    end
    
  end


  def unregister
      begin
        # delete user account
        result = JSON.parse `cloudmonkey api login username=#{params[:username]} password=#{params[:password]}`
        if result["sessionkey"]
          result = JSON.parse `cloudmonkey list users username=#{params[:username]}`
          accountid = result["user"].first["accountid"]
          result = JSON.parse `cloudmonkey delete account id=#{accountid}`.sub(/.*?{/,"{")
          redirect_to("/?unregistered=true")
        else
          redirect_to("/?unregistered=false")
        end
      rescue
        redirect_to("/?unregistered=false")
      end 
  end

 
end
