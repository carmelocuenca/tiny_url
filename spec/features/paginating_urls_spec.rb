require 'rails_helper'

feature 'Paginating Urls' do
  let(:per_page) { WillPaginate.per_page }

  before do
    (3*per_page).times do |i|
      Url.create_link( FFaker::Internet.http_url )
    end
    visit urls_path
  end

  it { expect(page).to have_selector('div .pagination') }
  
  it "should list each url" do
    Url.paginate(page: 1).each do |url|
      expect(page).to have_selector('td', text: url.original )
    end
  end
  
  it 'display pagination' do
    
    expect(all('.pagination li a', text: /\d/).count ).to eql 3
    
    within '.pagination .next' do
      click_link 'Next'
    end
    current_page = find('.active').text.strip
    expect(current_page).to eql '2'
  end
end
