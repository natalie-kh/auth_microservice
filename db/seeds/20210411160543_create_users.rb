# frozen_string_literal: true

require './app/models/user'

Sequel.seed do
  def run
    [
      ['buddy', 'labrador@mail.ru', 'password'],
      ['buddy2', 'labrador2@mail.ru', 'password2']
    ].each do |name, email, password|
      User.create name: name, email: email, password: password
    end
  end
end
