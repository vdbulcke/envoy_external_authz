# package envoy.authz

# import input.attributes.request.http as http_request

# default allow = false

# token = {"valid": valid, "payload": payload} {
#     [_, encoded] := split(http_request.headers.authorization, " ")
#     [valid, _, payload] := io.jwt.decode_verify(encoded, {"secret": "secret"})
# }

# allow {
#     is_token_valid
#     action_allowed
# }

# is_token_valid {
#   token.valid
#   ## INFO: disable token expiration for demo
#   # token.payload.nbf <= time.now_ns() < token.payload.exp
# }

# action_denied {
# # action_allowed {
#   http_request.method == "GET"
#   token.payload.role == "guest"
#   glob.match("/get*", [], http_request.path)
# }

# action_allowed {
#   http_request.method == "GET"
#   token.payload.role == "admin"
#   glob.match("/get*", [], http_request.path)
# }

# action_allowed {
#   http_request.method == "POST"
#   token.payload.role == "admin"
#   glob.match("/people*", [], http_request.path)

#   lower(input.parsed_body.firstname) == token.payload.sub
# }
package envoy.authz


default allow = {
  "allowed": false,
  "headers": {"x-ext-auth-allow": "no", "Location": "https://example.com"},
  "body": "Unauthorized Request",
  "http_status": 302
}

allow = response {
  input.attributes.request.http.method == "POST"
  response := {
    "allowed": true,
    "headers": {"x-ext-auth-allow": "yes"}
  }
}