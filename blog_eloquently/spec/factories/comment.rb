FactoryGirl.define do
    factory :comment do
        content "Test content"
        author_name "Test author"
        post
        
        trait :no_post do
            post_id nil
        end
    end
end