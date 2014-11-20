class Challenge < ActiveRecord::Base
  has_many :supports

  validates :title, presence: true, length: {minumum: 3}
  validates :body, presence: true, length: {minumum: 30}

  before_save :set_body_to_default_value

  private

  def set_body_to_default_value
    self.body = "Un valor por defecto" if body.blank?
  end
end
