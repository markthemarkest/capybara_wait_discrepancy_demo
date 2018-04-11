require 'spec_helper'

describe 'capybara' do

  before do
    visit 'http://localhost:4201'
  end

  describe 'content based matchers' do
    it 'pass immediately with not_to have_content' do
      expect(page).not_to have_content 'Welcome to app!'
    end

    it 'pass immediately with to have_no_content' do
      expect(page).to have_no_content 'Welcome to app!'
    end

    it 'wait properly with not_to have_content' do
      expect(page).not_to have_content 'Welcome to Bikes!'
    end

    it 'wait properly with to have_no_content' do
      expect(page).to have_no_content 'Welcome to Bikes!'
    end

    it 'pass immediately with to have_content' do
      expect(page).to have_content 'Welcome to app!'
    end

    it 'wait appropriately with to have_content' do
      expect(page).to have_content 'Welcome to Bikes!'
    end
  end

  describe 'css based matchers' do
    it 'pass immediately with not_to have_css' do
      expect(page).not_to have_css '#thing'
    end

    it 'pass immediately with to have_no_css' do
      expect(page).to have_no_css '#thing'
    end

    it 'wait appropriately with to have_css' do
      expect(page).to have_css '#thing'
    end

    it 'wait appropriately with not_to have_css' do
      expect(page).not_to have_css '#thing2'
    end

    it 'wait appropriately with to have_no_css' do
      expect(page).to have_no_css '#thing2'
    end

    it 'pass immediately with to have_css' do
      expect(page).to have_css '#thing2'
    end
  end


end
