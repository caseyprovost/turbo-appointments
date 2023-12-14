RSpec.describe 'When I head to the home page' do
  before { visit '/' }


  specify 'I can create, update, search, and destroy appointments' do
    expect(page).to have_text 'You have 0 appointments'

    # create (invalid)
    click_on 'Create Appointment'
    expect(page).to have_text 'You have 0 appointments'
    expect(page).to have_text %{Scheduled on can't be blank}

    # create (valid)
    within('#new_appointment') do
      fill_in 'Scheduled on', with: '12/12/2035'
      click_on 'Create Appointment'
    end
    expect(page).to have_text 'You have 1 appointment'
    expect(page).to have_text 'Scheduled on December 12, 2035'

    # toggle details and destroy
    find('summary', text: 'Scheduled on December 12, 2035').click
    click_on 'Destroy this appointment'
    expect(page).to have_text 'You have 0 appointments'
    expect(page).not_to have_text 'Scheduled on December 12, 2035'
  end
end
