# frozen_string_literal: true

ROLES = %w[member admin moderator].freeze
RIGHTS = %w[edit_own_note remove_own_note edit_any_note remove_any_note remove_own_image remove_any_image create_own_child create_any_child edit_own_child edit_any_child remove_own_child remove_any_child remove_user].freeze
@admins = Rbac.where(role: 'admin')
@members = Rbac.where(role: 'member')
@moderators = Rbac.where(role: 'moderator')

if @admins.empty?
  puts 'Seeding admins rbac'
  Rbac.create!(role: 'admin',
               rights: 'edit_own_note, remove_own_note, edit_any_note, remove_any_note, remove_own_image, remove_any_image, edit_own_child, edit_any_child, remove_own_child, remove_any_child, remove_user')
end

if @members.empty?
  puts 'Seeding memebers rbac'
  Rbac.create!(role: 'member',
               rights: 'create_own_note, create_own_child, create_own_image, edit_own_note, remove_own_note, edit_own_image, remove_own_image, create_own_child, edit_own_child, remove_own_child')
end

if @moderators.empty?
  puts 'Seeding moderators rbac'
  Rbac.create!(role: 'moderator',
               rights: 'remove_any_note, remove_any_image')
end
