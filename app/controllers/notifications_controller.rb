class NotificationsController < ApplicationController
  before_action :load_noti_user, :load_notification

  def update
    if @notification.update_attributes(status: :seen)
      respond_to :html, :js
    else
      respond_to do |format|
        format.js{render "alert(#{t 'notifications_controller.fail'})"}
      end
    end
  end

  def destroy
    if @notification.destroy
      respond_to :html, :js
    else
      respond_to do |format|
        format.js{render "alert(#{t 'notifications_controller.fail'})"}
      end
    end
  end

  private

  def load_notification
    @notification = Notification.find_by id: params[:id]
    return if @notification

    redirect_to root_path
  end
end
