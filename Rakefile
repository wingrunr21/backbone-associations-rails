require "bundler/gem_tasks"
require 'open-uri'
require 'json'


# Helper Functions
def name
  @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

def latest_tag
  tags = JSON.parse(open('https://api.github.com/repos/dhruvaray/backbone-associations/tags').read)
  tags.sort!{|a,b| b["name"] <=> a["name"]}
  tags.first
end

namespace :backbone_associations do

  desc "Fetches and displays the latest backbone-associations tag"
  task :latest do
    tag = latest_tag
    puts "The latest backbone-associations tag is #{tag["name"]} with commit #{tag["commit"]["sha"]}"
  end

  desc "Updates the vendored backbone-associations version to the latest tag"
  task :update do
    tag = latest_tag

    # Pull attributes we need
    name = tag["name"]
    sha = tag["commit"]["sha"]

    # Cleanup the name
    name.gsub!(/^v/, '')
    name.gsub!(/-/, '.')

    if name == version
      puts "Gem version #{version} matches the latest backbone-associations version #{name}"
      exit
    end

    # Update backbone-associations
    puts "Updating backbone-associations..."
    base_url = "https://raw.githubusercontent.com/dhruvaray/backbone-associations/#{sha}"
    files = %w{backbone-associations.js backbone-associations-min.js backbone-associations.js.map}
    Dir.chdir './vendor/assets/javascripts' do
      files.each {|file| `curl -O #{base_url}/#{file}`}
    end

    # Fix the .map file's name so the asset pipeline doesn't choke on it
    `mv ./vendor/assets/javascripts/backbone-associations.js.map ./vendor/assets/javascripts/backbone-associations.map`

    # Update version file
    puts "Updating version.rb..."
    `sed -i "" "s/      VERSION = '.*'/      VERSION = '#{name}'/g" lib/backbone-associations-rails/version.rb`
  end
end
