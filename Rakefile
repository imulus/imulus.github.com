#!/usr/bin/env rake

require 'rubygems'
require 'coyote'

task :default => :build

desc "Compile both Sass and JavaScript source files"
task :build, :environment do |task, args|
  @environment = args[:environment] || 'development'
  Rake::Task["js:build"].invoke
  Rake::Task["sass:build"].invoke
end


namespace :sass do
  config = {}

  task :configure do
    config[:input]  = 'src/stylesheets/style.scss'
    config[:output] = 'wwwroot/css/style.css'
    config[:style]  = 'nested'

    if @environment == 'production'
      config[:style] = 'compress'
    end
  end

  desc "Compile Sass from source"
  task :build => :configure do
    sh "sass #{config[:input]}:#{config[:output]} --style #{config[:style]}"
  end

  desc "Watch Sass source files for changes and recompile automatically"
  task :watch => :configure do
    sh "sass #{config[:input]}:#{config[:output]} --style #{config[:style]} --watch"
  end
end


namespace :js do
  config = Coyote::Configuration.new

  task :configure do
    config.inputs = ['scripts/app.coffee']
    config.output = "scripts/scripts.js"
    config.options['verbose'] = true
    if @environment == 'production'
      config.options['compress'] = true
    end
  end

  desc "Compile JavaScript and CoffeeScript from source"
  task :build => :configure do
    Coyote::build config
  end

  desc "Watch JS/CS source files for changes and recompile automatically"
  task :watch => :configure do
    Coyote::watch config
  end
end
