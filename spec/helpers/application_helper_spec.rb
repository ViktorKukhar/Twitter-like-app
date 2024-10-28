require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_classes' do
    context 'when the flash type is notice' do
      it 'returns the correct class for notice' do
        expect(helper.flash_classes('notice')).to eq('notice')
      end
    end

    context 'when the flash type is alert' do
      it 'returns the correct class for alert' do
        expect(helper.flash_classes('alert')).to eq('alert')
      end
    end

    context 'when the flash type is unknown' do
      it 'returns the default class for unknown types' do
        expect(helper.flash_classes('unknown')).to eq('tweet-error')
      end
    end
  end
end
