class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    # どのユーザと会話するか取得
    @user = User.find(params[:id])
    # カレントユーザーのentry(中間テーブル)にあるroom_idの値をroomsに代入
    rooms = current_user.entries.pluck(:room_id)
    # entryモデルから[user_idがチャット相手のidと一致するもの]と
    # [room_idが上記roomsのどれかに一致するもの]をentryに代入
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)
    # もしentryが空ではなかったら
    unless entries.nil?
      # @roomに上記entryのroomを代入
      @room = entries.room
    else
      # それ以外は新しくroomを作る
      @room = Room.new
      @room.save
      # カレントユーザー分とチャット相手分のentry作る
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @direct_messages = @room.direct_messages
    @direct_message = DirectMessage.new(room_id: @room.id)
  end

  def create
    @direct_message = current_user.direct_messages.new(direct_message_params)
    @direct_message.save
    redirect_to request.referer
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:message, :room_id)
  end
end
