require 'rails_helper'

feature 'user sees all questions', %Q{
  As an authenticated user
  I want to be able to view recently posted questions
  So I can help others feel dumb
} do
  # Acceptance Criteria
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario 'user visits question index' do
    user = FactoryGirl.create(:user)

    old_question = Question.create!(title:"This This THis This THis this this thiyyyys", body: "Testy ok 150 char Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:26:19 UTC +00:00")
    new_question = Question.create!(title:"new This This THis This THis this this thiyyyys", body: "new Testy ok 150 char Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu", user_id: user.id, created_at: "Mon, 22 Jun 2015 17:27:19 UTC +00:00")

    visit questions_path
    expect(page).to have_content("This This THis This THis this this thiyyyys")
    expect(page.body.index(old_question.title)).to be > page.body.index(new_question.title)
  end

  # scenario 'unauthenticated user attempts to sign out' do
  #   visit '/'
  #   expect(page).to_not have_content('Sign Out')
  # end
end
