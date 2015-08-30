require('spec_helper')

describe('/index', {:type => :feature}) do
  it('loads the index page') do
    visit('/')
    click_on ('Bands')
    expect(page).to have_content('Bands')
  end

  it('successfully adds a band and corrects case') do
    visit('/bands')
    fill_in("name", with: "foo fighters")
    click_button('Add')
    expect(page).to have_content("Foo Fighters")
  end

  it('capitalizes a callback') do
    visit('/bands')
    fill_in('name', :with => 'james')
    click_button('Add')
    expect(page).to have_content('James')
  end

end
