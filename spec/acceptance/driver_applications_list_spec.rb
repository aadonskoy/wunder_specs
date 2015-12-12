require 'rails_helper'

# View a list of driver applications displaying the applicant's name,
# email address, city and application status

RSpec.describe 'List of driver applications', type: :feature do
  let!(:driver_application) { create_list(:driver_application, 3).last }
  let(:applicant) { driver_application.user }
  let(:applicant_name) { applicant.name }
  let(:applicant_email) { applicant.email }
  let(:applicant_city) { driver_application.city.name }
  let(:applicant_status) { applicant.status }

  before(:each) do
    visit '/'
  end

  subject { page }

  context 'displaying applicant\'s name' do
    it { is_expected.to have_content(applicant_name) }
  end

  context 'displaying applicant\'s email' do
    it { is_expected.to have_content(applicant_email) }
  end

  context 'displaying applicant\'s city' do
    it { is_expected.to have_content(applicant_city) }
  end

  context 'displaying applicant\'s status' do
    it { is_expected.to have_content(applicant_status) }
  end
end
