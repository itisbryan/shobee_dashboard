# frozen_string_literal: true

namespace :ridgepole do
  desc 'Apply ridgepole Schema file'
  task apply: :environment do
    ridgepole('--apply')
  end

  desc 'Export ridgepole Schema file'
  task export: :environment do
    ridgepole('--export')
  end

  private

  def config_file
    if Rails.env.development?
      'config/database.yml'
    elsif Rails.env.staging?
      'config/database.staging.yml'
    elsif Rails.env.production?
      'config/database.production.yml'
    else
      raise 'no configuration specified'
    end
  end

  def ridgepole(*options)
    options.each do |opt|
      puts `bundle exec ridgepole #{opt} -E #{Rails.env} -c #{config_file} -f db/Schemafile`
    end
  end
end
