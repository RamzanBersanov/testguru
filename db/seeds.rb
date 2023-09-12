# frozen_string_literal: true

users = User.create!([{ name: 'admin', first_name: 'Admin', last_name: 'Admin', type: 'Admin', email: 'admin@mail.ru',
                        password: '000000', password_confirmation: '000000', confirmed_at: Time.now.utc },
                      { name: 'user', first_name: 'User', last_name: 'User', email: 'user@mail.ru',
                        password: '000000', password_confirmation: '000000', confirmed_at: Time.now.utc }])
p "Created #{User.count} Users"

# badges = Badge.create!([
#                          { user: users[1], title: '1', picture: 'third.jpg' },
#                          { user: users[1], title: '2', picture: 'second.jpg' },
#                          { user: users[1], title: '3', picture: 'second.jpg' },
#                          { user: users[1], title: '4', picture: 'second.jpg' },
#                          { user: users[1], title: '5', picture: 'first.jpg' },
#                          { user: users[1], title: 'Академические', picture: 'academic.png' },
#                          { user: users[1], title: 'Логические', picture: 'logic.png' }
#                        ])
# p "Created #{Badge.count} Badges"

categories = Category.create!([
                                { title: 'Академические' },
                                { title: 'Логические' }
                              ])
p "Created #{Category.count} Categories"

tests = Test.create!([
                       { title: 'История-1', level: '1', author: users[0], category: categories[0] },
                       { title: 'История-2', level: '2', author: users[0], category: categories[0] },
                       { title: 'География-1', level: '3', author: users[0], category: categories[0] },
                       { title: 'География-2', level: '4', author: users[0], category: categories[0] },
                       { title: 'Логика-1', level: '5', author: users[0], category: categories[1] }
                     ])
p "Created #{Test.count} Tests"

questions = Question.create!([
                               { body: 'Первый президент России', test: tests[0] },
                               { body: 'Год распада СССР', test: tests[0] },
                               { body: 'Какой город стал столицей Древнерусского государства?', test: tests[0] },
                               { body: 'В каком городе находится самый крупный музей России — Эрмитаж?',
                                 test: tests[1] },
                               { body: 'Когда в России отменили крепостное право?', test: tests[1] },
                               { body: 'Кем был П.И. Чайковский?', test: tests[1] },
                               { body: 'Самая большая страна в мире', test: tests[2] },
                               { body: 'Сколько часовых поясов в России?', test: tests[2] },
                               { body: 'Какое море омывает берега Италии?', test: tests[2] },
                               { body: 'Самое маленькое государство в Европе', test: tests[3] },
                               { body: 'Как называется самый известный водопад в Канаде?', test: tests[3] },
                               { body: 'Что такое муссон?', test: tests[3] },
                               { body: 'Каких камней не бывает в речке?', test: tests[4] },
                               { body: 'Что не вместится даже в самую большую кастрюлю?', test: tests[4] },
                               { body: 'Что можно завязать, но нельзя развязать?', test: tests[4] }
                             ])
p "Created #{Question.count} Questions"

Answer.create!([
                 { body: 'Ельцин', correct: true, question: questions[0] },
                 { body: 'Путин', correct: false, question: questions[0] },
                 { body: 'Медведев', correct: false, question: questions[0] },
                 { body: '1991', correct: true, question: questions[1] },
                 { body: '1990', correct: false, question: questions[1] },
                 { body: '1992', correct: false, question: questions[1] },
                 { body: 'Киев', correct: true, question: questions[2] },
                 { body: 'Москва', correct: false, question: questions[2] },
                 { body: 'Таганрог', correct: false, question: questions[2] },
                 { body: 'Санкт-Петербург', correct: true, question: questions[3] },
                 { body: 'Казань', correct: false, question: questions[3] },
                 { body: 'Екатеринбург', correct: false, question: questions[3] },
                 { body: '1861', correct: true, question: questions[4] },
                 { body: '1821', correct: false, question: questions[4] },
                 { body: '1561', correct: false, question: questions[4] },
                 { body: 'Композитором', correct: true, question: questions[5] },
                 { body: 'Художником', correct: false, question: questions[5] },
                 { body: 'Писателем', correct: false, question: questions[5] },
                 { body: 'Россия', correct: true, question: questions[6] },
                 { body: 'Канада', correct: false, question: questions[6] },
                 { body: 'США', correct: false, question: questions[6] },
                 { body: '11', correct: true, question: questions[7] },
                 { body: '3', correct: false, question: questions[7] },
                 { body: '7', correct: false, question: questions[7] },
                 { body: 'Средиземное', correct: true, question: questions[8] },
                 { body: 'Черное', correct: false, question: questions[8] },
                 { body: 'Красное', correct: false, question: questions[8] },
                 { body: 'Ватикан', correct: true, question: questions[9] },
                 { body: 'Мальта', correct: false, question: questions[9] },
                 { body: 'Андорра', correct: false, question: questions[9] },
                 { body: 'Ниагарский', correct: true, question: questions[10] },
                 { body: 'Анхель', correct: false, question: questions[10] },
                 { body: 'Виктория', correct: false, question: questions[10] },
                 { body: 'Ветер', correct: true, question: questions[11] },
                 { body: 'Течение', correct: false, question: questions[11] },
                 { body: 'Тропический дождь', correct: false, question: questions[11] },
                 { body: 'Сухих', correct: true, question: questions[12] },
                 { body: 'Драгоценных', correct: false, question: questions[12] },
                 { body: 'Больших', correct: false, question: questions[12] },
                 { body: 'Ее крышка', correct: true, question: questions[13] },
                 { body: 'Большая репа', correct: false, question: questions[13] },
                 { body: 'Кочан капусты', correct: false, question: questions[13] },
                 { body: 'Разговор', correct: true, question: questions[14] },
                 { body: 'Шнурки', correct: false, question: questions[14] },
                 { body: 'Наушники', correct: false, question: questions[14] }
               ])
p "Created #{Answer.count} Answers"

TestPassage.create(test: tests[0], user: users[0])
TestPassage.create(test: tests[1], user: users[0])
TestPassage.create(test: tests[2], user: users[0])
TestPassage.create(test: tests[3], user: users[0])
