# frozen_string_literal: true

class User < Sequel::Model
  plugin :secure_password, include_validations: false

  one_to_many :sessions, class: :UserSession

  NAME_FORMAT = %r{\A\w+\z}.freeze

  def validate
    super
    validates_presence :name
    validates_presence :email
    validates_presence :password if new?
    validates_format NAME_FORMAT, :name, message: 'Укажите имя, используя буквы, цифры или символ подчёркивания'
  end
end
