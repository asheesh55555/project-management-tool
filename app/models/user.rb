class User < ApplicationRecord
  rolify
  include Authority::UserAbilities
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :team, optional: true  
  has_many :user_projects
  has_many :projects, through: :user_projects


  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
