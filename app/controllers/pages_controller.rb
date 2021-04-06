class PagesController < ApplicationController
 before_action :authenticate_user!

	def home
    	@orden_fumigacions = OrdenFumigacion.all.order(:nro_ordfumigacion)
  	end

	def search
		puts "search__"	
    	if keyword.blank?
      		redirect_to(orden_fumigacions_path, alert: "Campo vacio!") and return
    	else
      		palabra = "%#{params[:keyword]}%"
      		@resultclientes = Cliente.all.where("apellido LIKE ? OR cuit LIKE ?",palabra,palabra)
      		puts "@__resultclientes:", @resultclientes
    	end

    	respond_to do |format|
      		format.html { redirect_to orden_fumigacions_url}
      		format.json { render json: @resultclientes }
      		format.js
    	end
    end	
end
