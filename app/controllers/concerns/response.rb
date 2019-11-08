# Code from Austin Kabiru at scotch.io

module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end
  end