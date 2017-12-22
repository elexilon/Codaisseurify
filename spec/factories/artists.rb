FactoryBot.define do
  factory :artist do
    name Faker::FunnyName.name
    description Faker::Hipster.paragraph[0..496] << "...")
  end
end
