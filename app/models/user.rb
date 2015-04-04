class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:linkedin]

  acts_as_messageable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # binding.pry
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

   popular

  # You can also use a symbol here but the friendship won't be passed to your method
  after_befriend 'notify_friendship_created value'
  after_unfriend 'notify_unfriended value'

  def notify_friendship_created(friendship)
    puts "#{name} friended #{friendship.friend.name}"
  end

  def notify_unfriended(friendship)
    puts "#{name} unfriended #{friendship.friend.name}"
  end

    # @justin = User.create name: "Justin"
    # @jenny = User.create name: "Jenny"

  user.name.befriend user.name #=> "Justin friended Jenny"
  user.name.unfriend user.name #=> "Justin unfriended Jenny"
end
