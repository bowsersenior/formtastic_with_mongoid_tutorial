class User
  include Mongoid::Document

  field :name
  field :email
  field :active, :type => Boolean
  
  # :stored_as => :array is important to getting Formtastic to work
  references_many :user_types, :stored_as => :array, :inverse_of => :users do
    def to_s
      @target.map(&:name).join(', ')
    end
  end
  embeds_many :messages
  
  accepts_nested_attributes_for :messages, :allow_destroy => true, :reject_if => proc { |attributes| attributes['name'].blank? and attributes['_destroy'].blank? }
end