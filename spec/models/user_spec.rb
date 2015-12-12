require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:firts_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('good@email.com', 'good.email@email.com').for(:email) }
  it { is_expected.not_to allow_value('@email.com', 'some_email.com', '123@com').for(:email) }

  it { is_expected.to have_one(:driver_application).dependent(:destroy) }

  describe '#name' do
    let(:user) { create(:user) }
    let(:first_name) { create(:user) }
    let(:last_name) { create(:user) }

    subject { user.name }
    it { is_expected.to eq("#{first_name} #{last_name}") }
  end
end
