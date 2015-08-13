class RegisteredApplication< ActiveRecord::Base
  belongs_to :user


  validate :validate_url

  private

  def validate_url
    errors.add(:url, "is taken") if RegisteredApplication.exists?(self.url)
  end
end
