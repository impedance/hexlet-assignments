# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :name, :status, :creator, :completed
end
