[ 'Student',
  'Admin',
  'Guest'
].each do |name| 
  UserType.create(:name => name)
end