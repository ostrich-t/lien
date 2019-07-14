class NotificationMailer < ApplicationMailer
  def send_mail(user)
    @user = user
    mail(
      to:   @user.email,
      from: Rails.application.credentials.email_address,
      subject: '会員登録が完了しました。'
    )
  end
end
