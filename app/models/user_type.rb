class UserType
  include Mongoid::Document
  
  field :name
  
  references_many :users, :stored_as => :array, :inverse_of => :user_types
  
  validates :name, :presence => true, :uniqueness => true
end