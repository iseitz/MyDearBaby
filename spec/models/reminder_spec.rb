require 'rails_helper'
require 'pry'

RSpec.describe Reminder, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:reminder) }
    it { is_expected.to validate_presence_of(:reminder_type) }
    it { is_expected.to validate_presence_of(:reminder_duration) }
    it { is_expected.to validate_presence_of(:reminder_location) }
  end

  context 'it has reminder_type, reminder_duration and reminder_location' do
    before(:each) do
      @child = FactoryBot.create(:child)
      @user = FactoryBot.create(:user)

    end
    after(:each) do
      @child.destroy
      @user.destroy
    end

    it 'is has  a type of reminder that can be daily, weekly or yearly ' do
      @reminder1 = FactoryBot.create(:reminder, reminder_type: 'daily', child: @child, user: @user)
      @reminder2 = FactoryBot.create(:reminder, reminder_type: 'weekly', child: @child, user: @user)
      @reminder3 = FactoryBot.create(:reminder, reminder_type: 'yearly', child: @child, user: @user)
      expect(@reminder1.reminder_type).to eq('daily')
      expect(@reminder2.reminder_type).to eq('weekly')
      expect(@reminder3.reminder_type).to eq('yearly')
    end

    it 'has a reminder duration that can be for a week, a month or a year' do
      @reminder1 = FactoryBot.create(:reminder, reminder_duration: 'week', child: @child, user: @user)
      @reminder2 = FactoryBot.create(:reminder, reminder_duration: 'month', child: @child, user: @user)
      @reminder3 = FactoryBot.create(:reminder, reminder_duration: 'year', child: @child, user: @user)
      expect(@reminder1.reminder_duration).to eq('week')
      expect(@reminder2.reminder_duration).to eq('month')
      expect(@reminder3.reminder_duration).to eq('year')
    end

    it 'has a reminder location that can be for in app remminder or email reminder' do
      @reminder1 = FactoryBot.create(:reminder, reminder_location: 'app', child: @child, user: @user)
      @reminder2 = FactoryBot.create(:reminder, reminder_location: 'email', child: @child, user: @user)
      expect(@reminder1.reminder_location).to eq('app')
      expect(@reminder2.reminder_location).to eq('email')
    end
  end
end
