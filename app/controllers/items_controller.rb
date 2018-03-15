class ItemsController < ApplicationController


def index

		@item = Item.all

		render :index

	end 

	def new 

		@item = Item.new # the html will have access to the blank employee

		render :new

	end

	def create 

		@item = Item.new(item_params) # create a new index but use the new params 

		if(@item.save)
			redirect_to "/" # redirect to the index page once created
		end

	end 

	def edit 
		id = params[:id]
		@item = Item.find(id)

		render :edit
	end 

	def show


		@item = Item.find(params[:id].to_i)
		render :show

	end

	def item_params

		params.require(:item).permit(:id, :serial_number, :description, :supplier, :status, :lender) # grab the params and have access to the stuff

	end

	def update 

		id = params[:id]
		@item = Item.find(id)

		@item.update(item_params)

		redirect_to "/"


	end 

	def destroy

		id = params[:id]
		@item = Item.find(id)

		@item.delete

	end


end
