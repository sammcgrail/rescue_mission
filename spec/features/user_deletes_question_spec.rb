require 'rails_helper'


feature 'user deletes a question from question details page', %Q{
  As an authenticated user
  I want to be able to delete a question from the question's details page
  So I can delete that dumb/duplicate question
} do
  # Acceptance Criteria
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario 'user visits question index' do
    user = FactoryGirl.create(:user)
    question = Question.create!(title:"This This THis This THis this this thiyyyys", body: "Testy ok 150 char Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    visit questions_path
    click_on question.title
    click_on "Delete Question"
    expect(current_path).to eq(questions_path)
    expect(page).to_not have_content(question.title)
  end

end
