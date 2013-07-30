require 'rubygems'
require 'rake'

RDOC_FILES = [ "README.rdoc", "ext/ffruby/ffruby{file,stream,}.c" ]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ffruby"
    gem.version = File.read('VERSION')
    gem.license = "LGPL-2.1"
    gem.author = "James Le Cuirot"
    gem.email = "chewi@aura-online.co.uk"
    gem.rubyforge_project = "ffruby"
    gem.homepage = "http://rubyforge.org/projects/ffruby/"
    gem.summary = "A Ruby interface to FFmpeg's libavformat and libavcodec."
    gem.description = "A Ruby interface to FFmpeg's libavformat and libavcodec. It allows you to query metadata from a wide variety of media files through some simple classes."
    gem.requirements = "FFmpeg libraries and also development headers if building."
    gem.files = RDOC_FILES + [ "LICENSE", "Rakefile", "VERSION", "ext/ffruby/{extconf.rb,ffruby.h}" ]
    gem.extra_rdoc_files = RDOC_FILES 
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
    rubyforge.remote_doc_path = ""
  end
rescue LoadError
  puts "To prepare a gem, please install the jeweler gem."
end

begin
  require 'rdoc/task'
  RDoc::Task.new do |rdoc|
    rdoc.rdoc_dir = 'rdoc'
    rdoc.title = "FFruby " + File.read('VERSION')
    rdoc.rdoc_files.include *RDOC_FILES
  end
rescue LoadError
  puts "To build the documentation, please install the rdoc gem."
end

begin
  require 'rake/extensiontask'
  Rake::ExtensionTask.new('ffruby')
  task :default => :compile
rescue LoadError
  puts "To build the library, please install the rake-compiler gem."
end
