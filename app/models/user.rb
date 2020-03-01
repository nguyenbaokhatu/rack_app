class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :products

  unless ActiveRecord::Base.connection.table_exists?('users')
    connection.create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end

  before_create :normalize_email
  after_create :send_welcome_email
  after_commit :send_welcome_email

  private

  def normalize_email
    self.email = self.email.downcase
  end

  def send_welcome_email
    puts "Send welcome email!!!"
  end

end
