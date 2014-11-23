class Challenge < ActiveRecord::Base

  has_many :supports, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 30}

  PER_PAGE = 10



  mount_uploader :poster, PosterUploader



  def self.paginate(page)
    if page
      offset = (page.to_i-1)*PER_PAGE
      offset(offset)
    else
      where("1=1")
    end
  end
end
