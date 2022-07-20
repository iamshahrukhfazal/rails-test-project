require 'faker'

FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "new#{rand(1...1000000)}@gmail.com" }
        password { 'abc12345' }
        role { 'regular_user' }
       
    end

    factory :post do
      association :user
      content { '<div> Content </div>' }
      title { 'Content For Post' }
      status {'published'}
    end

    factory :report do
      association :user
      reportable_type {"Post"}
      report_status {'under18'}
    end

    factory :comment do
      content { '<div> Content </div>' }
    end

   
end