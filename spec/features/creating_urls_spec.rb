require 'rails_helper'

feature 'Creating tiny urls'  do
  before do
    visit '/' 
    fill_in 'Original', with: 'http://rubyonrails.org/'
  end
  
  scenario 'can create a tiny url without a custom url' do
    click_button 'Create Url'
    expect(page).to have_content('Url was successfully created')
       
    click_link 'Tiny Url'
    expect(page.current_url).to eql('http://rubyonrails.org/')
  end
  
  scenario 'can create a tiny url with a custom url' do
    fill_in 'Custom Url', with: 'gold'
    click_button 'Create Url'
    expect(page).to have_content('Url was successfully created')
    
    expect(page).to have_content('http://www.example.com/gold')
    
    click_link 'Tiny Url'
    expect(page.current_url).to eql('http://rubyonrails.org/')
  end
end