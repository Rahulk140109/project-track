FactoryBot.define do
  factory :project_event do
    association :project
    association :user

    trait :with_comment_event do
      association :eventable, factory: :comment_event
    end

    trait :with_status_change_event do
      association :eventable, factory: :status_change_event
    end
  end
end
