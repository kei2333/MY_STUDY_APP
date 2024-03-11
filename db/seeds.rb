questions = [
  { content: "问题1内容", options: "选项1,选项2,选项3,选项4", correct_option: 1 },
  { content: "问题2内容", options: "选项1,选项2,选项3,选项4", correct_option: 2 },
  # 添加更多问题...
]

questions.each do |question|
  Question.create!(question)
end
