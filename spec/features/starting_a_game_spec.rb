require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
    our_name="Richard"
    fill_in "name", with: our_name
    click_button 'Submit'
    expect(page).to have_content "Hello, #{our_name}"
  end
  scenario 'Gives default name if none submitted' do
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    expect(page).to have_content "Hello, Player 1"
  end
  scenario "I can choose to start a game against a computer" do
    visit '/'
    click_link 'New Game'
    click_button 'Submit'
    click_link "VS Computer"
    expect(page).to have_content "Enter coordinates to fire upon"
  end
end
feature 'Shooting at opponent board' do
  scenario 'I can enter coordinates' do
    visit '/play'
    fill_in "coordinates", with: "A1"
    click_button 'Fire'
    expect(page).to have_content "hit"
    fill_in "coordinates", with: "I7"
    click_button 'Fire'
    expect(page).to have_content "miss"
  end
end
