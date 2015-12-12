require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:firts_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('good@email.com', 'good.email@email.com').for(:email) }
  it { is_expected.not_to allow_value('@email.com', 'some_email.com', '123@com').for(:email) }
end
