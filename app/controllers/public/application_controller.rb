class Public::ApplicationController < ApplicationController
  before_action :unpermitted_action_for_guest_user, only: [:create, :update, :destroy]

  private

  def unpermitted_action_for_guest_user
    return unless current_user.name == 'guestuser'

    redirect_to root_path, notice: 'ゲストユーザーはこの操作は出来ません。'
  end
end
