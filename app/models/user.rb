class User < ActiveRecord::Base
	
	has_many :messages
	has_many :chats, through: :messages
	has_many :chats

	has_many :tests	

	has_one :bank_account
	has_many :owner_records, :class_name => 'Record', :foreign_key => 'owner_id'
	has_many :receiver_records, :class_name => 'Record', :foreign_key => 'receiver_id'	

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         	:recoverable, :rememberable, :trackable, :validatable

   	
    validates :name, presence: true	
   	validates :rut, presence: true, rut: true, uniqueness: true
   	validates :user_type, presence: true, inclusion: { in: %w( Alumno Ayudante Profesor ) } 


   	# Método de busquedad
   	def self.search(search)
   		#Declarar los campos donde buscar al realizar una consulta
   		where("name LIKE ? OR rut LIKE ? OR email LIKE ? OR user_type LIKE ?",
   			"%#{search}%",
   			"%#{search}%",
   			"%#{search}%",
   			"%#{search}%"
   			)
   	end
   	#Nota: "LIKE" solo funciona con SQLite y Mysql
   	#Para Postgresql se usa "ILIKE"

end
