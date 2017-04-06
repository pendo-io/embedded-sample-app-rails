class User < ApplicationRecord
  DEFAULT_PASSWORD = "password"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.random
    new(
      email: Faker::Internet.unique.email,
      password: User::DEFAULT_PASSWORD,
      full_name: Faker::Name.name,
      account_id: SecureRandom.hex(6),
      account_name: Faker::Company.name
    )
  end
end
