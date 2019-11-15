require 'rails_helper'

RSpec.describe Rbac, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:rights) }

  end

    context 'it has roles and assosiated with roles rights' do
      before(:each) do
        @admin = Rbac.create(role: 'admin', rights: 'edit_own_note, remove_own_note, edit_any_note, remove_any_note, remove_own_image, remove_any_image, edit_own_child, edit_any_child, remove_own_child, remove_any_child, remove_user')
        @member = Rbac.create(role: 'member', rights: 'create_own_note, create_own_child, create_own_image, edit_own_note, remove_own_note, edit_own_image, remove_own_image, create_own_child, edit_own_child, remove_own_child')
        @moderator = Rbac.create(role: 'moderator', rights: 'remove_any_note, remove_any_image')
        @admin_user = FactoryBot.create(:user, role: 'admin')
        @member_user = FactoryBot.create(:user, role: 'member')
        @moderator_user = FactoryBot.create(:user, role: 'moderator')
      end
      after(:each) do
        @admin.destroy
        @member.destroy
        @moderator.destroy
        @admin_user.destroy
        @member_user.destroy
        @moderator_user.destroy
      end

      it 'has a member role that can create, update edit and remove only own attributes' do

        expect(@member.rights).to_not include('remove_any_note')
        expect(@member.rights).to_not include('edit_any_note')
        expect(@member.rights).to_not include('remove_any_image')
        expect(@member.rights).to_not include('remove_any_child')
        expect(@member.rights).to include('remove_own_image')
        expect(@member.rights).to include('remove_own_note')
        expect(@member.rights).to include('edit_own_child')
        expect(@member_user.can?('remove_user')).to_not eq(true)
        expect(@member_user.can_many?(['remove_own_child', 'edit_own_child', 'update_own_child', 'create_own_child'] )).to eq(true)
      end

      it 'has an admin role that can edit and remove own and any attributes' do

        expect(@admin.rights).to include('remove_any_note')
        expect(@admin.rights).to include('edit_any_note')
        expect(@admin.rights).to include('remove_any_image')
        expect(@admin_user.can?('remove_user')).to eq(true)
      end

      it 'has  a moderator role that can remove any note and or image' do

        expect(@moderator.rights).to_not include('remove_own_note')
        expect(@moderator.rights).to_not include('edit_any_note')
        expect(@moderator.rights).to_not include('remove_user')
        expect(@moderator.rights).to_not include('remove_any_child')
        expect(@moderator.rights).to include('remove_any_image')
        expect(@moderator.rights).to include('remove_any_note')
        expect(@moderator_user.can?('remove_user')).to_not eq(true)
        expect(@moderator_user.can_many?(['remove_any_note', 'remove_any_image'] )).to eq(true)
        expect(@moderator_user.can_many?(['remove_own_child', 'edit_own_child', 'update_own_child', 'create_own_child'] )).to eq(false)
      end

  end
end
