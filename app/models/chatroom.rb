class Chatroom < ApplicationRecord
  #callbacks
  before_destroy :deconstruct
  #validations
  validates   :topic,     presence: true, case_sensitive: false

  #beloings_to
  belongs_to  :shoot
  belongs_to  :proposal,  optional: true

  #has_many
  has_many    :messages,  dependent: :destroy
  has_many    :users,     through: :messages

  paginates_per 10

  #class methods
  def self.create_for_shoot (options = {})
    @chatroom = Chatroom.new
    @chatroom.topic = options[:topic] ? options[:topic] : "Chatroom for Shoot: #{options[:shoot_id]}"
    @chatroom.shoot_id = options[:shoot_id] ? options[:shoot_id] : nil
    @chatroom.save!
    @chatroom
  end

  def deconstruct
    self.messages.destroy_all
  end
end

