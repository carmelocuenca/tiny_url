require 'rails_helper'

feature 'Home page'  do
  before { visit '/' }
  
  scenario 'Getting New Url Message' do
    expect(page).to have_content('New Url')
  end
end