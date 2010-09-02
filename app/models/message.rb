class Message
  include Mongoid::Document
  
  field :title
  field :content
  embedded_in :user, :inverse_of => :messages
end