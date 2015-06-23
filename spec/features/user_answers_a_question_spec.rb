require 'rails_helper'


feature 'user answers another users question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do
  # Acceptance Criteria
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly






  scenario 'user posts an answer to another users question' do
    user = FactoryGirl.create(:user)
    question = Question.create!(title:"Test Question 40 char title title title title title title title title title", body: "Test Question body 150 char body body body body body body body body body body
    body body body body body body body body body body body body body body body body body body body body
    body body body body body body body body body body body body body body body body body ok 150 char", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    visit questions_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "#{question.title}"
    click_on "Add an Answer"
    fill_in "answer_description", with: "This is a goddamned answer.  And it is arbitrarily long because apparentliy suscinct answers do not exist"
    click_on "Submit Answer"
    expect(current_path).to eq("#{questions_path}/#{question.id}")
    expect(page).to have_content("This is a goddamned answer.")

  end

end
