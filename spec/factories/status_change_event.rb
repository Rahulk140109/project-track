FactoryBot.define do
  factory :status_change_event do
    from_status { "draft" }
    to_status { "archived" }
    metadata { {} }
  end
end
