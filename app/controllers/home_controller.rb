require 'expert'

class HomeController < ApplicationController
  
  def index
  end

  def create
    expert = Expert.new
    
    expert.resolve(params_permit)

    respond_to do |format|
      format.json { render json: expert.resolve(params_permit), status: :ok }
      format.html {}
    end
  end

  private

  def params_permit
    params.require(:facts).permit(:typed, :type_inheritance, :encapsulation,
      :mutation, :side_effects, :pattern_matching, :lambdas, :type_inference,
      :duck_typing, :simple_syntax, :clear_documentation, :actors,
      :lazy_evaluation, :macros, :type, :platform)
  end
end
