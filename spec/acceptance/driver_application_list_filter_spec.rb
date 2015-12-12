require 'rails_helper'

# Filter a list of driver applications by either `status` or `city` or both

shared_examples_for 'find driver applications' do
  context 'displaying wanted applicant' do
    it { is_expected.to have_content(driver_application.user.email) }
  end

  context 'doesn\'t display unwanted applicant' do
    it { is_expected.not_to have_content(unwanted_driver_application.user.email) }
  end
end

RSpec.describe 'Filter diver applications list', type: :feature do
  let!(:unwanted_driver_application) { create(:driver_application, :rejected_status) }
  let!(:driver_application) { create(:driver_application) }

  let(:city) { driver_application.city.name }
  let(:status) { driver_application.status }

  let(:search_by_status) { fill_in('by Status', with: status) }
  let(:search_by_city) { fill_in('by City', with: city) }
  let(:search_criteria) do
    search_by_city
    search_by_status
    click_button('Search')
  end

  before(:each) do
    visit '/'
    search_criteria
  end

  subject { page }

  describe 'by city' do
    let(:search_by_status) { }

    it_behaves_like 'find driver applications'
  end

  describe 'by status' do
    let(:search_by_city) { }

    it_behaves_like 'find driver applications'
  end

  describe 'by city and by status' do
    it_behaves_like 'find driver applications'
  end
end
