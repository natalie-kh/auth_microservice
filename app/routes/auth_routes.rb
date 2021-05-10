# frozen_string_literal: true

class AuthRoutes < Application
  helpers Auth

  post '/' do
    Thread.current[:request_id] = request.env['HTTP_X_REQUEST_ID'] if request.env['HTTP_X_REQUEST_ID']

    result = Auth::FetchUserService.call(extracted_token['uuid'])

    if result.success?
      meta = { user_id: result.user.id }

      status 200
      json meta: meta
    else
      status 403
      error_response(result.errors)
    end
  end
end
