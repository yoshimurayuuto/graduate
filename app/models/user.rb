class User < ApplicationRecord
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :shares, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :articles


  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  
  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def to_name
    self.email.split("@")[0]
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:twitter, :facebook, :google]
  
  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
  
    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      name: auth.info.name,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.skip_confirmation!
    user.save
    user
  end

  class << self
    def find_or_create_for_oauth(auth)
      user = User.find_by(email: auth.info.email)
  
      unless user
        user = User.new(email: auth.info.email,
                        provider: auth.provider,
                        name: auth.info.name,
                        uid:      auth.uid,
                        password: Devise.friendly_token[0, 20],
                                    )
      end
      user.skip_confirmation!
      user.save
      user
    end

    def new_with_session(params, session)
      if user_attributes = session['devise.user_attributes']
        new(user_attributes) { |user| user.attributes = params }
      else
        super
      end
    end
  end
  
end
