require 'rails_helper'

feature 'user views a questions details', %Q{
  As an authenticated user
  I want to be able to click on a question in the question index page
  So I can see the details for that question in question
} do
  # Acceptance Criteria
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'user visits question index' do
    user = FactoryGirl.create(:user)
    question = Question.create!(title:"This This THis This THis this this thiyyyys", body: "Testy ok 150 char Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    visit questions_path
    click_on question.title
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.body)
    expect(page).to have_content("Question Details:")
  end

  # scenario 'unauthenticated user attempts to sign out' do
  #   visit '/'
  #   expect(page).to_not have_content('Sign Out')
  # end
end
