class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :notes, type: String

  has_many :posts

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name_with_initial
    "#{first_name} #{last_name}"
  end
end