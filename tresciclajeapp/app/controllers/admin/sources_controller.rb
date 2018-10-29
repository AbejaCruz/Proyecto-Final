class Admin::SourcesController < ApplicationController
	layout 'platform'

	def index
		@location[:sub_menu] = 'list_source'
		@sources = Source.all
	end
	
	def new
		@location[:sub_menu] = 'new_source'		
	end
	
	def edit
		@location[:sub_menu] = 'edit_source'
	end

	def show
			
	end

	def create
		@source = Source.new(source_params)
		if @source.save
			redirect_to sources_path
		else
		end
	end


	private

	def source_params
		params.require(:source).permit(:name, :address, :kind, :admin_name, :amount_of_people, :number_of_floors, :apt_per_floor, :blocks, :zone_id)
	end
end