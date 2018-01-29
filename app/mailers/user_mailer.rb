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

  def approve_interview(to_user, from_user)
    @to_user = to_user
    @from_user = from_user
    @interview = Interview.find(to_user.id).approved

    mail(
      to: to_email,
      subject: '面談日時が確定しました'
    ) do |format|
      format.html
    end
  end
end
