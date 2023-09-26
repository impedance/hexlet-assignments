# frozen_string_literal: true

5.times do
  Task.create(
    name: Faker::Hacker.verb,
    creator: Faker::Name.name,
    completed: true
  )
end
