require('spec_helper')

describe('/index', {type: :feature}) do
  it('loads the index page') do
    visit('/index')
    click_on "Bands"
    expect(page).to have_content('Bands')
  end

  it('successfully adds a band and corrects case') do
    visit('/index')
    click_link('Bands')
    fill_in("name", with: "foo fighters")
    click_button('Add')
    expect(page).to have_content("Foo Fighters")
  end
end
