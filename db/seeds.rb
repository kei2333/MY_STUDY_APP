# 删除所有的问题
Question.delete_all

questions = [
  { content: "问题1 请问一加一等于几", options: "A. 1,B. 2,C. 3,D. 4", correct_option: 1 },
  { content: "问题2 请问二加二等于几", options: "A. 1,B. 2,C. 3,D. 4", correct_option: 3 },
  # 添加更多问题...
]

questions.each do |question|
  Question.create!(question)
end