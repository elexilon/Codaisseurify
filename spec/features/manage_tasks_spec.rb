require 'rails_helper'

feature 'Manage tasks', js: true do
  let!(:artist) { create :artist }
  background do
    visit "/artists/#{artist.id}"

    # Enter description in the text field
    fill_in 'song_name', with: "kids with guns\n"

    # Wait for 1 second so the backend can come back with a response
    sleep(1)
  end

  scenario 'add a new task' do
    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('kids with guns')
  end

  scenario 'delete a song' do
    find("#delete-all").click

    # Wait for 1 second so the counter can be updated
    sleep(1)

    expect(page).not_to have_content('kids with guns')
  end
end
