categories = [
  ['交流', 'discuss'],
  ['招聘', 'employer'],
  ['求职', 'employee'],
  ['外包', 'outsourcing'],
]
categories.each_with_index do |item, i|
  Category.seed do |s|
    s.name = item.first
    s.slug = item.last
    s.range = i
  end
end