# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Note, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:note) }
    it { is_expected.to validate_presence_of(:note_body) }
    it { is_expected.to validate_presence_of(:child_id) }
  end

  context 'it has note_body, child_id' do
    before(:each) do
      @child = FactoryBot.create(:child)
      @note = FactoryBot.create(:note, note_body: 'my lovely baby, note number 1', child: @child)
    end
    after(:each) do
      @child.destroy
      @note.destroy
    end

    it 'is has note body' do
      expect(@note.note_body).to eq('my lovely baby, note number 1')
    end

    it 'has a child_id' do
      expect(@note.child_id).to eq(@child.id)
    end
  end

  # context 'note has one or several images attached to it' do
  #   before(:each) do
  #     @user = FactoryBot.create(:user)
  #     @child = FactoryBot.create(:child, name: 'Bart', gender: 'a boy', color_theme: 'beige', user_id: @user.id)
  #   @note = FactoryBot.create(:note, )
  #  end
  #   after(:each) do
  #     @child.destroy
  #     @user.destroy
  #   end
  #
  #   it 'has many notes' do
  #     @child = FactoryBot.create(:child)
  #     @note = FactoryBot.create(:note, child: @child)
  #     @note2 = FactoryBot.create(:note, child: @child)
  #     expect(@child.notes.size).to eq(2)
  #   end
  #
  #   it 'has many reminders' do
  #     @child = FactoryBot.create(:child)
  #     @reminder = FactoryBot.create(:reminder)
  #     @reminder = FactoryBot.create(:reminder, user: @user, child: @child)
  #     expect(@child.reminders.size).to eq(1)
  #   end
  # end

  # context 'it can have #image in four different sizes' do
  #   before(:each) do
  #     @child = FactoryBot.create(:child)
  #     @child.image.store!(File.open('spec/support/images/photo.jpeg'))
  #   end
  #
  #   after(:each) do
  #     @child.destroy
  #   end
  #
  #   it "has an image/avatar included" do
  #     expect(@child.image.present?).to be(true)
  #   end
  #
  #   describe '.thumb' do
  #     it "scales down an image to be no larger than 50 by 50 pixels" do
  #       expect(@child.image.thumb).to be_no_larger_than(50, 50)
  #     end
  #   end
  #
  #   describe '.small' do
  #     it "scales down an image to be no larger than 150 by 150 pixels" do
  #       expect(@child.image.small).to be_no_larger_than(150, 150)
  #     end
  #   end
  #
  #   describe '.medium' do
  #     it "scales down an image to be no larer than 200 by 200 pixels" do
  #       expect(@child.image.medium).to be_no_larger_than(200, 200)
  #     end
  #   end
  #
  #   describe '.large' do
  #     it "scales down a landscape image to be no larger than 500 by 450 pixels" do
  #       expect(@child.image.large).to be_no_larger_than(500, 450)
  #     end
  #   end
end
