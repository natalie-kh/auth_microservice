# frozen_string_literal: true

class UserSessionRoutes < Application
  post '/' do
    session_params = validate_with!(SessionParamsContract)

    result = UserSessions::CreateService.call(*session_params.to_h.values)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)
      meta = { token: token }

      status :created
      json meta: meta
    else
      status 403
      error_response result.session || result.errors
    end
  end
end
