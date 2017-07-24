class Seed
  def self.begin
    self.reset_db
    seed = Seed.new

    seed.generate_admin
  end

  def generate_admin
    user = User.create email: "admin@gmail.com", password: "password", password_confirmation: "password"
    user.update_attribute :admin, true
  end

  def self.reset_db
    User.destroy_all
  end
end

Seed.begin
