class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_support(challenge, support)
    @challenge = challenge
    @support   = support

    mail(to: 'ferblape@gmail.com',
         from: 'myapp@example.com',
         subject: "Nueva firma en #{challenge.title}")
  end
end
