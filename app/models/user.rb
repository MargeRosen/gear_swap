class User < ActiveRecord::Base
  attr_accessible :email, :login, :name, :username, :password, :password_confirmation

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable  #:token_authenticable,

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :admin, :as => :admin


# Should add checks on email or username?
  #validates_presence_of :username
  #validates_uniqueness_of :username

  def display_name
    if twitter_id
     # "#{twitter_display_name} (@#{twitter_screen_name})"
      "#{username} (@#{twitter_screen_name})"
    else
      email
    end
  end

  def to_s
   #{}"#{display_name} (#{admin? ? "Admin" : "User"})"
   "#{email} (#{admin? ? "Admin" : "User"})"
  end

  #def self.find_or_create_for_twitter(response)
  #  data = response['extra']['user_hash']
  #  if user = User.find_by_twitter_id(data["id"])
  #    user
  #  else # Create a user with a stub password.
  #    user = User.new(:email => "twitter+#{data["id"]}@example.com",
  #                  :password => Devise.friendly_token[0,20])
  #    user.twitter_id = data["id"]
  #    user.twitter_screen_name = data["screen_name"]
  #    user.twitter_display_name = data["display_name"]
  #    user.confirm!
  #    user
  #  end
  #end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid )).first_or_create do |user|
      user = User.new(:email => "twitter+#{data["id"]}@example.com",
        :password => Devise.friendly_token[0,20])
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.confirm!
      user
    end
  end

  def self.new_with_sesson(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
