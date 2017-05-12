module DocumentsHelper

  def document_lists
    current_user.international_applicant? ? documents = [['health form'], ['personal essay'], ['recommendation'], ['resume'], ['TOEFL/IELTS score report'], ['transcript'], ['WES evaluation'], ['passport_photo']] :
      documents = [['health form'], ['personal essay'], ['recommendation'], ['resume'], ['transcript']]  
  end

end
