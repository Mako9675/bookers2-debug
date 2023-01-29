
if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.position = 'bottom-left'
  Rack::MiniProfiler.config.auto_inject = false
end