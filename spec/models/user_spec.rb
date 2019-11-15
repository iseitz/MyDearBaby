# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.create(:user) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
    it { is_expected.to have_many(:children) }
    it { is_expected.to have_many(:reminders) }
  end
  context 'it has admin role' do
    before(:each) do
      @user = FactoryBot.create(:user, role: 'admin')
    end
    after(:each) do
      @user.destroy
    end

    it 'is admin if the role is admin' do
      expect(@user.can?('remove_user')).to eq(true)
      expect(@user.can?('edit_any_note')).to eq(true)
      expect(@user.can?('remove_any_note')).to eq(true)
      expect(@user.can?('remove_any_image')).to eq(true)
      expect(@user.can?('edit_own_note')).to eq(true)
      expect(@user.can?('edit_own_child')).to eq(true)
      expect(@user.can?('create_own_note')).to eq(false)
      expect(@user.can?('create_own_child')).to eq(false)
      expect(@user.can?('create_own_image')).to eq(false)
      expect(@user.can?('remove_own_note')).to eq(true)
      expect(@user.can?('remove_own_child')).to eq(true)
      expect(@user.role).to eq('admin')
      expect(@user.role).to_not eq('member')
    end

    it 'is not member or moderator if the role is admin' do
      expect(@user.role).to eq('admin')
      expect(@user.role).to_not eq('member')
      expect(@user.role).to_not eq('moderator')
    end
  end

  context 'it has member role' do
    before(:each) do
      @user = FactoryBot.create(:user)
    end

    it 'is member if the role is member' do
      expect(@user.can?('remove_user')).to eq(false)
      expect(@user.role).to eq('member')
      expect(@user.can?('edit_own_note')).to eq(true)
      expect(@user.can?('edit_own_child')).to eq(true)
      expect(@user.can?('create_own_note')).to eq(true)
      expect(@user.can?('create_own_child')).to eq(true)
      expect(@user.can?('create_own_image')).to eq(true)
      expect(@user.can?('remove_own_note')).to eq(true)
      expect(@user.can?('remove_own_child')).to eq(true)
      expect(@user.can?('edit_any_note')).to eq(false)
      expect(@user.can?('edit_any_child')).to eq(false)
      expect(@user.can?('create_any_image')).to eq(false)
      expect(@user.can?('remove_any_image')).to eq(false)
      expect(@user.can?('remove_user')).to eq(false)
    end

    it 'is not admin or moderator if the role is member' do
      expect(@user.role).to_not eq('admin')
      expect(@user.role).to_not eq('moderator')
    end
  end

  context 'it has moderator role' do
    before(:each) do
      @user = FactoryBot.create(:user, role: 'moderator')
    end

    it 'is moderator if the role is moderator' do
      expect(@user.role).to eq('moderator')
      expect(@user.can?('edit_own_note')).to eq(false)
      expect(@user.can?('edit_own_child')).to eq(false)
      expect(@user.can?('create_own_note')).to eq(false)
      expect(@user.can?('create_own_child')).to eq(false)
      expect(@user.can?('create_own_image')).to eq(false)
      expect(@user.can?('remove_own_note')).to eq(false)
      expect(@user.can?('remove_own_child')).to eq(false)
      expect(@user.can?('edit_any_note')).to eq(false)
      expect(@user.can?('edit_any_child')).to eq(false)
      expect(@user.can?('create_any_image')).to eq(false)
      expect(@user.can?('remove_any_image')).to eq(true)
      expect(@user.can?('remove_any_note')).to eq(true)
      expect(@user.can?('remove_user')).to eq(false)
    end

    it 'is not admin or member if the role is moderator' do
      expect(@user.role).to eq('moderator')
      expect(@user.role).to_not eq('admin')
      expect(@user.role).to_not eq('member')
    end
  end

  context 'user has relations with children and reminders' do
    it 'has onwe or more children' do
      @user1 = FactoryBot.create(:user)
      @child = FactoryBot.create(:child, user: @user1)
      @user2 = FactoryBot.build(:user, :with_children)
      expect(@user1.children.size).to eq(1)
      expect(@user2.children.size).to eq(3)
    end

    it 'has many reminders' do
      @user = FactoryBot.create(:user)
      @child = FactoryBot.create(:child)
      @reminder = FactoryBot.create(:reminder, user: @user, child: @child)
      @user2 = FactoryBot.build(:user, :with_reminders)
      expect(@user.reminders.size).to eq(1)
      expect(@user2.reminders.size).to eq(3)
    end
  end


  # context 'it can have #avatar attached to the profile in four different sizes' do
  #   let(:user){ create(:user, :with_avatar)}
  #
  #   it "has an image/avatar included" do
  #
  #
  #     expect(user.avatar).to be_attached
  #   end

    # describe '.thumb' do
    #   it "scales down an image to be no larger than 50 by 50 pixels" do
    #     expect(@user.image.thumb).to be_no_larger_than(50, 50)
    #   end
    # end
    #
    # describe '.small' do
    #   it "scales down an image to be no larger than 150 by 150 pixels" do
    #     expect(@user.image.small).to be_no_larger_than(150, 150)
    #   end
    # end
    #
    # describe '.medium' do
    #   it "scales down an image to be no larer than 200 by 200 pixels" do
    #     expect(@user.image.medium).to be_no_larger_than(200, 200)
    #   end
    # end
    #
    # describe '.large' do
    #   it "scales down a landscape image to be no larger than 500 by 450 pixels" do
    #     expect(@user.image.large).to be_no_larger_than(500, 450)
    #   end
  # end



end
