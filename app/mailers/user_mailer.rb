class UserMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

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
    @interview = Interview.find_by(user_id: to_user.id, status: :approved)

    mail(
      to: to_user.email,
      subject: '面談日時が確定しました'
    ) do |format|
      format.html
    end
  end
end
