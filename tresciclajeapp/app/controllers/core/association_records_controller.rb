class Core::AssociationRecordsController < ApplicationController
  layout 'platform'

  def new
    @materials = Material.all
    @detail = Detail.new
  end

  def create   
    @detail = AssociationRecord.new(detail_params)    
  end

end

private

def association_params
  params.require(:association_record).permit(:carton_weight,:archivo_weight, :revista_weight, :plegadiza_weight, :periodico_weight, :rev_con_cristal_weight, :rev_sin_cristal_weight, :vasi_sop_weight, :pvc_weight, :plastico_weight)
end