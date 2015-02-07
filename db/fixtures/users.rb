User.seed do |s|
  s.username = "admin"
  s.email  = "admin@gmail.com"
  s.password = "adminadmin"
  s.password_confirmation = "adminadmin"
  s.role = "admin"
end