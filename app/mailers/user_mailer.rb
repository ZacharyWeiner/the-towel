class UserMailer < ApplicationMailer
  default from: 'no-reply@the-towel.herokuapp.com.com',
          return_path: 'the-towel@the-towel.herokuapp.com'
  def send_invite(email, group_name, content)
    @email = email
    @group_name  = group_name
    @content = content
    mail(to: @email, subject: "Youve been Invited to Join #{@group_name}")
  end
end
