class TestController < ApplicationController
  def pre_test
    @questions = Question.all
  end

  def submit_pre_test
    score = 0
    total_score = Question.count
    answers = []

    params[:answers].each do |question_id, selected_option|
      question = Question.find(question_id)
      if question.correct_option == selected_option.to_i
        score += 1
      end
      answers << { question_id: question_id, selected_option: selected_option, correct_option: question.correct_option }
    end

    participant = assign_participant(score)
    Participant.create!(score: score, total_avg: participant[:total_avg], label: participant[:label], group: participant[:group])

    session[:score] = score
    session[:total_score] = total_score
    session[:answers] = answers

    redirect_to result_pre_test_path
  end

  def result_pre_test
    @score = session[:score]
    @total_score = session[:total_score]
    @answers = session[:answers]
    @participants = Participant.all
    @questions = Question.all
 

    # 打印 @answers 数组的内容
    p @answers
  end
 

  def control_study
    # 对照组学习界面
  end

  private

  def assign_participant(new_score)
    participants = Participant.all
    total_avg = participants.average(:score) || 0
    if participants.size < 2
      group = participants.size.zero? ? 'Experimental' : 'Control'
      label = 'initial'
    else
      exp_scores = participants.where(group: 'Experimental').pluck(:score)
      ctrl_scores = participants.where(group: 'Control').pluck(:score)
      avg_exp = exp_scores.sum.to_f / exp_scores.size
      avg_ctrl = ctrl_scores.sum.to_f / ctrl_scores.size

      if new_score > (avg_exp + avg_ctrl) / 2
        group = avg_exp > avg_ctrl ? 'Control' : 'Experimental'
        label = avg_exp > avg_ctrl ? 'should go to low' : 'should go to high'
      else
        group = avg_exp > avg_ctrl ? 'Experimental' : 'Control'
        label = avg_exp > avg_ctrl ? 'should go to high' : 'should go to low'
      end
    end

    { total_avg: total_avg, label: label, group: group }
  end
end
