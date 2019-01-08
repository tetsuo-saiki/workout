class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true
  validates :sex, presence: true
  validates :birth_day, presence: true
  validates :profile, length: {maximum: 255}
  validates :bench_press_max, allow_blank: true, numericality: true
  validates :squat_max, allow_blank: true, numericality: true
  validates :deadlift_max, allow_blank: true, numericality: true

  has_many :posts
  has_many :comments

  mount_uploader :image, UserImageUploader

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end