class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  has_and_belongs_to_many :wagers

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
  user
  end

  # Notice that Devise RegistrationsController by default calls "User.new_with_session" 
  # before building a resource. This means that, if we need to copy data from session whenever 
  # a user is initialized before sign up, we just need to implement new_with_session in our model. 
  # Here is an example that copies the facebook email if available:
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)


end
