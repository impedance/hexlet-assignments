require 'csv'
namespace :hexlet do
  desc "import users from csv"
  task :import_users, [:path] => :environment do |t, args|
    csv_lines = CSV.read(args[:path])
    users = csv_lines.drop(1)
    users.each do |user|
      date_string = user[2]
      date = Date.strptime(date_string, '%m/%d/%Y')

      new_user = User.new(
        first_name: user[0], last_name: user[1],
        birthday: date, email: user[3]
      )
      new_user.save
    end
  end
end
