# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'net/http'
require 'json'
require 'rest-client'
require 'open-uri'

expert_tags = [
   "taxes",
   "employment",
   "communication",
   "career",
   "insurance",
   "banking",
   "medical care",
   "housing",
  #  "language",
  #  "investing",
  #  "relationships",
  #  "education",
  #  "religion",
  #  "community",
]

topic_tags = [
  "visa",
  "taxes",
  "employment",
  "communication",
  "marriage",
  "childcare",
  "lifestyle",
  "medical care",
  "work relationships",
  "cultural adaptation",
  "banking issues",
  "health insurance",
  "employment insurance",
  "job search",
  "housing search",
  "mental health",
  "career guidance",
  "communication advice",
]

# topics = [
#   { name: "Visa renewal", description: "Hi, I'm a digital nomad and I need advice on my visa renewal application process."},
#   { name:"Visa", description: "Hola, necesito ayuda con mi declaración de impuestos."},
#   { name:"Visa", description: "Bonjour, je suis un étudiant et j'ai besoin d'aide pour rédiger mon CV."},
#   { name:"Visa", description: "Hallo, ich bin ein digitaler Nomade und ich brauche Hilfe bei meinem Visumverlängerungsantrag."},
#   { name:"Visa", description: "Olá, sou um estudante e preciso de ajuda para escrever meu currículo."},
#   { name:"Visa", description: "Привет, я цифровой кочевник и мне нужна помощь в моем заявлении на продление визы."},
#   { name:"Visa", description: "你好，我是一名数字游牧民，我需要帮助办理签证续签申请。"},
#   { name:"Visa", description: "안녕하세요, 나는 디지털 노마드이며 비자 갱신 신청 절차에 대한 도움이 필요합니다."},
#   { name:"Work communication", description: "Hi, I am non-Japanese and work for a large corporation. I am having trouble with cross-functional commuication with a different department. I would like to discuss and get advice."},
#   { name:"Comunicación laboral", description: "Hola, soy no japonés y trabajo para una gran corporación. Tengo problemas con la comunicación interfuncional con un departamento diferente. Me gustaría discutir y obtener consejos."},
#   { name:"Communication professionnelle", description: "Bonjour, je suis non japonais et travaille pour une grande entreprise. J'ai des problèmes de communication interfonctionnelle avec un département différent. J'aimerais discuter et obtenir des conseils."},
# ]

marty = User.find_by_nickname("Marty")



# reviews = [
#   { nickname: "Martin", content: "Thank you so much for your advice, Marty. I was able to understand the key points of the requirements for my visa paper work. I was able to hand in everything on time.", rating: 5},
#   { first_name: "Martin", content: "Marty is very kind and patient. He thoroughly understood my problem. I was able to trust his advice 100%.", rating: 5}
#   {first_name: "Martin", content: "Appreciate your support Marty! I'll probably ask you again if I need your help!", rating: 4}
# ]


puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
users = [
  { first_name: "Martin",
    last_name: "Bernard",
    email: "mail@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "French",
    nationality: "France",
    nickname: "Marty",
    occupation: "Immigration lawyer",
    background: "Marty is a registered lawyer in both France and Japan. He is a registered foreign lawyer(Gaikokuho Jimu Bengoshi) with 20 yrs of experience in Japan.",
    web_url: "www.linkedin.com/MartinBernard",
    meet_url: "www.meet.google.com/dsj-pzzh-eru",
    sempai: true,
    image_file: "app/assets/images/sample_sempai.jpg"
  },
  { first_name: "Annabelle",
    last_name: "Gomez",
    email: "abc@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Philippines",
    nickname: "Ann",
    occupation: "Immigration Consultant",
    background: "After obtaining her Master's in social services, Ann has worked in the Ministry of Foreign Affairs. Currently, she works in the Tokyo city office.",
    web_url: "www.linkedin.com/AnnabelleGomez",
    meet_url:"www.meet.google.com/dsj-pzzh-eru",
    sempai: true,
    image_file: "app/assets/images/ann_sempai.jpg"
  },
  { first_name: "Taro",
    last_name: "Yamada",
    email: "123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "Japanese",
    nationality: "Japan",
    nickname: "T-man",
    occupation: "HR Director",
    background: "T-man has a degree in labor law and has specialized in labor relations in both Japanese and non-Japanese corporations for the past 15 years. Currently, he is the HR director in a non-Japanese company.",
    web_url: "www.linkedin.com/TaroYamada",
    meet_url: "www.meet.google.com/dsj-pzzh-eru",
    sempai: true,
    image_file: "app/assets/images/tman-sempai.jpg"
  },
  { first_name: "Jane",
    last_name: "Tanaka",
    email: "mail123123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Brazil",
    nickname: "Jane the housing expert",
    occupation: "Real Estate entrpreneur",
    background: "Jane is a property consultant with 15 years of experience. She currently owns and operates 10 sharehouses.",
    web_url: "www.linkedin.com/JaneTanaka",
    meet_url: "www.meet.google.com/dsj-pzzh-eru",
    sempai: true,
    image_file: "app/assets/images/jane_sempai.jpg"
  },
  { first_name: "Javier",
    last_name: "Rodriguez",
    email: "abc123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Mexico",
    nickname: "Javo",
  },
  { first_name: "Mary",
    last_name: "Smith",
    email: "456@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "United Kingdom",
    nickname: "Britgirl",
  },
  { first_name: "Min",
    last_name: "Kim",
    email: "abc456@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "South Korea",
    nickname: "Gamer",
  },
  { first_name: "Ali",
    last_name: "Suharto",
    email: "789@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Indonesia",
    nickname: "Traveller",
  },
  { first_name: "Annu",
    last_name: "Patel",
    email: "laur@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "India",
    nickname: "Laur",
  },
  { first_name: "Ozzy",
    last_name: "Campbell",
    email: "xyz@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Australia",
    nickname: "Digital nomad"
  },
  { first_name: "Mimi",
    last_name: "Wong",
    email: "xyz123@mail.com",
    password: "secret",
    password_confirmation: "secret",
    language: "English",
    nationality: "Hong Kong",
    nickname: "New to Japan",
  },
]

users.each do |user_data|
  file = user_data.delete(:image_file) || "app/assets/images/sample_sempai.jpg"
  user = User.create!(user_data)
  # t = Topic.new(topics.sample)
  # t.tag_list.add(topic_tags.sample)
  # commented for now because it causes error on seeds
  # t.user = user
  # t.save
  picture = File.open(file)
  user.picture.attach(io: picture, filename: "profile.jpg")
  if user.nickname == "Marty" || user.nickname == "Ann" || user.nickname == "T-man"
    user.expertise_list.add("visa","employment","communication")
    user.save
  elsif user.nickname == "Jane the housing expert"
    user.expertise_list.add("housing","lifestyle")
    user.save
  elsif user.sempai
    user.expertise_list.add(expert_tags.sample, expert_tags.sample, expert_tags.sample)
    user.save
  else
    # user.tag_list.add(topic_tags.sample)
    user.save
  end
end
puts "done"


# Goal is to make a chat between Laur and Jane
# 0. get the instances of Laur and Jane and store in variable
laur = User.find_by_nickname("Laur")
jane = User.find_by_nickname("Jane the housing expert")

# 0.5 Jane needs a topic

housing = Topic.create(name: "Housing Concern", description: "I need to move houses and not sure what to consider first.", user: laur)

# 1. Laur needs to book Jane
    # new booking
house_booking = housing.bookings.create!(user: jane, status: :pending, time: 2.days.ago)

    # to Jane's topic made by Laur
# 2. Create messages
marty = User.find_by_nickname("Marty")

house_booking.messages.create!(user: laur, content: "Hi Jane, I wonder if I can ask about housing matters.")
house_booking.messages.create!(user: jane, content: "Hi! sure, how can I help you? 👋", created_at: 2.days.ago + 5.minutes)
house_booking.messages.create!(user: laur, content: "I need to move to a different house or apartment. My housing matters were done by my first employer. This time, I changed employers but I need to do my transfer on my own. What do I need to consider and where do I start?", created_at: 2.days.from_now + 10.minutes)
house_booking.messages.create!(user: jane, content: "Thanks for asking. 😊 Where in the process of transfer are you now?", created_at: 2.days.from_now + 11.minutes)
house_booking.messages.create!(user: laur, content: "I haven't moved yet but I found a good apartment and initially talked with the new broker.", created_at: 2.days.from_now + 13.minutes)
house_booking.messages.create!(user: jane, content: "Alright, first, you need to report to your current building or property management that you are moving out on your preferred date. They may give further instructions and make sure you get your deposit money.", created_at: 2.days.from_now + 20.minutes)
house_booking.messages.create!(user: laur, content: "Thank you. May I know how much it will most likely be?", created_at: 2.days.from_now + 25.minutes)
house_booking.messages.create!(user: jane, content: "It depends if you paid your cleaning fee up front, you should get the full deposit back, if not, it will be deducted from the deposit.", created_at: 2.days.from_now + 30.minutes)
house_booking.messages.create!(user: laur, content: "Got it. Thank you so much! Can I book you after I received the instructions from the Property Management?", created_at: 2.days.from_now + 35.minutes)
house_booking.messages.create!(user: jane, content: "Very much welcome. I hope you can fix it soon!", created_at: 2.days.from_now + 36.minutes)


marty.reviews.create!(content: "Thank you so much for your advice, Marty. I was able to understand the key points of the requirements for my visa paper work. I was able to hand in everything on time.", rating: 5)
marty.reviews.create!(content: "Marty is very kind and patient. He thoroughly understood my problem. I was able to trust his advice 100%.", rating: 5)
marty.reviews.create!(content: "Appreciate your support Marty! I'll probably ask you again if I need your help!", rating: 4)

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
