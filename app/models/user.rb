class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.email = auth.info.email
    user.name = auth.info.name
    user.nickname = auth.info.nickname
    user.bio = auth.extra.raw_info.bio
    user.website = auth.info.urls.Blog
    user.avatar = auth.info.image
    user.save
    user
  end
end
