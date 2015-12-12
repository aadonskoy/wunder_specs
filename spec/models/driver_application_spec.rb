require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to allow_value('01234567890', '09876543210').for(:phone) }
  it { is_expected.not_to allow_value('1234', '0123rdns890', '01.23456780').for(:phone) }

  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to allow_value('pending', 'accepted', 'rejected').for(:status) }
  it { is_expected.not_to allow_value('some_other_status').for(:status) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:city) }
end

