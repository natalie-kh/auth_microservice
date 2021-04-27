# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password { 'givemeatoken' }
  end
end
