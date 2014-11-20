class Support < ActiveRecord::Base
  belongs_to :challenge

  validates :email, uniqueness: {scope: :challenge},
                    presence: true,
                    format: {with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i}
end
