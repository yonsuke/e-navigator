class UserMailer < ApplicationMailer

  # 既存システムとの連結後、引数として送信先（面接官）のメールアドレスを受け取るように修正する
  # def request_interview(to_email)
  def request_interview
    # 既存システムとの連結まで宛先を自分にする
    to_email = ENV["MAILER_USER_NAME"]

    mail(
      to: to_email,
      subject: '面談日時を承認してください'
    ) do |format|
      format.html
    end
  end
end
