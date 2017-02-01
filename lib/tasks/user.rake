namespace :user do
  task :lancement => :environment do
    users = User.all
    users.each do |user|
      user.send_confirmation_instructions
      UserMailer.lancement(user).deliver_later
    end
  end
end
