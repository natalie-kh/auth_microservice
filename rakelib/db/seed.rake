# frozen_string_literal: true

namespace :db do
  desc 'Run database seeds'
  task seed: :settings do |_t, _args|
    require 'sequel'
    require 'sequel/extensions/seed'
    require './config/initializers/db'

    Sequel.extension :seed
    Sequel::Seed.setup :development
    seeds_path = File.expand_path('../../db/seeds', __dir__)

    Sequel.connect(Settings.db.to_hash) do |db|
      Sequel::Seeder.apply(db, seeds_path)
    end
  end
end
