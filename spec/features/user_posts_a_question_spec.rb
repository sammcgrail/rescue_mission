require 'rails_helper'


feature 'user posts a question from add question page', %Q{
  As an authenticated user
  I want to be able to post a question
  So I can receive help from others
} do
  # Acceptance Criteria
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly



  scenario 'user visits question index' do
    user = FactoryGirl.create(:user)
    question = Question.create!(title:"Test Question 40 char title title title title title title title title title ", body: "Test Question body 150 char body body body body body body body body body body
    body body body body body body body body body body body body body body body body body body body body
    body body body body body body body body body body body body body body body body body ok 150 char", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    visit questions_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "New Question"
    fill_in "Title", with: "Test Question 40 char title title title title title title title title title "
    fill_in "question_body", with: "Test Question body 150 char body body body body body body body body body body
    body body body body body body body body body body body body body body body body body body body body
    body body body body body body body body body body body body body body body body body ok 150 char"
    click_on "Submit Question"
    expect(page).to have_content("Test Question 40")
  end

  scenario 'user forgets to fill out title or body fields like a dumbass' do
    user = FactoryGirl.create(:user)

    visit questions_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "New Question"

    click_on "Submit Question"
    expect(page).to have_content("can't be blank")

  end

  scenario 'user doesnt fill out enough characters for title or body' do
    user = FactoryGirl.create(:user)

    visit questions_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "New Question"

    fill_in "Title", with: "not 40 char"
    fill_in "question_body", with: "not 150 char"

    click_on "Submit Question"
    expect(page).to have_content("is too short (minimum is ")

  end
end
