class UserSessionsController < ApplicationController
  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, params[:user_session])

    p params

    if @session.authenticate
      redirect_to root_path, :notice => t('flash.notice.sign_in')
    else
      render :new
    end
  end

  def destroy
  end
end
