::SecureHeaders::Configuration.configure do |config|
  config.hsts = "max-age=631139040; includeSubdomains; preload"
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
  config.csp = {
    report_only: Rails.env.production?, # for the Content-Security-Policy-Report-Only header
    preserve_schemes: false, # default: false.

    default_src: %w(*), # all allowed in the beginning
    script_src: %w('self' 'unsafe-inline'), # scripts only allowed in external files from the same origin
    connect_src: %w('self'), # Ajax may connect only to the same origin
    style_src: %w('self' 'unsafe-inline'), # styles only allowed in external files from the same origin and in style attributes (for now)
    # report_uri: ["/csp_report?report_only=false"] # violation reports will be sent here
  }
end
