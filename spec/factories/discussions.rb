FactoryGirl.define do
  factory :discussion do
    sequence(:title) { |i| "测试文章#{i}" }
    sequence(:content) { |i| "文章正文" }
    category { create(:category) }
    parser 'html'
  end
end