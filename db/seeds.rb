# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Quote.create(author: "W. Somerset Maugham", text: "It's a funny thing about life; if you refuse to accept anything but the best, you very often get it.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Joseph Campbell", text: "Follow your bliss and doors will open where there were no doors before.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Miles Davis", text: "Do not fear mistakes.  There are none.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Anais Nin", text: "Life shrinks or expands in proportion to one's courage.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Anais Nin", text: "And the day came when the risk to remain tight in a bud was more painful than the risk it took to blossom.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Kermit the Frog", text: "It's not easy being green.", theme: "motivational", public: true, user_id: nil, date_used: Date.today - 5.days)
Quote.create(author: "Martha Graham", text: "There is a vitality, a life force, an energy, a quickening that is translated through you into action, and because there is only one of you in all time, this expression is unique. And if you block it, it will never exist through any other medium and will be lost.", theme: "creativity", public: true, user_id: nil, date_used: Date.today - 5.days)

User.create(username: "Elizabeth", phone_num: ENV['E_PHONE_NUM'] || "2055551212", email: ENV['E_EMAIL'] || "elizabeth@example.com", theme_choice: "motivational")
# User.create(username: "Elizabeth", phone_num: ENV['E_PHONE_NUM'] || "2055551212", email: ENV['E_EMAIL'] || "elizabeth@example.com", theme_choice: "motivational", delivery_time: "11:00:00")
