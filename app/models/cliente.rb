class Cliente < ApplicationRecord
	has_many :orden_fumigacions
	has_many :tecnicos, through: :orden_fumigacions

    TIPO_CLIENTE = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']
end
