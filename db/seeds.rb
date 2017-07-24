class Seed
  def self.begin
    self.reset_db
    seed = Seed.new

    seed.generate_admin
    seed.generate_stories
  end

  def generate_admin
    user = User.create email: "admin@gmail.com", password: "password", password_confirmation: "password"
    user.update_attribute :admin, true
    user.account.update_attribute :name, 'alfred the undying'
  end

  def generate_stories
    user = User.first
    20.times do |index|
      Story.create(title: Faker::Book.title, description: Faker::Lovecraft.paragraph(4, 6), account_id: user.account.id)
    end
  end

  def self.reset_db
    User.destroy_all
  end
end

Seed.begin
