
Accesory.create!([
  {title: "Contact Here!", body: "<p><em><strong>Coming Soon!!!</strong></em></p>\r\n", acc_type: "Contact"},
  {title: "Terms and Conditions Here!", body: "<p><em><strong>Coming Soon!!!</strong></em></p>\r\n", acc_type: "Term"},
  {title: "About Here!", body: "<p><em><strong>Coming Soon!!!</strong></em></p>\r\n", acc_type: "About"}
])

User.create!([
  {firstname: "Blessing", lastname: "Alfred", othernames: "", occupation: "", username: "", email: "admin@yahoo.com", password_digest: "$2a$10$0UcqEHRl/2thQ/uTO9Xa6evUK56YgPTaOMWJhNLXCEQgZNxdoa8de", unit: "CAD", remember_digest: nil, role: "admin"},
])
