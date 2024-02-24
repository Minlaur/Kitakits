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
    language: "French",
    nationality: "France",
    nickname: "Marty",
    occupation: "immigration lawyer",
    background: "Marty is a registered lawyer in both France and Japan. He is a registered foreign lawyer(Gaikokuho Jimu Bengoshi) with 20 yrs of experience in Japan",
    web_url: "www.linkedin.com/MartinPortal",
    sempai: true,
  },
  { first_name: "Laurice",
    last_name: "Port",
    email: "abc@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Philippines",
    nickname: "Laur",
    occupation: "Immigration Consultant",
    background: "After obtaining her Master's in social services, Laur has worked in the Ministry of Foreign Affairs. Currently, she works in the Tokyo city office",
    web_url: "www.linkedin.com/LauricePort",
    sempai: true,
  },
  { first_name: "Taro",
    last_name: "Porto",
    email: "123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "Japanese",
    nationality: "Japan",
    nickname: "T-man",
    occupation: "HR Director",
    background: "T-man has a degree in labor law and has specialized in labor relations in both Japanese and non-Japanese corporations for the past 15 years. Currently, he is the HR director in a non-Japanese company.",
    web_url: "www.linkedin.com/TaroPorto",
    sempai: true,
  },
  { first_name: "Javier",
    last_name: "Port",
    email: "abc123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Mexico",
    nickname: "Javo",
  },
  { first_name: "Mary",
    last_name: "Porto",
    email: "456@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "United Kingdom",
    nickname: "Britgirl",
  },
  { first_name: "Min",
    last_name: "Portal",
    email: "abc456@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "South Korea",
    nickname: "Gamer",
  },
  { first_name: "Ali",
    last_name: "Portal",
    email: "789@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Indonesia",
    nickname: "Traveller",
  },
  { first_name: "Annu",
    last_name: "Port",
    email: "abc789@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "India",
    nickname: "Designer",
  },
  # { first_name: "Bob",
  #   last_name: "Porto",
  #   email: "xyz@mail.com",
  #   password: "secret",
  #   password_confirmation: "secret"
  # },
  # { first_name: "Mimi",
  #   last_name: "Portal",
  #   email: "xyz123@mail.com",
  #   password: "secret",
  #   password_confirmation: "secret"
  # },
]

users.each do |user_data|
  user = User.create!(user_data)
  t = Topic.new(topics.sample)
  # t.tag_list.add(topic_tags.sample)
  # commented for now because it causes error on seeds
  t.user = user
  t.save
  if user.sempai
    user.expertise_list.add(expert_tags.sample, expert_tags.sample)
    user.save
  else
    # user.tag_list.add(topic_tags.sample)
    user.save
  end
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
