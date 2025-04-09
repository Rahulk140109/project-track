FactoryBot.define do
  factory :project do
    title { "Test Project" }
    description { "A sample description" }
    status { "completed" }

    association :user
  end
end
