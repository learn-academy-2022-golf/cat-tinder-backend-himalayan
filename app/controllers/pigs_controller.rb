class PigsController < ApplicationController
    def index
        pigs = Pig.all
        render json: pigs
    end
  
    def create
        pig = Pig.create(pig_params)
        render json: pig
    end
  
    def update
        pig = Pig.find(params[:id])
        pig.update(pig_params)
        if pig.valid?
            render json: pig
        else
            render json: pig.errors, status: :unprocessable_entity
        end
    end
  
    def destroy
        pig = Pig.find(params[:id])
        if pig.destroy
                render json: pig
        else
                render json: pig.errors, status: :unprocessable_entity
        end
    end
    private
    def pig_params
      params.require(:pig).permit(:name, :breed, :habits, :image)
    end
end
