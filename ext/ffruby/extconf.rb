#!/usr/bin/env ruby

require "mkmf"

dir_config("ffmpeg", [ "/usr/include", "/usr/local/include", "/usr/local/include/ffmpeg1", "/opt/include", "/opt/local/include" ], [ "/lib", "/usr/lib", "/usr/local/lib" ])

%w( avformat avcodec ).each do |lib|
  header = "#{lib}.h"
  result = false

  [ "lib#{lib}", "ffmpeg" ].each do |dir|
    path = File.join(dir, header)

    if checking_for(path) { try_cpp(cpp_include(path)) }
      result = path
      break
    end
  end

  $defs.push "-D#{lib.upcase}_H_PATH=\"<#{result || header}>\""
end

have_library("avformat")
have_library("avcodec")

create_makefile("ffruby")
