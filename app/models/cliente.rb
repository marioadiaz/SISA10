class Cliente < ApplicationRecord
	has_many :orden_fumigacions
	has_many :tecnicos, through: :orden_fumigacions
end
