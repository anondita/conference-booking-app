User.create!(name:  "Example User",
             email: "example@commutatus.com",
             password:              "foobar",
             password_confirmation: "foobar",
admin:true,
activated: true,
             activated_at: Time.zone.now)


User.create!(name: "Anondita",
  email: "anondita@commutatus.com",
  password: "anondita97",
  password_confirmation: "anondita97",
  admin:true,
  activated:true,
  activated_at: Time.zone.now)

User.create!(name: "Anondita",
  email: "anondita97@commutatus.com",
  password: "anondita",
  password_confirmation: "anondita",
  activated:true,
  activated_at: Time.zone.now)

User.create!(name: "Anondita",
  email: "vishnuacareer@commutatus.com",
  password: "anondita",
  password_confirmation: "anondita",
  activated:true,
  activated_at: Time.zone.now)

