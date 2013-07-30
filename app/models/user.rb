class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
           # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :as => :admin
  def to_s
  "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
