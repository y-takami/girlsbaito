class Girl::QuestionsController < Girl::Base
  skip_before_action :authenticate_girl!

  def index
    @questions = Question.all

    @question_category_1 = Question.where(category: '会員登録について')
    @question_category_2 = Question.where(category: '応募について')
    @question_category_3 = Question.where(category: '求人広告について')
    @question_category_4 = Question.where(category: '女子高生バイトについて')
    @question_category_5 = Question.where(category: '勤務について')
    @question_category_6 = Question.where(category: '選考・採用について')
    @question_category_7 = Question.where(category: '採用お祝い金について')

  end

  def show
    @question = Question.find(params[:id])
  end

end
