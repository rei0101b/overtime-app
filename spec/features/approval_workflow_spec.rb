require 'rails_helper'

describe 'navigate' do
  before do 
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'has a status that can be edited on the form by admin' do
      visit edit_post_path(@post)

      choose 'post_status_approved'
      click_on 'Save'

      expect(@post.reload.status).to eq('approved')
    end

    it 'can be  edited by an admin' do

    end

    it 'cannot be edited by a none admin' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end