class ApplicationController < ActionController::Base

  # before_action :configure_permitted_parameters, if: :devise_controller?

   private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])

      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end

    # def answered_question?
    #   current_user.answers.exists?(question_id: @question.id)
    # end
    # 回答した後に新しい質問を作成できないようにするかどうか
end



