User.create!([
  {email: "lookflying@gmail.com", encrypted_password: "$2a$10$TEol5nlZcnoIIqOGinJcuOSfiMjFYKEQtSFvelTUaBsOZmC1VzQYS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2013-12-23 19:22:11", last_sign_in_at: "2013-12-23 19:22:11", current_sign_in_ip: "10.0.0.105", last_sign_in_ip: "10.0.0.105"},
  {email: "lookflying@lookflying.com", encrypted_password: "$2a$10$EWIPJ3Cq7HuBFEFAoV2Fi.f9X2XLnhUer2TQrHadASTvbGsq9PpFa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2013-12-23 19:32:25", last_sign_in_at: "2013-12-23 19:32:25", current_sign_in_ip: "10.0.0.105", last_sign_in_ip: "10.0.0.105"}
])
Guess.create!([
  {time: "2013-12-23 19:36:10", user_id: 2, word_id: 2, content: "手机", judge_id: 1, judge: "true"},
  {time: "2013-12-23 19:36:15", user_id: 1, word_id: 1, content: "饮水机", judge_id: 2, judge: "true"},
  {time: "2013-12-23 19:36:39", user_id: 1, word_id: 1, content: "饮水机", judge_id: 3, judge: "guess_right"},
  {time: "2013-12-23 19:40:21", user_id: 2, word_id: 3, content: "学生", judge_id: 4, judge: "false"},
  {time: "2013-12-23 19:40:43", user_id: 2, word_id: 3, content: "学生", judge_id: 5, judge: "false"},
  {time: "2013-12-23 19:40:56", user_id: 2, word_id: 3, content: "汽车", judge_id: 0, judge: "guess_right"},
  {time: "2013-12-23 19:41:10", user_id: 1, word_id: 4, content: "学生", judge_id: 0, judge: "guess_right"}
])
GuessActivity.create!([
  {time: "2013-12-23 19:23:58", user_id: 1, word_id: 1, status: "finished"},
  {time: "2013-12-23 19:36:06", user_id: 2, word_id: 2, status: "new"},
  {time: "2013-12-23 19:36:30", user_id: 2, word_id: 3, status: "finished"},
  {time: "2013-12-23 19:41:07", user_id: 1, word_id: 4, status: "finished"}
])
Judge.create!([
  {time: "2013-12-23 19:36:18", user_id: 1, guess_id: 1, judge: "true"},
  {time: "2013-12-23 19:36:25", user_id: 2, guess_id: 2, judge: "true"},
  {time: "2013-12-23 19:36:44", user_id: 2, guess_id: 3, judge: "guess_right"},
  {time: "2013-12-23 19:40:51", user_id: 1, guess_id: 4, judge: "false"},
  {time: "2013-12-23 19:40:53", user_id: 1, guess_id: 5, judge: "false"}
])
JudgeActivity.create!([
  {time: "2013-12-23 19:36:19", user_id: 1, word_id: 2},
  {time: "2013-12-23 19:36:25", user_id: 2, word_id: 1},
  {time: "2013-12-23 19:40:51", user_id: 1, word_id: 3}
])
Word.create!([
  {word: "饮水机", property: "名词", count: 1},
  {word: "手机", property: "名词", count: 1},
  {word: "汽车", property: "名词", count: 1},
  {word: "学生", property: "名词", count: 1}
])
