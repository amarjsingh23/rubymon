class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  MONSTERS_SIZE = 20

  has_many :monsters, dependent: :destroy
  
  validates_each :monsters do |user, attr, value|
   user.errors.add attr, "too much monsters for user" if user.monsters.size > MONSTERS_SIZE
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      email = auth.info.email
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(
          email: email,
          password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end
