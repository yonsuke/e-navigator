class UserMailer < ApplicationMailer

  def request_interview(to_email, from_user)
    @from_user = from_user

    mail(
      to: to_email,
      subject: '面談日時を承認してください'
    ) do |format|
      format.html
    end
  end
end
