RSpec.describe 'When I head to the home page' do
  include FlatpickrHelpers

  before do
    visit root_path
  end

  specify 'I can create, update, search, and destroy appointments' do
    expect(page).to have_text 'You have 0 appointments'

    # create (invalid)
    click_on 'Create Appointment'
    expect(page).to have_text 'You have 0 appointments'
    expect(page).to have_text %{Scheduled on can't be blank}

    # create (valid)
    select_date("#appointment_scheduled_on", day: 12, month: 12, year: 2035)

    click_on 'Create Appointment'

    expect(page).to have_text 'You have 1 appointment'
    expect(page).to have_text 'Scheduled on December 12, 2035'

    # toggle details and destroy
    find('summary', text: 'Scheduled on December 12, 2035').click
    click_on 'Destroy this appointment'
    expect(page).to have_text 'You have 0 appointments'
    expect(page).not_to have_text 'Scheduled on December 12, 2035'
  end
end
