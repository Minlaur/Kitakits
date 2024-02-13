# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'net/http'
require 'json'

expert_tags = [
   "visa",
   "taxes",
   "employment",
   "communication",
]

topic_tags = [
  "visa",
  "taxes",
  "employment",
  "communication",
  "marriage",
  "childcare",
  "lifestyle",
]

topics = [
  { name: "Visa renewal", description: "Hi, I'm a digital nomad and I need advice on my visa renewal application process."},
  { name:"Visa", description: "Hola, necesito ayuda con mi declaración de impuestos."},
  { name:"Visa", description: "Bonjour, je suis un étudiant et j'ai besoin d'aide pour rédiger mon CV."},
  { name:"Visa", description: "Hallo, ich bin ein digitaler Nomade und ich brauche Hilfe bei meinem Visumverlängerungsantrag."},
  { name:"Visa", description: "Olá, sou um estudante e preciso de ajuda para escrever meu currículo."},
  { name:"Visa", description: "Привет, я цифровой кочевник и мне нужна помощь в моем заявлении на продление визы."},
  { name:"Visa", description: "你好，我是一名数字游牧民，我需要帮助办理签证续签申请。"},
  { name:"Visa", description: "안녕하세요, 나는 디지털 노마드이며 비자 갱신 신청 절차에 대한 도움이 필요합니다."},
  { name:"Work communication", description: "Hi, I am non-Japanese and work for a large corporation. I am having trouble with cross-functional commuication with a different department. I would like to discuss and get advice."},
  { name:"Comunicación laboral", description: "Hola, soy no japonés y trabajo para una gran corporación. Tengo problemas con la comunicación interfuncional con un departamento diferente. Me gustaría discutir y obtener consejos."},
  { name:"Communication professionnelle", description: "Bonjour, je suis non japonais et travaille pour une grande entreprise. J'ai des problèmes de communication interfonctionnelle avec un département différent. J'aimerais discuter et obtenir des conseils."},
]


puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
users = [
  { first_name: "Martin",
    last_name: "Portal",
    email: "mail@mail.com",
    password: "secret",
    password_confirmation: "secret",
    sempai: true,
    occupation: "Engineer",
    background: "I have been working in Japan for 5 years and I have experience in the tech industry.",
    nationality: "French",
    language: "French",
    nickname: "Marty"
  },
  { first_name: "Laurice",
    last_name: "Port",
    email: "abc@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Dillion",
    last_name: "Porto",
    email: "123@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Jon",
    last_name: "Port",
    email: "abc123@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Mary",
    last_name: "Porto",
    email: "456@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Min",
    last_name: "Portal",
    email: "abc456@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Ali",
    last_name: "Portal",
    email: "789@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Jun",
    last_name: "Port",
    email: "abc789@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Bob",
    last_name: "Porto",
    email: "xyz@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
  { first_name: "Coco",
    last_name: "Portal",
    email: "xyz123@mail.com",
    password: "secret",
    password_confirmation: "secret"
  },
]

users.each do |user_data|
  user = User.create(user_data)
  t = Topic.new(topics.sample)
  t.user = user.sample
  t.save
  if user.sempai
    user.expertises_list.add(*expert_tags)
    user.save
  else
    user.tags_list.add(*topic_tags)
    user.save
  end
  # t.each do |tag|
  #   ActsAsTaggableOn::Tag.new(tags[:category]).save
end
puts "done"

# fetching api to create random users with restapi

# 10.times do |i|
#   url = URI("https://randomuser.me/api/")
#   response = Net::HTTP.get(url)
#   json = JSON.parse(response)
#   results = json["results"]
#   results.each do |result|
#   user = User.create(
#     first_name: result["name"]["first"],
#     last_name: result["name"]["last"],
#     email: result["email"],
#     password: "password",
#     password_confirmation: "password",
#   )
#   user.topics.create(topics.sample)
#   end
# end
# puts "done"

# fetching api to create random nationalities with restapi
# puts "Creating nationalities..."
# 10.times do |i|
#   url = URI("https://randomuser.me/api/")
#   response = Net::HTTP.get(url)
#   json = JSON.parse(response)
#   results = json["results"]
#   results.each do |result|
#   Nationality.create(
#     nationality: result["nat"],
#   )
#   end
# end
# puts "done"

# puts "Creating Languages..."

# languages = [
#   {language: "English"},
#   {language: "Spanish"},
#   {language: "French"},
#   {language: "German"},
#   {language: "Portuguese"},
#   {language: "Russian"},
#   {language: "Chinese"},
#   {language: "Korean"},
#   {language: "Spanish"},
#   {language: "French"},
# ]

# 10.times do |i|
#   selected_language = languages.sample
#     Language.create!(
#       # language
#     language: selected_language[:language],
#   )
#   end
#   puts "done"


# puts "Creating Topics..."


# 10.times do |i|
#   selected_topic = topics.sample
#     Topic.create!(
#       description: selected_topic[:description],
#     )
# end
# puts "done"

# puts "Creating availabilities..."
# 10.times do |i|
# Availablity.create!(
#   # start_date, end_date, status
#   datetime: Faker::Time.between(from: DateTime.now - 5, to: DateTime.now),
#   status: "pending",
#   user: User.all.sample,
#   service: Service.all.sample
# )
# end
# puts "done"

# puts "Creating bookings..."
# 10.times do |i|
# Booking.create!(
#   # start_date, end_date, status, comment
#   status: "pending",
#   user: User.all.sample,
#   topic: Topic.all.sample
# )
# end
# puts "done"
