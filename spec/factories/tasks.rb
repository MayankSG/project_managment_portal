FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    status { 1 }
    reporter_id { 1 }
    assignee_id { 1 }
    project { nil }
  end
end
