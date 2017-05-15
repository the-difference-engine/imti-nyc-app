module DocumentsHelper

  def document_lists
    current_user.international_applicant? ? [['Health Form', 'health_form'], ['Personal Essay', 'personal_essay'], ['Recommendation', 'recommendation'], ['Resumé', 'resume'], ['TOEFL/IELTS Score Report', 'toefl_ielts_score_report'], ['Transcript', 'transcript'], ['WES Evaluation', 'wes_evaluation'], ['Contract', 'contract'], ['Student Visa', 'student_visa'], ['Passport Photo', 'passport_photo']] :
      [['Health Form', 'health_form'], ['Personal Essay', 'personal_essay'], ['Recommendation', 'recommendation'], ['Resumé', 'resume'], ['Contract', 'contract'], ['Transcript', 'transcript']]  
  end

end
