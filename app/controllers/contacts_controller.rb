class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # 入力内容確認画面
  def confirm
    @contact = Contact.new(contact_params)
    # 入力NGだった場合はrenderで返す
    if @contact.invalid?
      render :new
    end
  end

  # 入力に誤りがあった場合、backアクションで戻る（入力内容は保持されたまま）
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      redirect_to thanks_path
    else
      render :new
    end
  end

  # thanks画面
  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :name, :email, :tel, :message)
  end
end
