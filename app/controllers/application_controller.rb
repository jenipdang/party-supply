class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :cannot_process

    private

    def record_not_found
        render json: { error: "Cannot locate resource with ID #{params[:id]}"}.to_json
    end

    def cannot_process(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
    
end
