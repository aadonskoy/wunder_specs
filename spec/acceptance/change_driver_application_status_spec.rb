require 'rails_helper'

# Mark a driver application as `accepted` or `rejected`

shared_examples_for 'edit driver applications' do
  it 'changes data' do
    expect { edit }.to change { driver_application.reload.status }.from('pending').to(new_status)
  end

  context 'shows new status' do
    it { is_expected.to have_content(new_status) }
  end
end

RSpec.describe 'Change diver application status', type: :feature do
  let!(:driver_application) { create(:driver_application) }
  let(:new_status) { 'accepted' }
  let(:edit) do
    visit edit_driver_application_path(driver_application)
    fill_in('Status', with: new_status)
    click_button('Submit')
  end

  subject { page }

  describe 'accepted status city' do
    it_behaves_like 'edit driver applications'
  end

  describe 'rejected status city' do
    let(:new_status) { 'rejected' }

    it_behaves_like 'edit driver applications'
  end
end
