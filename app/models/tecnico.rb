class Tecnico < ApplicationRecord
	has_many :orden_fumigacions
	has_many :clientes, through: :orden_fumigacions
end
