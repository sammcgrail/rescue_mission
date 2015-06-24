require 'rails_helper'


feature 'user answers another users question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do
  # Acceptance Criteria
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario 'user edits a question' do
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
    click_on "Edit Question"
    fill_in "Title", with: "Now its edited. This is a goddamned answer.  And it is arbitrarily long because apparentliy suscinct answers do not exist"
    fill_in "Body", with: "Edited Test Question body 150 char body body body body body body body body body body
    body body body body body body body body body body body body body body body body body body body body
    body body body body body body body body body body body body body body body body body ok 150 char"
    click_on "Submit Question"
    expect(current_path).to eq("#{questions_path}/#{question.id}")
    expect(page).to have_content("Now its edited. This is a goddamned answer.")
    expect(page).to have_content("Edited Test Question body 150 char")
  end




  scenario 'user cannot edit other users questions' do

    user = FactoryGirl.create(:user)
    question = Question.create!(title:"Test Question 40 char title title title title title title title title title", body: "Test Question body 150 char body body body body body body body body body body
    body body body body body body body body body body body body body body body body body body body body
    body body body body body body body body body body body body body body body body body ok 150 char", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    visit questions_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

  end


end
