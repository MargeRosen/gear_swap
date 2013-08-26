class User < ActiveRecord::Base
  attr_accessible :email, :login, :name

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable  #:token_authenticable,

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :as => :admin

  def to_s
  "#{email} (#{admin? ? "Admin" : "User"})"
  end
#Should add checks on email or username?
  #validates_presence_of :username
  #validates_uniqueness_of :username

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.confirm!
      if user.save
        logger.info "user was saved"
      else
        logger.info "user was not saved"
      end
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

  private

  #def new_secure_random_password
    #"S3cur34U"
  #end
end
