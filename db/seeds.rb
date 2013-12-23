User.create!([
  {email: "lookflying@lookflying.com", encrypted_password: "$2a$10$Md.S6ySSUnmt42NTru/Nn.PreqPSstaX9Lc52OPKyKO7gccy6Oc3.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2013-12-23 17:34:00", last_sign_in_at: "2013-12-23 17:33:43", current_sign_in_ip: "10.0.0.105", last_sign_in_ip: "10.0.0.105"},
  {email: "lookflying@gmail.com", encrypted_password: "$2a$10$p.Z8eDxCJ6NZFnmI1ZcAieichPwWurw4d4.sCoVzhGlE9GpjN9gam", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2013-12-23 13:17:12", last_sign_in_at: "2013-12-23 13:17:12", current_sign_in_ip: "10.0.0.105", last_sign_in_ip: "10.0.0.105"}
])
Guess.create!([
  {time: "2013-12-23 18:05:37", user_id: 1, word_id: 1, content: "用电么？", judge_id: nil, judge: "new"},
  {time: "2013-12-23 18:13:20", user_id: 1, word_id: 1, content: "超市里有卖么？", judge_id: nil, judge: "new"},
  {time: "2013-12-23 18:23:41", user_id: 1, word_id: 2, content: "一般人家里有么？", judge_id: 10, judge: "true"},
  {time: "2013-12-23 18:23:53", user_id: 1, word_id: 2, content: "用电么？", judge_id: 11, judge: "true"},
  {time: "2013-12-23 18:31:14", user_id: 1, word_id: 1, content: "实验室有么？", judge_id: nil, judge: "new"},
  {time: "2013-12-23 18:48:12", user_id: 2, word_id: 3, content: "用电么？", judge_id: 8, judge: "true"},
  {time: "2013-12-23 18:48:17", user_id: 2, word_id: 3, content: "手机？", judge_id: 9, judge: "guess_right"},
  {time: "2013-12-23 18:53:13", user_id: 2, word_id: 3, content: "手机", judge_id: 13, judge: "guess_right"},
  {time: "2013-12-23 18:55:30", user_id: 1, word_id: 1, content: "饮水机？", judge_id: nil, judge: "new"},
  {time: "2013-12-23 19:00:34", user_id: 2, word_id: 1, content: "饮水机", judge_id: nil, judge: "new"},
  {time: "2013-12-23 19:02:16", user_id: 1, word_id: 3, content: "手机", judge_id: 14, judge: "true"}
])
GuessActivity.create!([
  {time: "2013-12-23 13:14:50", user_id: 1, word_id: 1, status: "new"},
  {time: "2013-12-23 13:15:01", user_id: 1, word_id: 1, status: "new"},
  {time: "2013-12-23 13:15:01", user_id: 1, word_id: 1, status: "new"},
  {time: "2013-12-23 13:17:16", user_id: 2, word_id: 1, status: "new"},
  {time: "2013-12-23 13:17:17", user_id: 2, word_id: 1, status: "new"},
  {time: "2013-12-23 13:40:45", user_id: 2, word_id: 1, status: "new"},
  {time: "2013-12-23 13:40:45", user_id: 2, word_id: 1, status: "new"},
  {time: "2013-12-23 15:21:49", user_id: 2, word_id: 1, status: "new"},
  {time: "2013-12-23 15:45:08", user_id: 2, word_id: 2, status: "new"},
  {time: "2013-12-23 15:45:08", user_id: 2, word_id: 3, status: "finished"},
  {time: "2013-12-23 18:23:29", user_id: 1, word_id: 2, status: "finished"},
  {time: "2013-12-23 19:02:11", user_id: 1, word_id: 3, status: "new"}
])
Judge.create!([
  {time: "2013-12-23 18:24:37", user_id: 1, guess_id: 9, judge: "ture"},
  {time: "2013-12-23 18:30:26", user_id: 1, guess_id: 9, judge: "ture"},
  {time: "2013-12-23 18:31:13", user_id: 1, guess_id: 9, judge: "ture"},
  {time: "2013-12-23 18:45:37", user_id: 1, guess_id: 12, judge: "ture"},
  {time: "2013-12-23 18:45:58", user_id: 1, guess_id: 12, judge: "ture"},
  {time: "2013-12-23 18:48:27", user_id: 1, guess_id: 13, judge: "true"},
  {time: "2013-12-23 18:48:33", user_id: 1, guess_id: 14, judge: "guess_right"},
  {time: "2013-12-23 18:53:24", user_id: 1, guess_id: 7, judge: "true"},
  {time: "2013-12-23 18:55:30", user_id: 1, guess_id: 8, judge: "true"},
  {time: "2013-12-23 18:55:35", user_id: 1, guess_id: 15, judge: "guess_right"},
  {time: "2013-12-23 18:56:00", user_id: 1, guess_id: 15, judge: "guess_right"},
  {time: "2013-12-23 19:02:20", user_id: 2, guess_id: 18, judge: "true"}
])
JudgeActivity.create!([
  {time: "2013-12-23 18:13:20", user_id: 1, word_id: 2},
  {time: "2013-12-23 18:24:37", user_id: 1, word_id: 3},
  {time: "2013-12-23 19:02:20", user_id: 2, word_id: 3}
])
Word.create!([
  {word: "饮水机", property: "名词", count: 0},
  {word: "空调", property: "名词", count: 0}, 
  {word: "手机", property: "名词", count: 0}
])
