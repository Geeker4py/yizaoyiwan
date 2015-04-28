FactoryGirl.define do
  factory :category do
    sequence(:name) { |i| "分类#{i}" }
    sequence(:slug) { |i| "cate#{i}" }
    sequence(:range)
  end
end