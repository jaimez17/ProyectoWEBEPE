class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :empresa
  #belongs_to :role
  has_many :ticket
  has_many :comentario
  
  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end  
end
