# Rot13

def rot13(s)
  s.tr("A-MN-Za-mn-z", "N-ZA-Mn-za-m")
end

# Signup

def valid_username(s)
  s =~ /^[0-9A-Za-z_-]{3,20}$/
end

def valid_password(s)
  s =~ /^.{3,20}$/
end

def valid_email(s)
  s =~ /^[\S]+@[\S]+\.[\S]+$/
end

