User.create!([{ name: "Иван" }, { name: "Мага" }, { name: "Руслан" }])
p "Created #{User.count} Users"

Category.create!([{ title: "Academic" }, { title: "Logic" }])
p "Created #{Category.count} Categories"

Test.create!([{
  title: "History",
  level: "1",
  author_id: "1",
  category_id: "1"
},
{
  title: "History",
  level: "2",
  author_id: "2",
  category_id: "1"
},
{
  title: "Geography",
  level: "1",
  author_id: "2",
  category_id: "1"
}])
p "Created #{Test.count} Tests"

Question.create!([{
  body: "Первый президент США",
  test_id: "1"
},
{
  body: "Первый президент России",
  test_id: "1"
},
{
  body: "Самая большая страна в мире",
  test_id: "2"
}])
p "Created #{Question.count} Questions"

Answer.create!([{
  body: "Джордж Вашингтон",
  correct: true,
  question_id: "1"
},
{
  body: "Борис Ельцин",
  correct: true,
  question_id: "2"
},
{
  body: "Россия",
  correct: true,
  question_id: "3"
}])
p "Created #{Answer.count} Answers"
