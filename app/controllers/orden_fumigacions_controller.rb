class OrdenFumigacionsController < ApplicationController
  def index
    @orden_fumigacions = OrdenFumigacion.all.order(:nro_ordfumigacion)
      respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'orden_fumigacions/pdf', pdf: 'Reporte'
      end
    end
  end

  def new
    @orden_fumigacion = OrdenFumigacion.new
  end

  def show
    # No lo usamos en este modelo
  end

  def create
    @orden_fumigacion = OrdenFumigacion.new(orden_fumigacion_params)

    @orden_fumigacion.update baja: true

    respond_to do |format|
      if @orden_fumigacion.save
        format.html { redirect_to orden_fumigacions_path, notice: 'La orden_fumigacion fue exitosamente creada.' }
        format.json { render :show, status: :created, location: @orden_fumigacion }
      else
        format.html { render :new }
        format.json { render json: @orden_fumigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
  end

  def update
        @orden_fumigacion = OrdenFumigacion.find(params[:id])
      if @orden_fumigacion.update(orden_fumigacion_params)
        redirect_to orden_fumigacions_path
      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    @orden_fumigacion.update baja: false
    respond_to do |format|
      format.html { redirect_to orden_fumigacions_url, notice: 'La orden_fumigacion fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_fumigacion
      @orden_fumigacion = OrdenFumigacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_fumigacion_params
      params.require(:orden_fumigacion).permit(:cliente_id, :tecnico_id, :nro_ordfumigacion, :nro_certificado, :tipo_certificado, :fecha_aplicacion, :hora_aplicacion, :tratamiento, :vector, :superficie, :veneno, :droga, :observaciones_ordfumigacion, :fecha_vencimiento, :proximo_tratamiento, :importe, :estado, :baja)
    end
end