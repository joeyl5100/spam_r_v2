class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  validate :email_domain

  def email_domain
    domain = email.split("@").last.downcase
    if !email.blank?
      errors.add(:email, "Invalid Domain- Please provide valid Grinnell email") if domain != "grinnell.edu"
    end
  end
end