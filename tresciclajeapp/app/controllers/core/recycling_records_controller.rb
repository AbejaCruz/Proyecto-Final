class Core::RecyclingRecordsController < ApplicationController
  layout 'platform'

  def new    
    @sources = resolve_sources
    @recycling = RecyclingRecord.new
  end

  def create    
    @recycling = RecyclingRecord.new(recycling_params)
    @recycling.user_id = current_user.id
    if @recycling.save
      redirect_to core_recycling_records_path
    end
  end

  def index
    @recycling = resolve_records
  end
end

private

def resolve_records
  return RecyclingRecord.all if supplier?
  return RecyclingRecord.where(user_id: current_user.id) if recycler?
end

def resolve_sources  
  return Source.where(name: "Sin Especificar") if supplier?
  return Source.where(zone_id: current_user.zone_id) if recycler?
end

def recycling_params
  params.require(:recycling_record).permit(:source_id, :weight)  
end
